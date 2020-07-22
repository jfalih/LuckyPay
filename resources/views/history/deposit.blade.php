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
 <!-- BEGIN: Content-->
 <div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <section class="card invoice-page">
                <div id="invoice-template" class="card-body">
                  <!-- Invoice Company Details -->
                  <div id="invoice-company-details" class="row">
                    <div class="col-sm-6 col-12 text-left">
                      <div class="media d-flex justify-content-center">
                        <img width="350px" src={{$site->url.'/storage/'.$site->image}} alt={{$site->name}}>
                      </div>
                    </div>
                    <div class="col-sm-6 col-12 text-right">
                      <h1>Pembayaran {{$deposit->name}}</h1>
                      <div class="invoice-details mt-2">
                        <h6>ID Transaksi Pembayaran</h6>
                        <p>{{$history->id}}</p>
                        <h6 class="mt-2">Tanggal Pembayaran</h6>
                        <p>{{$history->created_at}}</p>
                      </div>
                    </div>
                  </div>
                  <!--/ Invoice Company Details -->
              
                  <!-- Invoice Recipient Details -->
                  <div id="invoice-customer-details" class="row pt-2">
                    <div class="col-sm-12 col-12 text-right mb-5">
                        <h5>Status</h5>
                        @if ($history->status === 'pending')
                            <div class="badge badge-warning badge-lg p-1">
                                Menunggu
                            </div>
                        @endif
                        @if ($history->status === 'canceled')
                        <div class="badge badge-danger badge-lg p-1">
                                Dibatalkan
                        </div>
                        @endif
                        @if ($history->status === 'success')
                        <div class="badge badge-success badge-lg p-1">
                                Sukses
                        </div>
                        @endif
                    </div>
                    <div class="col-sm-6 col-12 text-left">
                      <h5>Kirim Ke</h5>
                      <div class="recipient-info my-2">
                        <p>Rekening {{$deposit->rekening}}</p>
                        <p>An. {{$deposit->atas_nama}}</p>
                      </div>
                    </div>
                    <div class="col-sm-6 col-12 text-right">
                        <h5>Pengirim</h5>
                        <div class="company-info my-2">
                          <p>{{$history->user->name}}</p>
                          <p>{{$history->user->email}}</p>
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
                              <th>PEMESANAN</th>
                              <th>CATATAN</th>
                              <th>JUMLAH</th>
                              <th>PAJAK</th>
                              <th>SALDO DIDAPAT</th>
                            </tr>
                          </thead>
                          <tbody>
                            <tr>
                              <td>{{$deposit->name}}</td>
                              <td>Silahkan Transfer Ke {{$deposit->rekening}} | An. {{$deposit->atas_nama}}</td>
                              <td>Rp{{number_format($history->jumlah,2,',','.')}}</td>
                              <td>Rp{{number_format($history->kode_unik,2,',','.')}}</td>
                              <td id="getbalance"></td>
                            </tr>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                  <div id="invoice-total-details" class="invoice-total-table">
                    <div class="row">
                    <div class="col-sm-5">
                      <div class="media">
                        <img width="auto" height="120px" src={{$site->url.'/storage/'.$deposit->image}} alt={{$deposit->name}}>
                      </div>
                    </div>
                      <div class="col-sm-7 mt-2">
                        <div class="table-responsive">
                          <table class="table table-borderless">
                            <tbody>
                              <tr>
                                <th>Subtotal</th>
                                <td>Rp{{number_format($history->jumlah,2,',','.')}}</td>
                              </tr>
                              <tr>
                                <th>Pajak</th>
                                <td>Rp{{number_format($history->kode_unik,2,',','.')}}</td>
                              </tr>
                              <tr>
                                <th>Total</th>
                                <td>Rp{{number_format($history->jumlah + $history->kode_unik,2,',','.')}}</td>
                              </tr>
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div id="invoice-footer" class="text-right pt-3">
                    <p>Transfer ke rekening {{$deposit->rekening}} | An. {{$deposit->atas_nama}}. Jumlah total diatas hingga 3 angka terakhir.</p>
                    <p class="bank-details mb-0">
                        <div class="row">
                            <div class="col-md-2 offset-md-8">
                              <form method="POST" action={{$site->url.'/deposit/batalkan/'.$history->id}}>
                              @csrf
                                <button type="submit" class="btn btn-danger mr-1">Batalkan</button>
                              </form>
                            </div>
                            <div class="col-md-2">
                                <form method="POST" action="{{route('konfirmasi_deposit',$history->id)}}">
                                    @csrf
                                    <button type="submit" class="btn btn-primary">Konfirmasi</button>
                                </form>
                            </div>
                      </div>
                    </p>
                  </div>
                </div>
            </section>
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
    <script>
        var deposit = {!! json_encode($history->toArray()) !!}
        $('#getbalance').append('<td>' + deposit.jumlah * localStorage.getItem('rate')  + '</td>');
        </script>
@endsection