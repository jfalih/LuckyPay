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
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                
                <!-- Dashboard Analytics Start -->
                <section id="dashboard-analytics">
                    <div class="row" id="table-hover-row">
                        <div class="col-sm-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Top 5 Users Deposit</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <p>Berikut merupakan top 5 user pengisian saldo / deposit.</p>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-hover mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Peringkat</th>
                                                    <th>Name</th>
                                                    <th>Total Deposit</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php $count = 1; ?>
                                                @forelse ($deposits->sortByDesc('total_deposit') as $item)
                                                @if ($count === 6)
                                                    @break
                                                @endif
                                                <tr>
                                                    <th scope="row">{{$count}}</th>
                                                    <td>{{$item->name}}</td>
                                                    <td>Rp{{number_format($item->total_deposit,2,',','.')}}</td>
                                                </tr>
                                                <?php $count++; ?>
                                                @empty
                                                <tr>
                                                    <td>Data Not Found</td>    
                                                <tr>
                                                @endforelse
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Top 5 Users Pemesanan Sosial Media</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <p>Berikut merupakan top 5 user pemesan sosial media.</p>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-hover mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Peringkat</th>
                                                    <th>Name</th>
                                                    <th>Total Pemesanan</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                                <?php $count = 1; ?>
                                                @forelse ($sosmed->sortByDesc('total_sosmed') as $item)
                                                    @if ($count === 6)
                                                        @break
                                                    @endif
                                                    <tr>
                                                        <th scope="row">{{$count}}</th>
                                                        <td>{{$item->name}}</td>
                                                        <td>{{$item->total_sosmed}}</td>
                                                    </tr>    
                                                    <?php $count++; ?>
                                                    @empty
                                                    <tr>
                                                        <td>Data Not Found</td>    
                                                    <tr>
                                                @endforelse
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>                 
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Top 5 Users Pemesanan Pulsa</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <p>Berikut merupakan top 5 user pemesanan pulsa.</p>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table table-hover mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Peringkat</th>
                                                    <th>Name</th>
                                                    <th>Total Pemesanan</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php $count = 1; ?>
                                                @forelse ($pulsa->sortByDesc('total_pulsa') as $item)
                                                    @if ($count === 6)
                                                        @break
                                                    @endif
                                                    <tr>
                                                        <th scope="row">{{$count}}</th>
                                                        <td>{{$item->name}}</td>
                                                        <td>{{$item->total_pulsa}}</td>
                                                    </tr>    
                                                    <?php $count++; ?>
                                                    @empty
                                                    <tr>
                                                        <td>Data Not Found</td>    
                                                    <tr>
                                                @endforelse
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
@endsection

@section('js')
@parent
@endsection