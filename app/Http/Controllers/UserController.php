<?php

namespace App\Http\Controllers;


use App\Models\Role;
use App\Models\Territory;
use App\Models\TerritoryType;
use App\Models\User;
use App\Models\RoleUser;
use App\Services\FileUploadService;
use App\Services\UserService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use PhpOffice\PhpSpreadsheet\IOFactory;
use Yajra\DataTables\DataTables;

class UserController extends Controller
{
    public function __construct(protected FileUploadService $fileUploadService, protected UserService $userService) {}

    public function index()
    {
        if (request()->wantsJson()) {
            $users = User::query()
                ->with('role')
                ->when(request()->role_id, function ($q) {
                    $q->where('primary_role_id', request()->role_id);
                })
                ->where('primary_role_id','!=', 1)
                ->staff();

            return DataTables::of($users)
                ->addIndexColumn()
                ->addColumn('image', function ($row) {
                    return '<img src="' . $row->photo_url . '" alt="customer Image" class="img-thumbnail rounded-circle" style="max-height: 70px; max-width: 70px; object-fit: cover;">';
                })
                ->editColumn('name', function ($row) {
                    return '<a href="' . route('users.show', $row->id) . '" class="text-primary text-hover-gray-700 fs-6 fw-bold">' . e($row->name) . '</a>
                        <br><small>User ID: ' . e($row->userid) . ' </small>';
                })
                ->editColumn('role', function ($row) {
                    return $row->role->title ?? '';
                })
                ->editColumn('status', function ($row) {
                    return $row->toggleButton(route('users.update-status', $row->id));
                })
                ->addColumn('action', function ($row) {
                    $btn = '';

                    $btn .= '<a href="' . route('users.password-reset', ['user' => $row->id]) . '"
                        title="Reset Password"
                        onClick="return confirmPasswordReset()"
                        class="btn btn-light-success btn-icon btn-sm me-2"><i class="fas fa-key"></i></a>';

                    $btn .= $row->editButton(route('users.edit', ['user' => $row->id]));
                    $btn .= $row->deleteButton(route('users.destroy', ['user' => $row->id]));

                    return $btn;
                })
                ->editColumn('last_login', function ($row) {
                    return $row->last_login ? $row->last_login->format('d M Y h:i a') : '-';
                })
                ->rawColumns(['status', 'action', 'name', 'image'])
                ->make(true);
        }

        $roles = Role::active()
            ->where('slug', '!=', 'admin')
            ->get();

        return view('users.index', compact('roles'));
    }

