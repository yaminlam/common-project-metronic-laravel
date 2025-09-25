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
            ->whereIn('slug', ['user', 'admin'])
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
            // $validated['company_id'] = session('company_id');

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
        $request->validate([
            'user_bulk_excel' => 'required|file|mimes:xlsx,xls'
        ]);

        try {
            $rows = IOFactory::load($request->file('user_bulk_excel')->getPathname())
                ->getActiveSheet()
                ->toArray();

            if (empty($rows) || count($rows[0]) < 7) {
                return back()->withError('Invalid format. Required columns: name, userid, gender, designation, phone, email, address');
            }

            $success = 0;
            $errors = [];
            $userRoleId = Role::where('slug', 'user')->value('id');

            // Process each row (skip header)
            foreach (array_slice($rows, 1) as $index => $row) {
                $lineNumber = $index + 2;

                try {
                    $data = [
                        'name' => trim($row[0] ?? ''),
                        'userid' => trim($row[1] ?? ''),
                        'gender' => strtolower(trim($row[2] ?? '')),
                        'designation' => trim($row[3] ?? ''),
                        'phone' => trim($row[4] ?? ''),
                        'email' => trim($row[5] ?? ''),
                        'address' => trim($row[6] ?? ''),
                    ];

                    // Validate required fields
                    $required = ['name', 'userid', 'designation', 'phone'];
                    $missing = array_filter($required, fn($field) => empty($data[$field]));
                    
                    if ($missing) {
                        throw new \Exception('Missing required fields: ' . implode(', ', $missing));
                    }

                    // Check for duplicate userid
                    if (User::where('userid', $data['userid'])->exists()) {
                        throw new \Exception("User ID '{$data['userid']}' already exists");
                    }

                    // Validate email format if provided
                    if (!empty($data['email']) && !filter_var($data['email'], FILTER_VALIDATE_EMAIL)) {
                        throw new \Exception("Invalid email format");
                    }

                    // Create user in transaction
                    DB::transaction(function () use ($data, $userRoleId) {
                        $user = User::create([
                            'name' => $data['name'],
                            'userid' => $data['userid'],
                            'gender' => match($data['gender']) {
                                'male' => 1,
                                'female' => 2,
                                default => null
                            },
                            'designation' => $data['designation'],
                            'phone' => $data['phone'],
                            'email' => $data['email'],
                            'address' => $data['address'],
                            'password' => Hash::make(env('USER_DEFAULT_PASSWORD')),
                            // 'company_id' => session('company_id'),
                            'is_active' => 1,
                            'primary_role_id' => $userRoleId,
                            'can_access_admin_panel' => 0,
                            'is_password_changed' => 0,
                        ]);

                        RoleUser::create([
                            'role_id' => $userRoleId,
                            'user_id' => $user->id,
                            'is_primary' => 1,
                            'is_active' => 1,
                        ]);
                    });

                    $success++;

                } catch (\Exception $e) {
                    $errors[] = "Row $lineNumber: " . $e->getMessage();
                }
            }

            // Build response with detailed errors
            if ($success === 0) {
                $errorMessage = "Import failed. Found " . count($errors) . " error(s):\n";
                $errorMessage .= implode("\n", array_slice($errors, 0, 10)); // Show first 10 errors
                
                if (count($errors) > 10) {
                    $errorMessage .= "\n... and " . (count($errors) - 10) . " more errors.";
                }
                
                return back()
                    ->withError($errorMessage)
                    ->with('import_errors', $errors);
            }

            // Success with partial errors
            if ($errors) {
                $message = "$success user(s) imported successfully with " . count($errors) . " error(s):\n";
                $message .= implode("\n", array_slice($errors, 0, 5)); // Show first 5 errors
                
                if (count($errors) > 5) {
                    $message .= "\n... and " . (count($errors) - 5) . " more errors.";
                }
                
                return back()
                    ->withSuccess("$success user(s) imported successfully")
                    ->withError($message)
                    ->with('import_errors', $errors);
            }

            // Complete success
            return back()->withSuccess("$success user(s) imported successfully.");

        } catch (\Exception $e) {
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
