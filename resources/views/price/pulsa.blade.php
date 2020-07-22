@extends('order')
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
@section('pulsa')
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
        @forelse($provider as $prov)
        <div class="col-12">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title">{{$prov->name}}</h4>
            </div>
            <div class="card-content">
                <div class="card-body">
                    <p class="card-text">Berikut merupakan daftar harga dari {{$prov->name}}.</p>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped mb-0">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Code</th>
                                <th scope="col">Name</th>
                                <th scope="col">Note</th>
                                <th scope="col">Price</th>
                                <th scope="col">Price Api</th>
                                <th scope="col">Status</th>
                            </tr>
                      </thead>
                      <tbody>
                    @forelse($prov->service as $service)
                        <tr>
                          <th scope="row">{{$service->id}}</th>
                          <td>{{$service->code}}</td>
                          <td>{{$service->name}}</td>
                          <td>{{$service->note}}</td>
                          <td>Rp{{number_format($service->price,2,',','.')}}</td>
                          <td>Rp{{number_format($service->price_api,2,',','.')}}</td>
                          <td>@if($service->status === "active")
                            <button class="btn btn-outline-success round"><i class="feather icon-plus"></i> Tersedia</button>
                            @else 
                            <button class="btn btn-outline-danger round"><i class="feather icon-minus"></i> Tidak</button>
                            @endif</td>
                        </tr>
                        @empty
                        <tr>
                            <td colspan="7">Tidak Ada Data</td>
                        </tr>
                    @endforelse
                      </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    @empty
    <div class="col-12">
        <div class="card">
            <div class="card-content">
                <div class="card-body">
                    Tidak Ada Data Provider
                </div>
            </div>
        </div>
    </div>
        @endforelse
    </div>
</section>
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