    public function create()
    {
        $roles = Role::active()
            ->where('slug', 'user')
            ->get();
        return view('users.create', compact('roles'));
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => ['required', 'string', 'max:150'],
            'designation' => ['required', 'string', 'max:200'],
            'userid' => ['required', 'string','max:40','unique:users,userid',],
            'phone' => ['required','regex:/^01[0-9]{9}$/','min:11','max:11',],
            'primary_role_id' => ['required', 'integer', 'exists:roles,id'],
            'dob' => ['required', 'date', 'before:today'],
            'email' => ['required', 'email', 'max:255', 'unique:users,email'],
            'gender' => ['required'],
        ], [
            'primary_role_id.required' => 'The `User type` field is required.',
        ]);

        try {
            $validated['password'] = Hash::make(env('USER_DEFAULT_PASSWORD', 'appinion'));
            $validated['company_id'] = session('company_id');

            DB::transaction(function () use ($validated) {

                $user = User::create($validated);

                DB::table('role_user')->insert([
                    'role_id' => $validated['primary_role_id'],
                    'user_id' => $user->id,
                    'is_primary' => 1,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            });

            flash()->success('Successfully created');

            return redirect()->route('users.index');
        } catch (\Exception $e) {
            flash()->error($e->getMessage());
        }

        return back()->withInput($request->all());
    }

    public function show(User $user)
    {
        return view('users.show', compact('user'));
    }

    public function edit(User $user)
    {
        $roles = Role::active()
            ->where('slug', 'user')
            ->get();
        return view('users.edit', compact('user', 'roles'));
    }

    public function update(Request $request, User $user)
    {
        $validated = $request->validate([
            'name' => 'required|max:150',
            'designation' => 'required|max:200',
            'phone' => ['nullable', 'regex:/^01[0-9]{9}$/'],
            'email' => ['required', 'email', 'max:255'],
            'dob' => ['required', 'date', 'before:today'],

        ]);

        try {

            if ($request->hasFile('photo')) {
                $validated['photo'] = $this->fileUploadService->upload('photo', 'user');
            }

            $validated['updated_by'] = auth()->id();

            $user->update($validated);

            flash()->success('Successfully updated');

            return redirect()->route('users.index');
        } catch (\Exception $e) {
            flash()->error($e->getMessage());
        }

        return back()->withInput($request->all());
    }

    public function destroy(User $user)
    {
        try {
            $user->userid = $user->userid . '_deleted_' . time();
            $user->save();

            $user->delete();
            flash()->success('User deleted successfully');
        } catch (\Exception $e) {
            flash()->error('User delete failed.');
        }

        return back();
    }

    public function updateStatus(Request $request, $id)
    {
        try {
            $user = User::findOrFail($id);
            $user->is_active = $request->toggle_input == 'true' ? 1 : 0;
            $user->save();

            return true;
        } catch (\Exception $e) {
            return false;
        }
    }

    public function passwordReset(User $user)
    {
        try {
            $user->password = Hash::make(env('USER_DEFAULT_PASSWORD'));
            $user->save();
            flash()->success('Password reset successfully');
        } catch (\Exception $e) {
            flash()->error($e->getMessage());
        }

        return back();
    }

    public function bulkUpload(Request $request)
    {
        $validator = \Validator::make($request->all(), [
            'user_bulk_excel' => 'required|file|mimes:xlsx,xls'
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        try {
            $rows = IOFactory::load($request->file('user_bulk_excel')->getPathname())
                ->getActiveSheet()
                ->toArray();

            // Expected columns: name, userid, gender, designation, phone, email, address, territory_id
            if (count($rows[0]) < 8) {
                return back()->withError('Invalid format. Required columns: name, userid, gender, designation, phone, email, address, territory_id');
            }

            $success = 0;
            $importErrors = [];

            foreach (array_slice($rows, 1) as $index => $row) {
                $line = $index + 2; 

                $name = trim($row[0] ?? '');
                $userid = trim($row[1] ?? '');
                $gender = strtolower(trim($row[2] ?? ''));
                $designation = trim($row[3] ?? '');
                $phone = trim($row[4] ?? '');
                $email = trim($row[5] ?? '');
                $address = trim($row[6] ?? '');


                if (empty($name) || empty($userid) || empty($designation) || empty($phone)) {
                    $importErrors[] = "Row $line: Missing required fields.";
                    continue;
                }

                if (User::where('userid', $userid)->exists()) {
                    $importErrors[] = "Row $line: User ID '$userid' already exists.";
                    continue;
                }

                try {
                    DB::beginTransaction();

                    $user = new User();

                    $user->name = $name;
                    $user->userid = $userid;
                    $user->gender = $gender === 'male' ? 1 : ($gender === 'female' ? 2 : null);
                    $user->designation = $designation;
                    $user->phone = $phone;
                    $user->email = $email;
                    $user->address = $address;
                    $user->password = Hash::make(env('USER_DEFAULT_PASSWORD', 'Appinion@2025'));
                    $user->company_id = session('company_id');
                    $user->is_active = 1;
                    $user->primary_role_id = Role::where('slug', 'user')->value('id');
                    $user->can_access_admin_panel = 0;
                    $user->is_password_changed = 0;
                    $user->created_at = now();
                    $user->updated_at = now();

                    $user->save();

                    $roleUser = new RoleUser();

                    $roleUser->role_id = Role::where('slug', 'user')->value('id');
                    $roleUser->user_id = $user->id;
                    $roleUser->is_primary = 1;
                    $roleUser->is_active = 1;
                    $roleUser->created_at = now();
                    $roleUser->updated_at = now();
                    $roleUser->save();

                    DB::commit();

                    $success++;
                } catch (\Throwable $e) {
                    DB::rollBack();
                    $importErrors[] = "Row $line: " . $e->getMessage();
                }
            }

            if ($success === 0) {
                return back()->withError("Import failed. All rows have errors.")
                            ->with('import_errors', $importErrors);
            }

            $message = "$success user(s) imported successfully.";
            if ($importErrors) $message .= " " . count($importErrors) . " row(s) skipped.";

            return back()->withSuccess($message)
                        ->with('import_errors', $importErrors);

        } catch (\Throwable $e) {
            return back()->withError("Import error: " . $e->getMessage());
        }
    }

    // This method sync user primary role in the `role_user` table
    public function sync_user_roles()
    {
        if (env('APP_ENV') != 'local') {
            return 'This route is for data migration purpose only. this will work only in local environment';
        }

        // read all users by chunk, check if user primary role exists on `role_user` table and insert if not exists
        User::query()
            ->with('roles')
            ->whereNotNull('primary_role_id')
            ->chunk(100, function ($users) {
                foreach ($users as $user) {
                    // $user_roles = $user->roles->pluck('id')->toArray();

                    // $user_primary_role = $user->roles->where('is_primary', 1)->first();

                    $role_exists = $user->roles->where('id', $user->primary_role_id)->first();

                    if (! $role_exists) {
                        DB::table('role_user')->insert([
                            'role_id' => $user->primary_role_id,
                            'user_id' => $user->id,
                            'is_primary' => 1,
                            'created_at' => now(),
                            'updated_at' => now(),
                        ]);
                    }
                }
            });

        return 'User role sync completed';
    }
}
