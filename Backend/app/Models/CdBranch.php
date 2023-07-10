<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CdBranch extends Model
{
    use HasFactory;
    protected $primaryKey = 'cd_branch_id';
    protected $guarded = ['cd_branch_id'];

    public function branch(){
        return $this->belongsTo(CdBranch::class, 'branch_id');
    }
}
