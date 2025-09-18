<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\CartController;
use App\Http\Controllers\Api\CustomerCheckInController;
use App\Http\Controllers\Api\CustomerController;
use App\Http\Controllers\Api\DraftController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\ProductCategoryController;
use App\Http\Controllers\Api\ProductController;
use Illuminate\Support\Facades\Route;

Route::post('login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('profile', [AuthController::class, 'profile']);
    Route::post('profile/update', [AuthController::class, 'updateProfile'])->name('profile.update');
    Route::post('profile/update-photo', [AuthController::class, 'updateProfilePhoto'])->name('profile.updatePhoto');
    Route::post('logout', [AuthController::class, 'logout']); // In routes/web.php or routes/api.php
    Route::post('change-password', [AuthController::class, 'changePassword']);
    Route::get('products', [ProductController::class, 'index']);
    Route::get('categories', [ProductCategoryController::class, 'index']);

    Route::get('check-in-list/{customer_id}', [CustomerCheckInController::class, 'index']);
    Route::get('check-in-view/{check_in_id}', [CustomerCheckInController::class, 'show']);
    Route::post('check-in', [CustomerCheckInController::class, 'store']);

    Route::get('customer-list', [CustomerController::class, 'index']);
    Route::get('customer-view/{customer_id}', [CustomerController::class, 'show']);

    Route::group(['prefix' => 'cart'], function () {
        Route::post('add', [CartController::class, 'add']);
        Route::post('show', [CartController::class, 'show']);
    });

    Route::group(['prefix' => 'orders'], function () {
        Route::post('create', [OrderController::class, 'create']);
    });
    Route::group(['prefix' => 'drafts'], function () {
        Route::post('create', [DraftController::class, 'create']);
    });
});
