<?php

namespace App\Http\Controllers;

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

        return view('home',compact('doctors'));
    }

    public function addDoctors(Request $request)
    {
        $request->validate([
            'name'=>'required',
            'date'=>'required',
            'specialization'=>'required',
            'conslt_days.*'=>'required',
            'time_frame'=>'required'
        ]);

            $doctor =User::Create([
                'name'=>$request->name,
                'date'=>$request->date,
                'specialization'=>$request->specialization,
                ]);

           Consultation::Create([
                 'user_id'=>$doctor->id,
                 'consult_days'=>json_encode($request->conslt_days),
                 'time_frame'=>$request->time_frame
                  ]);
        return back();          

    }

   
}
