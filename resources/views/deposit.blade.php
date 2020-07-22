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
            <section id="basic-datatable">
                <div class="row">
                    <div class="col-12">
                        @if (session('error'))
                        <div class="alert alert-danger" role="alert">
                            <strong>Oops..!</strong> {{session('error')}}
                        </div>
                        @endif
                        @if (session('success'))
                        <div class="alert alert-success" role="alert">
                            <strong>Yihaa..!</strong> {{session('success')}}
                        </div>
                        @endif
                    </div>
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header d-flex align-items-start pb-0">
                                <div>
                                    <?php $jumlah = 0; ?>
                                    @foreach ($history->get() as $item)
                                        <?php
                                        $total =  $item->jumlah + $item->kode_unik;
                                        $jumlah += $total?>
                                    @endforeach
                                    <h2 class="text-bold-700 mb-0">Rp{{number_format($jumlah,2,',','.')}}</h2>
                                    <p>Dari {{$history->count()}} Deposits</p>
                                </div>
                                <div class="avatar bg-rgba-primary p-50 m-0">
                                    <div class="avatar-content">
                                        <i class="feather text-primary font-medium-5">Rp</i>
                                    </div>
                                </div>
                            </div> 
                            <div class="card-content">
                                <div class="table-responsive">
                                    <table class="table table-striped mb-0">
                                        <thead>
                                            <tr>
                                                <th scope="col">Total Deposit</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Total Jumlah Deposit</th>
                                            </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>{{Auth::user()->history_deposit->where('status','=','success')->count()}}</td>
                                            <td>
                                                <div class="badge badge-success">Success</div>
                                            </td>
                                            <td>
                                                <?php $jumlah = 0; ?>
                                                @forelse (Auth::user()->history_deposit->where('status','=','success') as $item)
                                                <?php 
                                                $total = $item->jumlah + $item->kode_unik;
                                                $jumlah += $total; ?>
                                                @empty
                                                <?php $jumlah = 0;?>
                                                @endforelse
                                                Rp{{number_format($jumlah,2,',','.')}}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>{{Auth::user()->history_deposit->where('status','=','pending')->count()}}</td>
                                            <td>
                                                <div class="badge badge-warning">Pending</div>
                                            </td>
                                            <td>
                                                <?php $jumlah = 0; ?>
                                                @forelse (Auth::user()->history_deposit->where('status','=','pending') as $item)
                                                <?php 
                                                $total = $item->jumlah + $item->kode_unik;
                                                $jumlah += $total; ?>
                                                @empty
                                                <?php $jumlah = 0;?>
                                                @endforelse
                                                Rp{{number_format($jumlah,2,',','.')}}
                                            </td>
                                        </tr>
                                       <tr>
                                            <td>{{Auth::user()->history_deposit->where('status','=','canceled')->count()}}</td>
                                            <td>
                                                <div class="badge badge-danger">Canceled</div>
                                            </td>
                                            <td>
                                                <?php $jumlah = 0; ?>
                                                @forelse (Auth::user()->history_deposit->where('status','=','canceled') as $item)
                                                <?php 
                                                $total = $item->jumlah + $item->kode_unik;
                                                $jumlah += $total; ?>
                                                @empty
                                                <?php $jumlah = 0;?>
                                                @endforelse
                                                Rp{{number_format($jumlah,2,',','.')}}
                                            </td>
                                        <tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Deposit Saldo</h4>
                            </div>
                            <div class="card-content">
                            <form method="POST" action="{{route('tambah_deposit')}}">
                                @csrf
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6 col-12">
                                            <div class="text-bold-600 font-medium-2">
                                                    Metode Deposit
                                            </div>
                                            <p>Pilih metode deposit yang ingin dilakukan.</p>
                                            <fieldset class="form-group">
                                                <select class="form-control" id="method">
                                                    <option value="0">-- Pilih Metode --</option>
                                                    <option value="otomatis">Otomatis</option>
                                                    <option value="manual">Manual</option>
                                                </select>
                                            </fieldset>
                                        </div>
                                        <div class="col-md-6 col-12">
                                            <div class="text-bold-600 font-medium-2">
                                                    Jenis Deposit
                                            </div>
                                            <p>Pilih jenis deposit yang ingin dilakukan.</p>
                                            <fieldset class="form-group">
                                                <select class="form-control" name="jenis" id="deposit">
                                                    <option value="otomatis">-- Pilih Jenis Deposit --</option>
                                                </select>
                                            </fieldset>
                                        </div>
                                        <div class="col-sm-6 col-12">
                                            <div class="text-bold-600 font-medium-2">
                                                Jumlah
                                            </div>
                                            <p>Jumlah nominal yang ingin dikirim.</p>
                                            <fieldset class="form-label-group">
                                                <input id="jumlah" name="jumlah" type="text" class="form-control" id="floating-label1" placeholder="Jumlah">
                                            </fieldset>
                                        </div>      
                                        <div class="col-sm-6 col-12">
                                            <div class="text-bold-600 font-medium-2">
                                                Saldo Didapat
                                            </div>
                                            <p>Jumlah saldo yang akan didapat.</p>
                                            <fieldset class="form-label-group">
                                                <input id="total" readonly class="form-control" id="floating-label1" value="">
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">
                                        Tambah Deposit
                                    </button>
                                </div>
                            </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">History Deposit</h4>
                            </div>
                            <div class="card-content">
                                <div class="card-body card-dashboard">
                                    <p class="card-text">Berikut merupakan data yang anda telah order.</p>
                                    <div class="table-responsive">
                                        <table class="table zero-configuration" id="cat-table">
                                            <thead>
                                                <tr>
                                                    <th>History Id</th>
                                                    <th>Jenis</th>
                                                    <th>Jumlah</th>
                                                    <th>Status</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Dashboard Analytics Start -->
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
    <script src="{{asset('app-assets/vendors/js/tables/datatable/pdfmake.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/vfs_fonts.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.buttons.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.html5.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.print.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.bootstrap.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js')}}"></script>

    <script>
         const site = {!! json_encode($site->toArray()) !!};
         const method = $('#method');
         const jumlah = $('#jumlah');
         const total = $('#total');
         method.on('change', function(){
         const url = site.url + '/deposit/'+ method.val() + '/getdeposit';  
                $.get(url,function(data){
                    const deposit = $('#deposit');
                    deposit.empty();
                    if(data.length !== 0) {
                    $.each(data,function(key,value) {
                        deposit.append('<option value='+ value.id +'>'+ value.name +'</option>');
                        localStorage.setItem("rate", value.rate);
                    });
                    } else {
                    deposit.append('<option>Tidak ada data</option>')
                    }
                });
         });
         jumlah.on('keyup', function(){
            const rate = localStorage.getItem("rate");
            const totalsemua = jumlah.val() * rate;
            total.val(totalsemua);
         });
    var history = {!! json_encode($history) !!};
    $(function() {
            $('#cat-table').DataTable({
                serverSide: true,
                ajax: site.url + "/deposit/json",
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'deposit.name', name: 'deposit.name', orderable: false},
                    { data: 'jumlah', name: 'jumlah'},
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', searchable:'false' }
                ]
            });
        });
    </script>
@endsection