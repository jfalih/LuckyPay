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
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        <h4 class="card-title">Daftar Harga</h4>
                                    </div>
                                </div>
                            </div>
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
                                                <a href={{ $site['url']."/harga/".$cat->slug }} class="btn btn-block btn-outline-primary mb-0 waves-effect waves-light">
                                                    {{ $cat->name }}
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-3 mb-1 d-md-none">
                            <a href={{ $site['url']."/harga/".$cat->slug }} class="btn d-flex justify-content-center align-self-center btn-primary btn-lg btn-round">
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
                                                <div class="avatar bg-rgba-primary p-50 m-0 mt-1 mb-3">
                                                    <div class="avatar-content">
                                                        <i class="feather icon-more-horizontal text-primary font-large-5"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-12">     
                                            <form action="{{route('more_harga')}}" method="POST">
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
                            <form action="{{route('more_harga')}}" method="POST">
                                @csrf
                                <button type="submit" class="btn d-flex justify-content-center align-self-center btn-primary btn-round">
                                    <i class="feather icon-more-horizontal text-bold"></i>
                                </button>
                            </form>
                            <h5 class="mt-50 text-bold text-center">More</h5>
                        </div>
                    @endif

                    </div>
                </section>
                <section id="basic-modals">
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
                                                            <a href="{{$site->url.'/harga/'.session('more')[$i]->slug}}" type="submit" class="btn btn-block btn-outline-primary mb-0 waves-effect waves-light">
                                                               {{session('more')[$i]->name}}
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                    <div class="col-3 mb-1 d-md-none">
                                            <a href="{{$site->url.'/harga/'.session('more')[$i]->slug}}" class="btn d-flex justify-content-center align-self-center btn-primary btn-lg btn-round">
                                                <i class=" {{session('more')[$i]->name}} text-bold"></i>
                                            </a>
                                        <h5 class="mt-50 text-bold text-center"> {{session('more')[$i]->name}}</h5>
                                    </div>
                                    @endfor
                               </div>
                            </div>  
                            <div class="modal-footer">
                                Berikut merupakan harga layanan lain yang kami sediakan
                            </div>
                        </div>
                    </div>
                </div>
                @endif
                </section>
            </div>
        </div>
    </div>
@endsection

@section('js')
@parent
    <!-- BEGIN: Page JS-->
    <script src="{{asset('app-assets/js/scripts/modal/components-modal.min.js')}}"></script>
    <!-- END: Page JS-->
    
    @if (session('more'))
        <script>
            $(window).on('load',function() {
                $('#default').modal('show');
            });
        </script>
    @endif
@endsection