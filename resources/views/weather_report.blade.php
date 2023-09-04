@extends('app')
@section('main_section')
    
    <div id="app">
        <div class="row">
            <div class="col-md-6">
                <Weather />
            </div>
            <div class="col-md-6">
                <Statistics />
            </div>
        </div>
    </div>
@endsection
