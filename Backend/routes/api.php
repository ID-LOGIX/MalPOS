<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CdClientController;
use App\Http\Controllers\CdUserController;
use App\Http\Controllers\CdBrandController;
use App\Http\Controllers\CdBranchController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\MdProductCategoryController;
use App\Http\Controllers\MdProductController;
use App\Http\Controllers\TdSaleOrderController;
use App\Http\Controllers\TdTaxCategoryController;
use App\Http\Controllers\TdTaxRateController;
use App\Http\Controllers\CdRoleController;
use App\Http\Controllers\MdBankController;
use App\Http\Controllers\MdBankAccountController;
use App\Http\Controllers\TdCurrencyController;






/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::resource('cdclients', CdClientController::class);

Route::group(['middleware' => 'auth:sanctum'],function(){
});


Route::get('product_category/{id?}', [MdProductCategoryController::class, 'index'])->name('product_category');
Route::get('product/{id?}', [MdProductController::class, 'index'])->name('product');

Route::post('product_category_store', [MdProductCategoryController::class, 'store'])->name('product_category_store');
Route::get('product_category_edit/{id}', [MdProductCategoryController::class, 'edit'])->name('product_category_edit');
Route::post('product_category_update/{id}', [MdProductCategoryController::class, 'update'])->name('product_category_update');
Route::delete('product_category_delete/{id}', [MdProductCategoryController::class, 'destroy'])->name('product_category_delete');

Route::get('tax_category/{id?}', [TdTaxCategoryController::class, 'index'])->name('tax_category');
Route::post('tax_category_store', [TdTaxCategoryController::class, 'store'])->name('tax_category_store');
Route::get('tax_category_edit/{id}', [TdTaxCategoryController::class, 'edit'])->name('tax_category_edit');
Route::post('tax_category_update/{id}', [TdTaxCategoryController::class, 'update'])->name('tax_category_update');
Route::delete('tax_category_delete/{id}', [TdTaxCategoryController::class, 'destroy'])->name('tax_category_delete');

Route::get('tax_rate/{id?}', [TdTaxRateController::class, 'index'])->name('tax_rate');
Route::post('tax_rate_store', [TdTaxRateController::class, 'store'])->name('tax_rate_store');
Route::get('tax_rate_edit/{id}', [TdTaxRateController::class, 'edit'])->name('tax_rate_edit');
Route::post('tax_rate_update/{id}', [TdTaxRateController::class, 'update'])->name('tax_rate_update');
Route::delete('tax_rate_delete/{id}', [TdTaxRateController::class, 'destroy'])->name('tax_rate_delete');
Route::post('product_store', [MdProductController::class, 'store'])->name('product_store');
Route::get('product_edit/{id}', [MdProductController::class, 'edit'])->name('product_edit');
Route::post('product_update/{id}', [MdProductController::class, 'update'])->name('product_update');
Route::delete('product_delete/{id}', [MdProductController::class, 'destroy'])->name('product_delete');


Route::post('save_order', [TdSaleOrderController::class, 'store'])->name('save_order');
Route::get('edit_order/{id}', [TdSaleOrderController::class, 'edit'])->name('edit_order');
Route::post('checkout_order/{id}', [TdSaleOrderController::class, 'checkout'])->name('checkout_order');
Route::post('update_order/{$id}', [TdSaleOrderController::class, 'update'])->name('update_order');
Route::delete('delete_order/{$id}', [TdSaleOrderController::class, 'destroy'])->name('delete_order');
Route::get('order_receipts/{filter?}', [TdSaleOrderController::class, 'receipt'])->name('order_receipts');
Route::get('check_order_receipt/{id}', [TdSaleOrderController::class, 'check_order_receipt'])->name('check_order_receipt');



Route::get('getuser', [UserController::class, 'index'])->name('user');
Route::post('user_store', [UserController::class, 'store'])->name('user_store');
Route::post('user_update/{id}', [UserController::class, 'update'])->name('user_update');
Route::get('user_edit/{id}', [UserController::class, 'edit'])->name('user_edit');
Route::delete('user_delete/{id}', [UserController::class, 'destroy'])->name('user_delete');
Route::post('user_login', [UserController::class, 'loginUser'])->name('user_login');

