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
        <div class="content-wrapper mt-1">
            <div class="mt-5 d-none d-md-block"></div>
            <div class="content-header row">
            </div>
            <div class="content-body">
                <section id="basic-input">
                    <div class="row">
                        <div class="col-md-12">                                            
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
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Transfer Saldo</h4>
                                </div>
                                <form method="POST" action={{route('transfer_saldo')}}>
                                    @csrf
                                    <div class="card-content">
                                    <div class="card-body">
                                            <div class="row">
                                                <div class="col-xl-6 col-md-6 col-12 mb-1">
                                                    <fieldset class="form-group">
                                                        <label for="basicInput">E-mail Penerima</label>
                                                        <input type="text" class="form-control @error('email') is-invalid @enderror" name="email" placeholder="Enter email">
                                                    </fieldset>
                                                </div>
                                                <div class="col-xl-6 col-md-6 col-12 mb-1">
                                                    <fieldset class="form-group @error('jumlah') is-invalid  @enderror">
                                                        <label for="basicInput">Jumlah Saldo</label>
                                                        <input type="number" class="form-control" name="jumlah" placeholder="Jumlah Saldo">
                                                    </fieldset>
                                                </div>
                                            </div>
                                    </div>
                                    <div class="card-footer">
                                        <button class="btn btn-primary" type="submit">Kirim</button>
                                    </div>
                                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
@endsection

@section('barujs')

<script src="{{asset('app-assets/vendors/js/tables/datatable/pdfmake.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/tables/datatable/vfs_fonts.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.buttons.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.html5.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.print.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.bootstrap.min.js')}}"></script>
<script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js')}}"></script>
@endsection