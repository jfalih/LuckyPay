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
@section('pln')
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
        
        <div class="col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <?php $jumlah = 0; ?>
                        <h2 class="text-bold-700 mb-0">Rp{{number_format($jumlah,2,',','.')}}</h2>
                        <p>Dari {{$count_history}} Pemesanan {{$template->name}}</p>
                    </div>
                    <div class="avatar bg-rgba-primary p-50 m-0">
                        <div class="avatar-content">
                            <i class="feather text-primary font-medium-5">Rp</i>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
        <div class="col-md-12 col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">
                        <i class="{{$template->icon}}"></i>&nbsp;History&nbsp;{{$template->name}}</h4>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <p class="card-text">Berikut merupakan data yang anda telah order.</p>
                        <div class="table-responsive">
                            <table class="table zero-configuration" id="cat-table">
                                <thead>
                                    <tr>
                                        <th></th>
                                        <th>History Id</th>
                                        <th>Name</th>
                                        <th>Target</th>
                                        <th>Sn</th>
                                        <th>Status</th>
                                        <th>Harga</th>
                                        <th>Refund</th>
                                        <th>Created At</th>
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

<script>
    var site = {!! json_encode($site->toArray()) !!};
    var category = {!! json_encode($template) !!};
    $(function() {
            $('#cat-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: site.url + "/history/"+ category.slug +"/json",
                 "order": [[ 1, "desc" ]],
                columns: [
                    { data: 'via', name: 'via' },
                    { data: 'id', name: 'id' },
                    { data: 'service.name', name: 'service.name'},
                    { data: 'target', name: 'target'},
                    { data: 'sn', name: 'sn'},
                    { data: 'status', name: 'status' },
                    { data: 'price', name: 'price' },
                    { data: 'refund', name: 'refund' },
                    { data: 'created_at', name: 'created_at' },
                    { data: 'action', name: 'action', searchable:'false' }
                ]
            });
        });
</script>
@endsection