Route::post('role_store', [CdRoleController::class, 'store'])->name('role_store');
Route::get('admin_roles', [CdRoleController::class, 'index'])->name('admin_roles');
Route::get('client_roles', [CdRoleController::class, 'client_roles'])->name('client_roles');

Route::get('role_edit/{id}', [CdRoleController::class, 'edit'])->name('role_edit');
Route::post('role_update/{id}', [CdRoleController::class, 'update'])->name('role_update');
Route::delete('role_delete/{id}', [CdRoleController::class, 'destroy'])->name('role_delete');

Route::get('banks', [MdBankController::class, 'index'])->name('banks');
Route::post('bank_store', [MdBankController::class, 'store'])->name('bank_store');
Route::post('bank_update/{id}', [MdBankController::class, 'update'])->name('bank_update');
Route::get('bank_edit/{id}', [MdBankController::class, 'edit'])->name('bank_edit');
Route::delete('bank_delete/{id}', [MdBankController::class, 'destroy'])->name('bank_delete');

Route::get('bank_account', [MdBankAccountController::class, 'index'])->name('bank_account');
Route::post('bank_account_store', [MdBankAccountController::class, 'store'])->name('bank_account_store');
Route::post('bank_account_update/{id}', [MdBankAccountController::class, 'update'])->name('bank_account_update');
Route::get('bank_account_edit/{id}', [MdBankAccountController::class, 'edit'])->name('bank_account_edit');
Route::delete('bank_account_delete/{id}', [MdBankAccountController::class, 'destroy'])->name('bank_account_delete');

Route::get('currency', [TdCurrencyController::class, 'index'])->name('currency');
Route::post('currency_store', [TdCurrencyController::class, 'store'])->name('currency_store');
Route::post('currency_update/{id}', [TdCurrencyController::class, 'update'])->name('currency_update');
Route::get('currency_edit/{id}', [TdCurrencyController::class, 'edit'])->name('currency_edit');
Route::delete('currency_delete/{id}', [TdCurrencyController::class, 'destroy'])->name('currency_delete');



Route::post('store_pin', [UserController::class, 'storePin'])->name('store_pin');
Route::post('check_pin', [UserController::class, 'checkPin'])->name('check_pin');





Route::get('cdclient', [CdClientController::class, 'index'])->name('cdclient');
Route::post('cdclient_store', [CdClientController::class, 'store'])->name('cdclient_store');
Route::post('cdclient_update/{id}', [CdClientController::class, 'update'])->name('cdclient_update');
Route::get('cdclient_edit/{id}', [CdClientController::class, 'edit'])->name('cdclient_edit');
Route::delete('cdclient_delete/{id}', [CdClientController::class, 'destroy'])->name('cdclient_delete');

Route::get('cduser', [CdUserController::class, 'index'])->name('cduser');
Route::post('cduser_store', [CdUserController::class, 'store'])->name('cduser_store');
Route::post('cduser_update/{id}', [CdUserController::class, 'update'])->name('cduser_update');
Route::get('cduser_edit/{id}', [CdUserController::class, 'edit'])->name('cduser_edit');
Route::delete('cduser_delete/{id}', [CdUserController::class, 'destroy'])->name('cduser_delete');

Route::get('cdbrand', [CdBrandController::class, 'index'])->name('cdbrand');
Route::post('cdbrand_store', [CdBrandController::class, 'store'])->name('cdbrand_store');
Route::post('cdbrand_update/{id}', [CdBrandController::class, 'update'])->name('cdbrand_update');
Route::get('cdbrand_edit/{id}', [CdBrandController::class, 'edit'])->name('cdbrand_edit');
Route::delete('cdbrand_delete/{id}', [CdBrandController::class, 'destroy'])->name('cdbrand_delete');


Route::get('cdbranch', [CdBranchController::class, 'index'])->name('cdbranch');
Route::post('cdbranch_store', [CdBranchController::class, 'store'])->name('cdbranch_store');
Route::post('cdbranch_update/{id}', [CdBranchController::class, 'update'])->name('cdbranch_update');
Route::get('cdbranch_edit/{id}', [CdBranchController::class, 'edit'])->name('cdbranch_edit');
Route::delete('cdbranch_delete/{id}', [CdBranchController::class, 'destroy'])->name('cdbranch_delete');

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
