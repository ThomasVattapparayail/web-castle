<?php

namespace App\Http\Controllers;

use App\Models\Booking;
use App\Models\Consultation;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Request $request)
    {
        $date=$request->date;
        $minDate=Carbon::now()->format('Y-m-d');
        $maxDate=Carbon::now()->addDays(30)->format('Y-m-d');
        if($date){
            $doctors=User::leftJoin('consultations','consultations.user_id','=','users.id')
                       ->leftJoin('bookings','bookings.doc_id','=','users.id')
                       ->where('bookings.Booked_at','=',null)
                        ->where('specialization','!=',Null)
                        ->where('users.date','like','%'.$date.'%')
                        ->select('users.id as id','users.name as name','users.date as date','users.specialization as specialization','consultations.consult_days as consult_days','consultations.time_frame as time_frame','consultations.id as conslt_id')
                        ->get();
        }else{
            $doctors=User::leftJoin('consultations','consultations.user_id','=','users.id')
                       ->leftJoin('bookings','bookings.doc_id','=','users.id')
                       ->where('bookings.Booked_at','=',null)
                       ->where('specialization','!=',Null)
                       ->select('users.id as id','users.name as name','users.date as date','users.specialization as specialization','consultations.consult_days as consult_days','consultations.time_frame as time_frame','consultations.id as conslt_id')
                       ->get();
        }
        
        return view('welcome',compact('doctors','minDate','maxDate'));
    }

    public function docBooking($id,$conslt_id,$date)
    {
      $booking= Booking::Create([
          'doc_id'=>$id,
          'conslt_id'=>$conslt_id,
          'Booked_at'=>$date,
          'token'=>'BKD'.mt_rand(1, 10),
       ]);

       $token=$booking->token;
       return back()->with('token',$token);
    }
    
}
