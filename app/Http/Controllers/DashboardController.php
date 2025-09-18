<?php

namespace App\Http\Controllers;

class DashboardController extends Controller
{
    public function index()
    {
        $role = session('role');
        $is_admin_user = auth()->user()->is_superuser == 0 && $role && $role->slug != 'admin' ? false : true;

        $new_requests = 0;

        $total_requests_count = 0;
        $total_drivers = 0;
        $total_vehicles = 0;

        return view('dashboard.index', compact('total_requests_count', 'new_requests', 'total_drivers', 'total_vehicles', 'is_admin_user'));
    }
}
