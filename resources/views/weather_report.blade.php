@extends('app')
@section('main_section')
    <h1 style="margin-bottom: 1.875rem">Weather Reports</h1>
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
