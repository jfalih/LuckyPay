<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    @section('css')
    
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
    
    
    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/vendors.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/forms/select/select2.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/charts/apexcharts.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/extensions/tether-theme-arrows.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/extensions/tether.min.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/vendors/css/extensions/shepherd-theme-default.css')}}">
    <!-- END: Vendor CSS-->
    
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/bootstrap.css')}}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/bootstrap-extended.css')}}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/colors.css')}}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/components.css')}}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/themes/dark-layout.css')}}">
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/css/themes/semi-dark-layout.css')}}">
    <!-- BEGIN: Custom CSS-->
    <link rel="stylesheet" type="text/css" href="{{ asset('assets/css/style.css')}}">
    <!-- END: Custom CSS-->
    @show

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ $site->name.' - '.$site->title }}</title>
    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

</head>
<!-- BEGIN: Body-->

<body class="horizontal-layout horizontal-menu 2-columns  navbar-floating footer-static  " data-open="hover" data-menu="horizontal-menu" data-col="2-columns">

    <!-- BEGIN: Header-->
    <nav class="header-navbar navbar-expand-lg navbar navbar-with-menu navbar-fixed navbar-shadow navbar-brand-center">
        <div class="navbar-header d-xl-block d-none">
            <ul class="nav navbar-nav flex-row">
                <li class="nav-item"><a class="navbar-brand" href="../../../html/ltr/horizontal-menu-template/index.html">
                        <div class="brand-logo"></div>
                    </a></li>
            </ul>
        </div>
        <div class="navbar-wrapper">
            <div class="navbar-container content">
                <div class="navbar-collapse" id="navbar-mobile">
                    <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
                        <ul class="nav navbar-nav">
                            <li class="nav-item mobile-menu d-xl-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ficon feather icon-menu"></i></a></li>
                        </ul>
                    </div>
                    <ul class="nav navbar-nav float-right">
                        <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                        <div class="user-nav d-sm-flex d-none"><span class="user-name text-bold-600">{{Auth::user()->name}}</span><span class="user-status">{{ Auth::user()->level }}</span></div><span><img class="round" src="../../../app-assets/images/portrait/small/avatar-s-11.jpg" alt="avatar" height="40" width="40"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="{{$site->url.'/profile'}}"><i class="feather icon-user"></i> Profile</a>
                                <a class="dropdown-item" href="{{$site->url.'/history/deposit'}}"><i class="feather icon-clock"></i> Mutasi Saldo</a>
                                <div class="dropdown-divider"></div>
                            <form method="POST" action="{{route('logout')}}">
                                @csrf
                                <button type="submit" class="dropdown-item"><i class="feather icon-power"></i> Logout</button>
                            </form>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <!-- END: Header-->

    <!-- BEGIN: Main Menu-->
    <div class="horizontal-menu-wrapper">
        <div class="header-navbar navbar-expand-sm navbar navbar-horizontal floating-nav navbar-light navbar-without-dd-arrow navbar-shadow menu-border" role="navigation" data-menu="menu-wrapper">
            <div class="navbar-header">
                <ul class="nav navbar-nav flex-row">
                    <li class="nav-item mr-auto"><a class="navbar-brand" href={{$site->url}}>
                            <div class="brand-logo"></div>
                            <h2 class="brand-text mb-0">{{$site->name}}</h2>
                        </a></li>
                    <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i><i class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary" data-ticon="icon-disc"></i></a></li>
                </ul>
            </div>
            <!-- Horizontal menu content-->
            <div class="navbar-container main-menu-content" data-menu="menu-container">
                <!-- include ../../../includes/mixins-->
                <ul class="nav navbar-nav" id="main-menu-navigation" data-menu="menu-navigation">
                    <li class="nav-item mr-1 d-none d-lg-block">
                        <a href={{$site->url.'/dashboard'}}><i class="feather icon-home"></i>Dashboard</a>
                    </li>
                    @if (Auth::user()->level === 'developer')
                        <li class="dropdown nav-item" data-menu="dropdown">
                            <a class="dropdown-toggle nav-link" href="#" data-toggle="dropdown">
                                <i class="feather icon-package"></i>
                                <span data-i18n="Apps">Layanan</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="dropdown-item" href={{ $site['url'].'/dashboard/admin/category' }} data-toggle="dropdown" data-i18n="Chat">
                                        <i class="feather icon-database"></i>Category</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href={{ $site['url'].'/dashboard/admin/provider' }} data-toggle="dropdown" data-i18n="Email"><i class="feather icon-shopping-bag"></i>Provider</a>
                                </li>
                                <li><a class="dropdown-item" href={{ $site['url'].'/dashboard/admin/service' }} data-toggle="dropdown" data-i18n="Todo"><i class="feather icon-heart"></i>Services</a>
                                </li>
                            </ul>
                        </li>
                        
                        <li class="dropdown nav-item" data-menu="dropdown">
                            <a class="dropdown-toggle nav-link" href="#" data-toggle="dropdown">
                                <i class="feather icon-package"></i>
                                <span data-i18n="Apps">Pesanan</span>
                            </a>
                            <ul class="dropdown-menu">
                                @foreach ($category as $item)
                                <li>
                                    <a class="dropdown-item" href={{ $site['url'].'/dashboard/admin/order/'.$item->slug }} data-toggle="dropdown" data-i18n="Chat">
                                        <i class="feather icon-{{$item->icon}}"></i>{{$item->name}}</a>
                                </li>
                                @endforeach
                            </ul>
                        </li>

                        <li class="dropdown nav-item" data-menu="dropdown">
                            <a class="dropdown-toggle nav-link" >
                                <i class="feather">Rp</i>
                                <span>Deposit</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="dropdown-item" href={{ $site['url'].'/dashboard/admin/deposit' }} ><i class="feather icon-credit-card"></i>Pengaturan Deposit</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href={{ $site['url'].'/dashboard/admin/history/deposit' }}>
                                        <i class="feather icon-gift"></i>History Deposit
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="dropdown nav-item" data-menu="dropdown">
                            <a class="dropdown-toggle nav-link" >
                                <i class="feather icon-user"></i>
                                <span>User</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="dropdown-item" href={{ $site['url'].'/dashboard/admin/user' }} ><i class="feather icon-user-plus"></i>Tambah User</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href={{ $site['url'].'/dashboard/admin/mutasi/saldo' }}>
                                        <i class="feather icon-gift"></i>Mutasi Saldo
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href={{$site['url'].'/dashboard/admin/ticket'}}>
                                <i class="feather icon-mail"></i>
                                <span data-i18n="Apps">Tiket</span>
                            </a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href={{$site['url'].'/dashboard/admin/berita'}}>
                                <i class="feather icon-paperclip"></i>
                                <span data-i18n="Apps">Berita</span>
                            </a>
                        </li>
                        
                        <li class="dropdown nav-item" data-menu="dropdown">
                            <a class="dropdown-toggle nav-link" href="#" data-toggle="dropdown">
                                <i class="feather icon-settings"></i>
                                <span data-i18n="Apps">Pengaturan</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a class="dropdown-item" href={{ $site['url'].'/dashboard/admin/website' }} data-toggle="dropdown" data-i18n="Chat">
                                        <i class="feather icon-database"></i>Website</a>
                                </li>
                                <li>
                                    <a class="dropdown-item" href={{ $site['url'].'/dashboard/admin/operan' }} data-toggle="dropdown" data-i18n="Email"><i class="feather icon-shopping-bag"></i>Operan</a>
                                </li>
                            </li>
                            </ul>
                        </li>
                    @else
                        <li class="dropdown nav-item" data-menu="dropdown">
                            <a class="dropdown-toggle nav-link" href="#" data-toggle="dropdown">
                                <i class="feather icon-package"></i>
                                <span data-i18n="Apps">Website</span>
                            </a>
                            <ul class="dropdown-menu">
                                <li data-menu="">
                                    <a class="dropdown-item" href="app-email.html" data-toggle="dropdown" data-i18n="Email"><i class="feather icon-mail"></i>Provider</a>
                                </li>
                                <li data-menu=""><a class="dropdown-item" href="app-chat.html" data-toggle="dropdown" data-i18n="Chat"><i class="feather icon-message-square"></i>Category</a>
                                </li>
                                <li data-menu=""><a class="dropdown-item" href="app-todo.html" data-toggle="dropdown" data-i18n="Todo"><i class="feather icon-check-square"></i>Services</a>
                                </li>
                            </ul>
                        </li>

                    @endif
                    </ul>
            </div>
        </div>
    </div>
    <!-- END: Main Menu-->

    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper">
            <div class="content-body">
                @yield('content')
            </div>
        </div>
    </div>
