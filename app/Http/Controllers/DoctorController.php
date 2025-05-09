<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\Consultation;
use App\Models\User;
use Illuminate\Http\Request;

class DoctorController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $doctors=User::leftJoin('consultations','consultations.user_id','=','users.id')
                       ->where('specialization','!=',Null)
                       ->select('users.name as name','users.date as date','users.specialization as specialization','consultations.consult_days as consult_days','consultations.time_frame as time_frame')
                       ->get();

        $tokens= Booking::leftJoin('users','users.id',"=",'bookings.doc_id')
                        ->leftJoin('consultations','consultations.id','=','bookings.conslt_id')
                       ->select('users.name as doc_name','bookings.token as token','bookings.Booked_at as date','consultations.time_frame as time')
                       ->get();
        
        return view('home',compact('doctors','tokens'));
    }

    public function addDoctors(Request $request)
    {
        $request->validate([
            'name'=>'required',
            'dates.*'=>'required',
            'specialization'=>'required',
            'conslt_days.*'=>'required',
            'time_frame.*'=>'required'
        ]);
              
            $avlDays=explode(',',$request->dates);
            $time=$request->time_frame;
            $lastTime = end($time);
            $avalDay=$request->conslt_days;
            $lastDay = end($avalDay);
            foreach($avlDays as $key=>$days)
            {
                $currentTime = isset($time[$key]) ? $time[$key] : $lastTime;
                $currentDay = isset($avalDay[$key]) ? $avalDay[$key] : $lastDay; 
                $doctor = User::Create([
                    'name'=>$request->name,
                    'date'=>$days,
                    'specialization'=>$request->specialization,
                    ]);

                    Consultation::Create([
                        'user_id'=>$doctor->id,
                        'consult_days'=>$currentDay,
                        'time_frame'=>$currentTime
                     ]);
            }
            

           
        return back();          

    }

    // public function bookingsToken()
    // {
    //     $tokens= Booking::leftJoin('users','users.id',"=",'bookings.doc_id')
    //                       ->select('users.name as doc_name','bookings.token as token')
    //                       ->get();
         
    //  return view('home',compact('doctors'));                
   // }

   
}
