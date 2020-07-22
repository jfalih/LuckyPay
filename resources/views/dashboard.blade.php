@extends('layouts.board')
@section('css')
@parent
    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/core/menu/menu-types/horizontal-menu.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/core/colors/palette-gradient.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/pages/dashboard-analytics.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/pages/card-analytics.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/plugins/tour/tour.css')}}">
    <!-- END: Page CSS-->
@endsection
@section('content')
                <!-- Dashboard Analytics Start -->
                <section id="dashboard-analytics">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <div class="card bg-analytics text-white">
                                <div class="card-content">
                                    <div class="card-body text-center">
                                        <img src="../../../app-assets/images/elements/decore-left.png" class="img-left" alt="card-img-left">
                                        <img src="../../../app-assets/images/elements/decore-right.png" class="img-right" alt="card-img-right">
                                        <div class="avatar avatar-xl bg-primary shadow mt-0">
                                            <div class="avatar-content">
                                                <i class="feather icon-award white font-large-1"></i>
                                            </div>
                                        </div>
                                        <div class="text-center">
                                            <h1 class="mb-2 text-white">Jan Falih Fadhillah</h1>
                                            <button type="button" class="btn btn-primary mr-1 mb-1 waves-effect waves-light">Back To Home</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="card">
                                <div class="card-header d-flex flex-column align-items-start pb-0">
                                    <div class="avatar bg-rgba-primary p-50 m-0">
                                        <div class="avatar-content">
                                            <i class="feather icon-users text-primary font-medium-5"></i>
                                        </div>
                                    </div>
                                    <?php $jumlah = 0; ?>
                                    @foreach ($order as $item)
                                    <?php
                                         $jumlah += $item->total;
                                    ?>
                                    @endforeach
                                    <h2 class="text-bold-700 mt-1 mb-25">{{$jumlah}}</h2>
                                    <p class="mb-0">Total Transaksi</p>
                                </div>
                                <div class="card-content">
                                    <div id="subscribe-gain-chart"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-12">
                            <div class="card">
                                <div class="card-header d-flex flex-column align-items-start pb-0">
                                    <div class="avatar bg-rgba-warning p-50 m-0">
                                        <div class="avatar-content">
                                            <i class="feather icon-package text-warning font-medium-5"></i>
                                        </div>
                                    </div>
                                    <?php $jumlah = 0; ?>
                                    @foreach ($deposit as $item)
                                    <?php
                                         $jumlah += $item->total;
                                    ?>
                                    @endforeach
                                    <h2 class="text-bold-700 mt-1 mb-25">{{$jumlah}}</h2>
                                    <p class="mb-0">Total Deposit</p>
                                </div>
                                <div class="card-content">
                                    <div id="deposits_by_jan"></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6 col-sm-12">
                            <div class="card">
                              <div class="card-content">
                                <div class="card-body">      
                             @if (Auth::user()->level = "developer")
                                <h5 class="mt-1">{{$site->name}}</h5>
                                  <p class="card-text">{{$site->url}}</p>
                            @else        
                                <h5 class="mt-1">{{Auth::user()->name}}</h5>
                                <p class="card-text">{{Auth::user()->level}}</p>
                            @endif
                                  <hr class="my-1">
                                  <div class="d-flex justify-content-between mt-2">
                                @if (Auth::user()->level = 'developer')
                                    <div class="float-left">
                                      <p class="font-medium-2 mb-0">Rp{{number_format($laba_bersih,2,',','.')}}</p>
                                      <p class="">Laba Bersih</p>
                                    </div>
                                    <div class="float-right">
                                      <p class="font-medium-2 mb-0">Rp{{number_format($laba_kotor,2,',','.')}}</p>
                                      <p class="">Laba Kotor</p>
                                    </div>
                                @else
                                    <div class="float-left">
                                      <p class="font-medium-2 mb-0">{{Auth::user()->total_deposit}}</p>
                                      <p class="">Total Deposit</p>
                                    </div>
                                    <div class="float-right">
                                      <p class="font-medium-2 mb-0">{{Auth::user()->total_sosmed + Auth::user()->total_pulsa}}</p>
                                      <p class="">Total Transaksi</p>
                                    </div>
                                @endif
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        <div class="col-md-6 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="mb-0">Transaksi Akhir</h4>
                                </div>
                                <div class="card-content">
                                    <div class="table-responsive mt-1">
                                        <table class="table table-hover-animation mb-0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Service</th>
                                                    <th>Status</th>
                                                    <th>Price</th>
                                                    <th>Last Updated</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php $jumlah = 0; ?>
                                                @foreach ($history as $value)
                                                @if ($jumlah === 5)
                                                    @break
                                                @endif
                                                <?php $jumlah++ ?>
                                                <tr>
                                                    <td>#{{$value->id}}</td>
                                                    <td>{{$value->service->name}}</td>
                                                    <td>
                                                        @if ($value->status === "pending")
                                                        <i class="fa fa-circle font-small-3 text-warning mr-50"></i>Pending        
                                                        @endif
                                                        @if ($value->status === "success")
                                                        <i class="fa fa-circle font-small-3 text-success mr-50"></i>Success            
                                                        @endif
                                                        @if ($value->status === "canceled")
                                                        <i class="fa fa-circle font-small-3 text-danger mr-50"></i>Canceled            
                                                        @endif
                                                    </td>
                                                    <td>{{$value->price}}</td>
                                                    <td>{{$value->updated_at}}</td>
                                                </tr>
                                                
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="mb-0">Deposit Akhir</h4>
                                </div>
                                <div class="card-content">
                                    <div class="table-responsive mt-1">
                                        <table class="table table-hover-animation mb-0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Deposit Name</th>
                                                    <th>Status</th>
                                                    <th>Price</th>
                                                    <th>Last Updated</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <?php $jumlah = 0; ?>
                                                @foreach ($history_deposit as $value)
                                                @if ($jumlah === 5)
                                                    @break
                                                @endif
                                                <?php $jumlah++ ?>
                                                <tr>
                                                    <td>#{{$value->id}}</td>
                                                    <td>{{$value->deposit->name}}</td>
                                                    <td>
                                                        @if ($value->status === "pending")
                                                        <i class="fa fa-circle font-small-3 text-warning mr-50"></i>Pending        
                                                        @endif
                                                        @if ($value->status === "success")
                                                        <i class="fa fa-circle font-small-3 text-success mr-50"></i>Success            
                                                        @endif
                                                        @if ($value->status === "canceled")
                                                        <i class="fa fa-circle font-small-3 text-danger mr-50"></i>Canceled            
                                                        @endif
                                                    </td>
                                                    <td>{{$value->jumlah}}</td>
                                                    <td>{{$value->updated_at}}</td>
                                                </tr>
                                                
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                </section>
                <!-- Dashboard Analytics end -->
