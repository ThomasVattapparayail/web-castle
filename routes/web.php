<?php
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use PHPUnit\Framework\Attributes\Group;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [App\Http\Controllers\HomeController::class, 'index']);
Route::get('/doc_booking/{id}/{conslt_id}/{date}', [App\Http\Controllers\HomeController::class, 'docBooking'])->name('doctor_booking');


Auth::routes();
Route::middleware(['auth'])->Group(function(){
    Route::get('/home', [App\Http\Controllers\DoctorController::class, 'index'])->name('home');
    Route::post('/add_doctor', [App\Http\Controllers\DoctorController::class, 'addDoctors'])->name('add_doctor');
    //Route::get('/booking_token',[App\Http\Controllers\DoctorController::class, 'bookingsToken'])->name('tokens');
});

