<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserUpdateTracker extends Model
{
    protected $fillable = ['user_id', 'previous_data', 'changed_data', 'updated_by'];

    protected $casts = [
        'previous_data' => 'array',
        'changed_data' => 'array',
    ];
}
