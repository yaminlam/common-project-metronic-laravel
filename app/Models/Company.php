<?php

namespace App\Models;

use App\Services\FileUploadService;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
use App\Concerns\BuildsQueries;
use Illuminate\Database\Eloquent\SoftDeletes;


class Company extends Model
{
     use BuildsQueries, SoftDeletes;

    protected $fillable = [
        'name',
        'address',
        'phone',
        'is_active',
        'logo',
    ];

    protected static function boot() {
        parent::boot();

        static::creating(function ($company) {
            $company->slug = Str::slug($company->name) . '-' . now()->timestamp;
        });
    }

    public function getStatusTextAttribute()
    {
        $status = $this->is_active ? 'Active' : 'Inactive';
        $color = $this->is_active ? 'success' : 'danger';
        return "<span class='btn btn-light-{$color} btn-sm me-2'>{$status}</span>";
    }

    public function getLogoUrlAttribute()
    {
        return FileUploadService::getFileUrl($this->logo);
    }
}
