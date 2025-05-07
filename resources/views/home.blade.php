@extends('layouts.app')

@section('content')
@include('layouts.menu')
<div class="w3-main" style="margin-left:200px">
    <div class="w3-teal">
        <button class="w3-button w3-teal w3-xlarge w3-hide-large" onclick="w3_open()">&#9776;</button>
        <div class="w3-container">
            <h1 class="text-center">Doctors</h1>
        </div>
    </div>

    <div class="w3-container">
        <div class="card-body">
            <form method="POST" action="{{ route('add_doctor') }}">
                @csrf

                <div class="row mb-3">
                    <label for="name" class="col-md-4 col-form-label text-md-end">{{ __('Name') }}</label>

                    <div class="col-md-6">
                        <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                        @error('name')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="date" class="col-md-4 col-form-label text-md-end">{{ __('Available Date') }}</label>

                    <div class="col-md-6">
                        <input id="multiDatePicker" type="text" class="form-control @error('dates') is-invalid @enderror" name="dates">
                        <!-- <input id="Date" type="date" class="form-control @error('date') is-invalid @enderror" name="date" value="{{ old('date') }}" required autocomplete="date"> -->
                        @error('dates')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                </div>

                <div class="row mb-3">
                    <label for="specialization" class="col-md-4 col-form-label text-md-end">{{ __('specialization') }}</label>

                    <div class="col-md-6">
                        <input id="specialization" type="text" class="form-control @error('specialization') is-invalid @enderror" name="specialization" value="{{ old('specialization') }}" required autocomplete="specialization">

                        @error('specialization')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="conslt_days" class="col-md-4 col-form-label text-md-end">{{ __('Consultation Days') }}</label>

                    <div class="col-md-6">
                        <select name="conslt_days[]" id="conslt_days" multiple>
                            <option value="monday">Monday</option>
                            <option value="WednesDay">WednesDay</option>
                            <option value="friday">Friday</option>
                        </select>
                        <p>Hold down the control (ctrl) button to select multiple options</p>
                        @error('conslt_days')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="conslt_time" class="col-md-4 col-form-label text-md-end">{{ __('Consultation Time') }}</label>

                    <div class="col-md-6">
                        <select name="time_frame[]" id="time_frame" multiple>
                            <option value="9.30AM-12.30PM">9.30AM-12.30PM</option>
                            <option value="12.30PM-1.30PM">12.30PM-3.30PM</option>
                            <option value="1.30PM-3.30PM">12.30PM-3.30PM</option>
                            <option value="3.30PM-5.30PM">3.30PM-5.30PM</option>
                        </select>
                        <p>Hold down the control (ctrl) button to select multiple options</p>
                        @error('conslt_days')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                </div>

                <div class="row mb-0">
                    <div class="col-md-6 offset-md-4">
                        <button type="submit" class="btn btn-primary">
                            {{ __('Submit') }}
                        </button>
                        <button type="cancel" class="btn btn-danger">
                            {{ __('Cancel') }}
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <h2>Doctor Table</h2>

    <table>
        <tr>
            <th>Doctor Name</th>
            <th>Date</th>
            <th>Specialization</th>
            <th>Available Days</th>
            <th>Time Solt</th>
        </tr>
        @foreach($doctors as $doctor)
        <?php
        
         
         ?>
        <tr>
            <td>{{$doctor->name}}</td>
            <td>{{$doctor->date}}</td>
            <td>{{$doctor->specialization}}</td>
            <td>{{$doctor->consult_days}}</td>
            <td>{{$doctor->time_frame}}</td>
        </tr>
        @endforeach
    </table>

</div>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
    flatpickr("#multiDatePicker", {
        mode: "multiple",
        dateFormat: "Y-m-d"
    });
</script>


@endsection
