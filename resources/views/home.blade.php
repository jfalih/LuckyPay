@extends('layouts.auth')
@section('css')
@parent

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/core/menu/menu-types/vertical-menu.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/core/colors/palette-gradient.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/pages/dashboard-analytics.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/pages/card-analytics.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/plugins/tour/tour.css')}}">
    <!-- END: Page CSS-->
    
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/tables/datatable/datatables.min.css')}}">
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
                
                <!-- Dashboard Analytics Start -->
                <section id="dashboard-analytics">
                    <div class="row">
                        <div class="col-lg-12 d-none d-md-block col-md-12 col-sm-12">
                            <div class="card bg-analytics text-white">
                                <div class="card-content">
                                    <div class="card-body text-left">
                                        <img src="../../../app-assets/images/elements/decore-left.png" class="img-left" alt="card-img-left">
                                        <img src="../../../app-assets/images/elements/decore-right.png" class="img-right" alt="card-img-right">
                                        <div class="row">
                                            <div class="col-2">
                                            <div class="avatar avatar-xl bg-primary shadow mt-0">
                                                <div class="avatar-content">
                                                    <img src="../../../app-assets/images/portrait/small/avatar-s-8.jpg" alt="png" >
                                                </div>
                                            </div>
                                            </div>
                                            <div class="col-10">        
                                                <div class="text-left">
                                                <h1 class="mb-0 text-white">{{ Auth::user()->name }}</h1>
                                                </div>  
                                                <div class="text-left">
                                                    <p class="mb-2 text-white text-bold-700">Rp{{number_format(Auth::user()->balance,2,',','.')}}</p>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-4 col-md-4 col-sm-4">
                                                <div class="card text-center">
                                                    <div class="card-content">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <div class="avatar bg-rgba-danger p-50 m-0 mb-1">
                                                                        <div class="avatar-content">
                                                                            <i class="feather text-danger font-medium-5">Rp</i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12">
                                                                    <a href={{$site->url.'/deposit'}} type="button" class="btn btn-icon btn-danger waves-effect waves-light">
                                                                        Deposit&nbsp;<i class="feather icon-arrow-right"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-xl-4 col-4 col-md-4 col-sm-4">
                                                <div class="card text-center">
                                                    <div class="card-content">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <div class="avatar bg-rgba-info p-50 m-0 mb-1">
                                                                        <div class="avatar-content">
                                                                            <i class="feather icon-clipboard text-info font-medium-5"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12">
                                                                    <a href="{{$site->url.'/history'}}" type="button" class="btn btn-icon btn-info waves-effect waves-light">
                                                                        Mutasi&nbsp;<i class="feather icon-arrow-right"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xl-4 col-4 col-md-4 col-sm-4">
                                                <div class="card text-center">
                                                    <div class="card-content">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-12">
                                                                    <div class="avatar bg-rgba-success p-50 m-0 mb-1">
                                                                        <div class="avatar-content">
                                                                            <i class="feather icon-eye text-success font-medium-5"></i>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-12"> 
                                                                    <a href="{{route('transfer')}}" type="button" class="btn btn-icon btn-success waves-effect waves-light">
                                                                        Transfer&nbsp;<i class="feather icon-arrow-right"></i>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 d-md-none">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-header p-0 d-flex justify-content-between bg-primary">
                                        <h3 class="text-bold text-white m-1">LuckyPay</h3>
                                        <h3 class="text-bold text-white m-1">Rp{{number_format(Auth::user()->balance,2,',','.')}}</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-4">
                                                <a href={{$site->url.'/deposit'}} class="btn d-flex justify-content-center align-self-center btn-primary btn-lg btn-round">
                                                    <i class="feather text-bold">Rp</i>
                                                </a>
                                                <h5 class="mt-50 text-bold text-center">Deposit</h5>
                                            </div>
                                            
                                            <div class="col-4">
                                                <a href={{$site->url.'/history/deposit'}} class="btn d-flex justify-content-center align-self-center btn-primary btn-lg btn-round">
                                                    <i class="feather icon-clipboard text-bold"></i>
                                                </a>
                                                <h5 class="mt-50 text-bold text-center">Mutasi</h5>
                                            </div>
                                            
                                            <div class="col-4">
                                                <a href={{$site->url.'/transfer'}} class="btn d-flex justify-content-center align-self-center btn-primary btn-lg btn-round">
                                                    <i class="feather icon-users text-bold"></i>
                                                </a>
                                                <h5 class="mt-50 text-bold text-center">Transfer</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row match-height">
                        <div class="col-12">
                            @if (session('error'))
                                <div class="alert alert-danger mb-2">
                                    <strong>Oops..!!!</strong>&nbsp;{{ session('error') }}
                                </div>
                            @endif
                        </div>
                        <?php $i = 0; ?>
                        @foreach ($category as $cat)
                        <?php $i++; ?>
                        <div class="col-3 d-none d-md-block col-sm-3">
                            <div class="card text-center">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="p-50 m-0 mt-1 mb-3">
                                                    <div class="avatar-content">
                                                        <i class="{{$cat->icon}} text-primary font-large-5"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">                                                
                                                <a href={{ $site['url']."/order/".$cat->slug }} class="btn btn-block btn-outline-primary mb-0 waves-effect waves-light">
                                                    {{ $cat->name }}
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3 mb-1 d-md-none">
                            <a href={{ $site['url']."/order/".$cat->slug }} class="btn d-flex justify-content-center align-self-center btn-primary btn-lg btn-round">
                                <i class="{{$cat->icon}} text-bold"></i>
                            </a>
                            <h5 class="mt-50 text-bold text-center">{{$cat->name}}</h5>
                        </div>
                         @if ($i === 7)
                            @break
                        @endif
                        @endforeach
                        @if($i === 7)
                        <div class="col-3 d-none d-md-block col-sm-3">
                            <div class="card text-center">
                                <div class="card-content">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-12">
                                                <div class="p-50 m-0 mt-1 mb-3">
                                                    <div class="avatar-content">
                                                        <i class="feather icon-more-horizontal text-primary font-large-5"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">     
                                            <form action="{{route('more_order')}}" method="POST">
                                                @csrf
                                                <button type="submit" class="btn btn-block btn-outline-primary mb-0 waves-effect waves-light">
                                                    More
                                                </button>
                                            </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3 mb-1 d-md-none">
                            <form action="{{route('more_order')}}" method="POST">
                                @csrf
                                <button type="submit" class="btn d-flex justify-content-center align-self-center btn-primary btn-round">
                                    <i class="feather icon-more-horizontal text-bold"></i>
                                </button>
                            </form>
                            <h5 class="mt-50 text-bold text-center">More</h5>
                        </div>
                    </div>
                    @endif
                </section>
                <section id="basic-modals">
                    
                @if (session('berita'))
        
                <!-- Modal -->
                
                @foreach (session('berita') as $item)
                <div class="modal fade text-left" id="default" tabindex="-1" aria-labelledby="myModalLabel1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel1">{{$item->title}}</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                {{$item->keterangan}}
                            </div>  
                            <div class="modal-footer">
                                {{$item->created_at}}
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
                @endif
                @if (session('more'))
                <!-- Modal -->
                <div class="modal fade text-left" id="default" tabindex="-1" aria-labelledby="myModalLabel1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel1">More Order</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                               <div class="row">
                                   @for ($i = 7; $i < count(session('more')); $i++)
                                     <div class="col-3 d-none d-md-block col-sm-3">
                                        <div class="card text-center">
                                            <div class="card-content">
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="avatar bg-rgba-primary p-50 m-0 mt-1 mb-3">
                                                                <div class="avatar-content">
                                                                    <i class="{{session('more')[$i]->icon}} text-primary font-large-5"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <a href="{{$site->url.'/order/'.session('more')[$i]->slug}}" type="submit" class="btn btn-block btn-outline-primary mb-0 waves-effect waves-light">
                                                               {{session('more')[$i]->name}}
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                    <div class="col-3 mb-1 d-md-none">
                                            <a href="{{$site->url.'/order/'.session('more')[$i]->slug}}" class="btn d-flex justify-content-center align-self-center btn-primary btn-lg btn-round">
                                                <i class=" {{session('more')[$i]->icon}} text-bold"></i>
                                            </a>
                                        <h5 class="mt-50 text-bold text-center"> {{session('more')[$i]->name}}</h5>
                                    </div>
                                    @endfor
                               </div>
                            </div>  
                            <div class="modal-footer">
                                Berikut merupakan layanan lain yang kami sediakan
                            </div>
                        </div>
                    </div>
                </div>
                @endif
                    <div class="row">
                        <div class="col-md-12 col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">
                                        <i class="feather icon-"></i>&nbsp;Berita&nbsp;</h4>
                                </div>
                                <div class="card-content">
                                    <div class="card-body card-dashboard">
                                        <p class="card-text">Berikut merupakan informasi langsung dari panel.</p>
                                        <div class="table-responsive">
                                            <table class="table zero-configuration" id="cat-table">
                                                <thead>
                                                    <tr>
                                                        <th>Berita Id</th>
                                                        <th>Judul</th>
                                                        <th>Tgl</th>
                                                        <th>Detail</th>
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
            </div>
            <div class="mb-5"></div>
        </div>
    </div>
    <!-- END: Content-->
