<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('td_sale_orders', function (Blueprint $table) {
            $table->id('td_sale_order_id');
            $table->string('td_sale_order_code')->unique();
            $table->string('customer')->nullable();
            $table->string('status')->nullable();
            $table->string('src')->nullable();
            $table->string('order_type')->nullable();
            $table->string('payment_type')->nullable();
            $table->dateTime('time')->nullable();
            $table->string('discount')->nullable();
            $table->string('card_no')->nullable();
            $table->string('card_holder_name')->nullable();
            $table->foreignId('user_id')->on('users')->nullable();
            $table->string('order_amount');
            $table->foreignId('cd_client_id')->on('cd_clients');
            $table->foreignId('cd_brand_id')->on('cd_brands');
            $table->foreignId('cd_branch_id')->on('cd_branchs');
            $table->boolean('is_active');
            $table->string('created_by');
            $table->string('updated_by');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('td_sale_orders');
    }
};
