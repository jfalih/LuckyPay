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
                            <div class="alert alert-danger m-1" role="alert">
                                <strong>Oops..!</strong> {{session('error')}}
                            </div>
                            @endif
                            @if (session('success'))
                            <div class="alert alert-success m-1" role="alert">
                                <strong>Yihaa..!</strong> {{session('success')}}
                            </div>
                            @endif
                            </div>
                        <div class="col-md-12 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">
                                        <i class="feather icon-clipboard"></i>&nbsp;Mutasi&nbsp;Saldo</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body card-dashboard">
                                        <p class="card-text">Berikut merupakan data yang anda telah order.</p>
                                        <div class="table-responsive">
                                            <table class="table zero-configuration" id="cat-table">
                                                <thead>
                                                    <tr>
                                                        <th>History Id</th>
                                                        <th>Keterangan</th>
                                                        <th>Jumlah</th>
                                                        <th>Status</th>
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
<script src="{{asset('app-assets/vendors/js/tables/datatable/pdfmake.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/tables/datatable/vfs_fonts.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.buttons.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.html5.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.print.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.bootstrap.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js')}}"></script>

<script>
    var site = {!! json_encode($site->toArray()) !!};
    $(function() {
            $('#cat-table').DataTable({
                processing: true,
                serverSide: true,
                order:[[0,'desc']],
                ajax: site.url + "/history/deposit/json",
                columns: [
                    { data: 'id', name: 'id'},
                    { data: 'keterangan', name: 'keterangan'},
                    { data: 'jumlah', name: 'jumlah'},
                    { data: 'status', name: 'status'}
                ]
            });
        });
    </script>
@endsection