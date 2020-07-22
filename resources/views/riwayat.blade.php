@extends('layouts.auth')
@section('css')
    @parent
    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/core/menu/menu-types/vertical-menu.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/core/colors/palette-gradient.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/pages/dashboard-analytics.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/pages/card-analytics.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/plugins/tour/tour.css')}}">

    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/tables/datatable/datatables.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/core/menu/menu-types/horizontal-menu.css')}}">
    <!-- END: Page CSS-->
@endsection
@section('content')
    <!-- BEGIN: Content-->
    <div class="app-content content mb-5">
        <div class="content-overlay"></div>
         <div class="header-navbar-shadow d-none d-md-block"></div>
        <div class="mt-1 d-none d-md-block"></div>
        <div class="content-wrapper mt-0">
            <div class="mt-5 d-none d-md-block"></div>
            <div class="content-header row">
            </div>
            <div class="content-body">
                
                <!-- Dashboard Analytics Start -->
                <section id="dashboard-analytics">
                    <div class="row" id="table-hover-row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <h4 class="card-title">Lihat Riwayat / History Transaksi</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @foreach ($category as $cat)
                        <div class="col-3 d-none d-md-block col-sm-3">
                            <div class="card text-center">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="p-50 m-0 mt-1 mb-3">
                                                    <div class="avatar-content">
                                                        <i class="{{$cat->icon}} text-primary font-large-5"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">                                                
                                                <a href={{ $site['url']."/history/".$cat->slug }} class="btn btn-block btn-outline-primary mb-0 waves-effect waves-light">
                                                    {{$cat->name }}
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3 mb-1 d-md-none">
                            <a href={{ $site['url']."/history/".$cat->slug }} class="btn d-flex justify-content-center align-self-center btn-primary btn-lg btn-round">
                                <i class="{{$cat->icon}} text-bold"></i>
                            </a>
                            <h5 class="mt-50 text-bold text-center">{{$cat->name}}</h5>
                        </div>
                        @endforeach

                    </div>
                </section>
            </div>
        </div>
    </div>
@endsection

@section('js')
@parent
@endsection