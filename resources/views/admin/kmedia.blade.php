@extends('layouts.board')
@section('css')
    @parent
    <!-- BEGIN: Page CSS-->
    
    <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/tables/datatable/datatables.min.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/core/menu/menu-types/horizontal-menu.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/core/colors/palette-gradient.css">
    <!-- END: Page CSS-->
@endsection
@section('content')
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
                    <h4 class="card-title">Pengaturan Operan Kmedia</h4>
                </div>
                <div class="card-content">
                    <form class="form" method="POST" action={{ route('kmedia.admin.edit') }}>
                        @method('PUT')
                        @csrf
                    <div class="card-body">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" class="@error('link') is-invalid @enderror form-control" value="{{$kmedia->link}}" name="link" placeholder="Link">
                                            @error('link')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-user"></i>
                                            </div>
                                            <label for="first-name-floating-icon">Link</label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" class="@error('api_key') is-invalid @enderror form-control" value="{{$kmedia->api_key}}" name="api_key" placeholder="Api Key">
                                            @error('api_key')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-user"></i>
                                            </div>
                                            <label for="first-name-floating-icon">Api Key</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <fieldset class="form-group">
                                                <select name="status" class="@error('status') is-invalid @enderror form-control" id="basicSelect">
                                                    <option value="">-- Pilih Status --</option>
                                                    <option value="active">Active</option>
                                                    <option value="not_active">Not Active</option>
                                                </select>
                                                @error('status')
                                                <small class="text-danger">{{$message}}.</small>
                                                @enderror
                                            </fieldset>
                                            <div class="form-control-position">
                                                <i class="feather icon-zap"></i>
                                            </div>
                                            <label for="contact-floating-icon">Status</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                    <div class="card-footer">
                            <button type="submit" class="btn btn-primary mr-1">Submit</button>
                            <button type="reset" class="btn btn-warning mr-1">Reset</button>
                    </div>
                    
                </form>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
@section('js')
@parent
    <!-- BEGIN: Page Vendor JS-->
    <script src="{{asset('app-assets/vendors/js/tables/datatable/pdfmake.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/vfs_fonts.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.buttons.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.html5.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.print.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.bootstrap.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js')}}"></script>
    <!-- END: Page Vendor JS-->
@endsection
