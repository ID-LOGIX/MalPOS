<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TdSaleOrderItem extends Model
{
    use HasFactory;

    public function td_sale_order(){
        return $this->belongsTo(TdSaleOrder::class, 'td_sale_order_id');
    }


    public function md_product(){
        return $this->belongsTo(MdProduct::class, 'md_product_id');
    }
}
