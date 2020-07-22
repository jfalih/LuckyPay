@extends('layouts.auth')
@section('content')
 <!-- BEGIN: Content-->
 <div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <!-- Dashboard Analytics Start -->
    @switch($template->template)
        @case('pulsa')
            @yield('pulsa')
            @break
        @case('pln')
            @yield('pln')
            @break
        @case('sosmed')
            @yield('sosmed')
        @default
    @endswitch
        </div>
    </div>
 </div>
@endsection

@section('js')
@parent
    <!-- BEGIN: Page Vendor JS-->
    <script src="{{asset('app-assets/vendors/js/forms/select/select2.full.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/charts/apexcharts.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/extensions/tether.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/extensions/shepherd.min.js')}}"></script>
    <!-- END: Page Vendor JS-->


    <!-- BEGIN: Page JS-->
    <script src="{{asset('app-assets/js/scripts/pages/dashboard-analytics.js')}}"></script>
    
    <script src="{{asset('app-assets/js/scripts/forms/select/form-select2.min.js')}}"></script>
    <!-- END: Page JS-->
    
    @yield('barujs')

@endsection