@endsection
@section('js')
@parent

    <!-- BEGIN: Page Vendor JS-->
    <script src="../../../app-assets/vendors/js/ui/jquery.sticky.js"></script>
    <script src="../../../app-assets/vendors/js/charts/apexcharts.min.js"></script>
    <script src="../../../app-assets/vendors/js/extensions/tether.min.js"></script>
    <script src="../../../app-assets/vendors/js/extensions/shepherd.min.js"></script>
    <!-- END: Page Vendor JS-->
    <script>
      const site = {!! json_encode($site->toArray()) !!};
      const order = {!! json_encode($order) !!};
      const deposit = {!! json_encode($deposit) !!};
      var total_order = [];
      var total_deposit = [];
      order.forEach(function tampilOrder(item,index) {
         total_order.push(item.total);        
      });
      deposit.forEach(function tampilOrder(item,index) {
         total_deposit.push(item.total);        
      });
      var history = {!! json_encode($history->toArray()) !!};
        console.log(history);
        $(window).on("load", function () {
            var $primary = '#7367F0';        
            // Subscribers Gained Chart starts //
            // ----------------------------------
            var gainedChartoptions = {
            chart: {
                height: 100,
                type: 'area',
                toolbar: {
                show: false,
                },
                sparkline: {
                enabled: true
                },
                grid: {
                show: false,
                padding: {
                    left: 0,
                    right: 0
                }
                },
            },
            colors: [$primary],
            dataLabels: {
                enabled: false
            },
            stroke: {
                curve: 'smooth',
                width: 2.5
            },
            fill: {
                type: 'gradient',
                gradient: {
                shadeIntensity: 0.9,
                opacityFrom: 0.7,
                opacityTo: 0.5,
                stops: [0, 80, 100]
                }
            },
            series: [{
                name: 'Total Pemesanan',
                data: total_order
            }],
        
            xaxis: {
                labels: {
                show: false,
                },
                axisBorder: {
                show: false,
                }
            },
            yaxis: [{
                y: 0,
                offsetX: 0,
                offsetY: 0,
                padding: { left: 0, right: 0 },
            }],
            tooltip: {
                x: { show: false }
            },
            }
        
            var gainedChart = new ApexCharts(
            document.querySelector("#subscribe-gain-chart"),
            gainedChartoptions
            );
            gainedChart.render();
        
        // Subscribers Gained Chart ends //
        });
        
        $(window).on("load", function () {
            var $primary = '#ff9f43';        
            // Subscribers Gained Chart starts //
            // ----------------------------------
            var gainedChartoptions = {
            chart: {
                height: 100,
                type: 'area',
                toolbar: {
                show: false,
                },
                sparkline: {
                enabled: true
                },
                grid: {
                show: false,
                padding: {
                    left: 0,
                    right: 0
                }
                },
            },
            colors: [$primary],
            dataLabels: {
                enabled: false
            },
            stroke: {
                curve: 'smooth',
                width: 2.5
            },
            fill: {
                type: 'gradient',
                gradient: {
                shadeIntensity: 0.9,
                opacityFrom: 0.7,
                opacityTo: 0.5,
                stops: [0, 80, 100]
                }
            },
            series: [{
                name: 'Total Deposit',
                data: total_deposit
            }],
        
            xaxis: {
                labels: {
                show: false,
                },
                axisBorder: {
                show: false,
                }
            },
            yaxis: [{
                y: 0,
                offsetX: 0,
                offsetY: 0,
                padding: { left: 0, right: 0 },
            }],
            tooltip: {
                x: { show: false }
            },
            }
        
            var gainedChart = new ApexCharts(
            document.querySelector("#deposits_by_jan"),
            gainedChartoptions
            );
            gainedChart.render();
        
        // Subscribers Gained Chart ends //
        });
    </script>
    <!-- BEGIN: Page JS-->
    <script src="../../../app-assets/js/scripts/pages/dashboard-analytics.js"></script>
    <!-- END: Page JS-->

      
@endsection