@endsection
@section('js')
@parent
    <!-- BEGIN: Page Vendor JS-->
    <script src="{{asset('app-assets/vendors/js/extensions/tether.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/extensions/shepherd.min.js')}}"></script>
    <!-- END: Page Vendor JS-->
    <script src="{{asset('app-assets/vendors/js/tables/datatable/pdfmake.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/vfs_fonts.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.buttons.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.html5.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.print.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.bootstrap.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js')}}"></script>


    <!-- BEGIN: Page JS-->
    <script src="{{asset('app-assets/js/scripts/modal/components-modal.min.js')}}"></script>
    <!-- END: Page JS-->
    
    <script>
    var site = {!! json_encode($site->toArray()) !!};
    $(function() {
        $('#cat-table').DataTable({
            processing: true,
            serverSide: true,
            ajax: site.url + "/berita/json",
             "order": [[ 2, "desc" ]],
            columns: [
                { data: 'id', name: 'id' },
                { data: 'title', name: 'title'},
                { data: 'date', name: 'date' },
                { data: 'action', name: 'action', searchable:'false' }
            ]
        });
    });
</script>
    @if (session('more'))
        <script>
            $(window).on('load',function() {
                $('#default').modal('show');
            });
        </script>
    @endif
    @if (session('berita'))
        <script>
            $(window).on('load',function() {
                $('#default').modal('show');
            });
        </script>
    @endif
@endsection