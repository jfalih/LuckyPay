@extends('layouts.auth')
@section('css')
@parent
    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/core/menu/menu-types/vertical-menu.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/core/colors/palette-gradient.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/pages/dashboard-analytics.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/pages/card-analytics.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/plugins/tour/tour.css')}}">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/pages/invoice.min.css">
    <!-- END: Page CSS-->
@endsection
@section('content')
<div class="app-content content mb-5">
    <div class="content-overlay"></div>
        <div class="header-navbar-shadow d-none d-md-block"></div>
        <div class="mt-1 d-none d-md-block"></div>
        <div class="content-wrapper mt-0">
            <div class="mt-5 d-none d-md-block"></div>
        <div class="content-header row">
        </div>
        <div class="content-body">
            @foreach ($detail as $item)
            <section class="card invoice-page">
                <div id="invoice-template" class="card-body">
                <!-- Invoice Company Details -->
                <div id="invoice-company-details" class="row">
                    <div class="col-sm-6 col-12 text-left pt-1">
                    <div class="media pt-1">
                        <img src={{$site->url.'/storage/'.$site->image}} alt="company logo">
                    </div>
                    </div>
                    <div class="col-sm-6 col-12 text-right">
                    <h1>Invoice</h1>
                    <div class="invoice-details mt-2">
                        <h6>INVOICE ID.</h6>
                        <p>{{$item->id}}</p>
                        <h6 class="mt-2">INVOICE DATE</h6>
                        <p>{{$item->created_at}}</p>
                    </div>
                    </div>
                </div>
                <!--/ Invoice Company Details -->
            
                <!-- Invoice Recipient Details -->
                <div id="invoice-customer-details" class="row pt-2">
                    <div class="col-sm-12 col-12 text-right mb-5">
                        <h5>Status</h5>
                        @if ($item->status === 'pending')
                            <div class="badge badge-warning badge-lg p-1">
                                Menunggu
                            </div>
                        @endif
                        @if ($item->status === 'canceled')
                        <div class="badge badge-danger badge-lg p-1">
                                Dibatalkan
                        </div>
                        @endif
                        @if ($item->status === 'success')
                        <div class="badge badge-success badge-lg p-1">
                                Sukses
                        </div>
                        @endif
                    </div>
                    <div class="col-sm-6 col-12 text-left">
                    <h5>Pembeli</h5>
                    <div class="recipient-info my-2">
                        <p>{{$item->user->name}}</p>
                    </div>
                    <div class="recipient-contact pb-2">
                        <p>
                        <i class="feather icon-mail"></i>
                        {{$item->user->email}}
                        </p>
                        <p>
                        <i class="feather icon-globe"></i>
                        {{$item->user->level}}
                        </p>
                    </div>
                    </div>
                    <div class="col-sm-6 col-12 text-right">
                    <h5>{{$site->name}}</h5>
                    <div class="company-info my-2">
                        <p>{{$site->url}}</p>
                    </div>
                    </div>
                </div>
                <!--/ Invoice Recipient Details -->
            
                <!-- Invoice Items Details -->
                <div id="invoice-items-details" class="pt-1 invoice-items-table">
                    <div class="row">
                    <div class="table-responsive col-12">
                        <table class="table table-borderless">
                        <thead>
                            <tr>
                            <th>SERVICE</th>
                            <th>QUANTITY</th>
                            <th>TARGET</th>
                            <th>HARGA LAYANAN</th>
                            <th>TOTAL</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                            <td>{{$service->name}}</td>
                            <td>{{number_format($item->quantity)}}</td>
                            <td>{{$item->target}}</td>
                            <td>Rp{{number_format($service->price/1000,2,',','.')}}</td>
                            <td>Rp{{number_format($item->price,2,',','.')}}</td>
                            </tr>
                        </tbody>
                        </table>
                    </div>
                    </div>
                </div>
                </div>
            </section>
            @endforeach
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
@endsection