<div class="sidenav-overlay"></div>
<div class="drag-target"></div>

<!-- BEGIN: Footer-->
<footer class="footer footer-static footer-light">
    <p class="clearfix blue-grey lighten-2 mb-0"><span class="float-md-left d-block d-md-inline-block mt-25">COPYRIGHT &copy; 2019<a class="text-bold-800 grey darken-2" href="https://1.envato.market/pixinvent_portfolio" target="_blank">Pixinvent,</a>All rights Reserved</span><span class="float-md-right d-none d-md-block">Hand-crafted & Made with<i class="feather icon-heart pink"></i></span>
        <button class="btn btn-primary btn-icon scroll-top" type="button"><i class="feather icon-arrow-up"></i></button>
    </p>
</footer>
<!-- END: Footer-->
@section('js')
    <!-- BEGIN: Vendor JS-->
    <script src="{{asset('app-assets/vendors/js/vendors.min.js')}}"></script>
    <!-- BEGIN Vendor JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.js"></script>
    <!-- BEGIN: Theme JS-->
    <script src="{{asset('app-assets/js/core/app-menu.js')}}"></script>
    <script src="{{asset('app-assets/js/core/app.js')}}"></script>
    <script src="{{asset('app-assets/js/scripts/components.js')}}"></script>
    <!-- END: Theme JS-->
    

@show
</body>
<!-- END: Body-->
</html>
