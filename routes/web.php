<?php

use App\Http\Controllers\AdminConsole\MenuController;
use App\Http\Controllers\AdminConsole\PermissionController;
use App\Http\Controllers\AdminConsole\UserRoleController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;
 

Route::redirect('/', 'dashboard');
Route::middleware('auth')->group(function () {
    Route::get('dashboard', [DashboardController::class, 'index'])->name('dashboard');

    Route::middleware('role_permission_check')->group(function () {
        Route::resource('users', UserController::class);
        Route::post('users/update-status/{id}', [UserController::class, 'updateStatus'])->name('users.update-status');
        Route::post('users/reset-password/{id}', [UserController::class, 'resetPassword'])->name('users.reset-password');  
        Route::get('users/{user}/password-reset', [UserController::class, 'passwordReset'])->name('users.password-reset');
        Route::get('users/role-wise-users/{role_slug}/{supervisor_user_code?}', [UserController::class, 'role_wise_users'])->name('users.role-wise-users');
        Route::post('users-bulk-upload', [UserController::class, 'bulkUpload'])->name('users.bulk-upload');

        Route::prefix('admin-console')
            ->middleware(['admin_console_access'])
            ->group(function () {
                Route::resource('menus', MenuController::class)->only(['index', 'store', 'update', 'destroy']);
                Route::delete('permissions/{permission}/destroy-not-exists', [PermissionController::class, 'destroy_not_exists'])->name('permissions.destroy-not-exists');
                Route::resource('permissions', PermissionController::class)->only(['index', 'store', 'update', 'destroy']);
                Route::get('sync-permissions', [PermissionController::class, 'syncPermissions'])->name('permissions.sync');
                Route::get('sync-controller-permissions/{permission}', [PermissionController::class, 'sync_controller_permissions'])->name('permissions.sync-controller-permissions');
                Route::resource('user-roles', UserRoleController::class)->only(['index', 'store', 'update', 'destroy']);
                Route::get('user-roles/{user_role}/config', [UserRoleController::class, 'config'])->name('user-roles.config');
                Route::put('user-roles/{user_role}/update-menus', [UserRoleController::class, 'updateMenus'])->name('user-roles.update-menus');
                Route::put('user-roles/{user_role}/update-permissions', [UserRoleController::class, 'updatePermissions'])->name('user-roles.update-permissions');
                Route::get('system-info', [UserRoleController::class, 'system_info'])->name('system-info');
            });
        
    });
});

require __DIR__ . '/auth.php';
