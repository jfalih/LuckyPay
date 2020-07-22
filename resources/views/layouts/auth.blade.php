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
    
    <link rel="stylesheet" type="text/css" href="{{ asset('app-assets/custom.css')}}">
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

<body class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static  " data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">

    <!-- BEGIN: Header-->
    <nav class="header-navbar navbar-expand-lg navbar d-none d-md-block navbar-with-menu floating-nav navbar-light navbar-shadow">
        <div class="navbar-wrapper">
            <div class="navbar-container content">
                <div class="navbar-collapse" id="navbar-mobile">
                    <div class="mr-auto float-left bookmark-wrapper d-flex align-items-center">
                        <ul class="nav d-none d-md-block navbar-nav">
                            <li class="nav-item mobile-menu d-xl-none mr-auto"><a class="nav-link nav-menu-main menu-toggle hidden-xs" href="#"><i class="ficon feather icon-menu"></i></a></li>
                        </ul>
                        <ul class="nav navbar-nav">
                            <li class="pt-1 pb-1 mr-auto">
                                <a href={{$site->url.'/point'}} class="badge d-flex text-center align-items-center badge-warning nav-menu-main" href="#">
                                    <i class="mr-50 ficon text-white fa fa-trophy"></i>
                                    <div class="text-white font-medium-1 text-bold">{{Auth::user()->point}}</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <ul class="nav navbar-nav float-right">
                        <li class="dropdown dropdown-user nav-item"><a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
                                <div class="user-nav d-sm-flex d-none">
                                    <span class="user-name text-bold-600">{{Auth::user()->name}}</span>
                                    <span class="user-status">{{Auth::user()->level}}</span>
                                </div><span><img class="round" src="../../../app-assets/images/portrait/small/avatar-s-11.jpg" alt="avatar" height="40" width="40"></span>
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
    <div class="main-menu menu-fixed menu-light  d-none d-md-block menu-accordion menu-shadow" data-scroll-to-active="true">
        <div class="navbar-header">
            <ul class="nav navbar-nav flex-row">
                <li class="nav-item mr-auto"><a class="navbar-brand" href={{$site->url.'/home'}}>
                        <h2 class="brand-text mb-0">{{$site->name}}</h2>
                    </a></li>
                <li class="nav-item nav-toggle"><a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse"><i class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i><i class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary" data-ticon="icon-disc"></i></a></li>
            </ul>
        </div>
        <div class="shadow-bottom"></div>
        <div class="main-menu-content">
            <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">
                @if(Auth::user()->level === "developer")
                <li class="nav-item">
                    <a href={{$site->url.'/dashboard'}}>
                        <i class="feather icon-cogs"></i>
                        <span class="menu-title" data-i18n="Home">Dashboard</span>
                    </a>
                </li>
                @endif
                <li class="nav-item">
                    <a href={{route('home')}}>
                        <i class="feather icon-home"></i>
                        <span class="menu-title" data-i18n="Home">Home</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href={{route('ticket')}}>
                        <i class="feather icon-mail"></i>
                        <span class="menu-title" data-i18n="Home">Ticket
                            @if ($ticket->count() > 0)
                                <div class="badge badge-pill badge-icon badge-warning">{{$ticket->count()}}</div>
                            @endif
                        </span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href={{route('top')}}>
                        <i class="feather icon-users"></i>
                        <span class="menu-title" data-i18n="Home">Top 5 Users</span>
                    </a>
                </li>
                <li class=" navigation-header"><span>Harga</span>
                </li>
                <li class="nav-item"><a href={{ $site->url.'/harga/' }}><i class="feather icon-book-open"></i><span class="menu-title" data-i18n="Email">Daftar Harga</span></a>
                </li>
                <li class=" navigation-header"><span>Pengaturan</span>
                <li class="nav-item">
                    <a href={{$site->url.'/api'}}>
                        <i class="feather icon-book"></i>
                        <span class="menu-title">
                            Api Documentation
                        </span>
                        </a>
                </li>
                </li>
            </ul>
        </div>
    </div>
    <!-- END: Main Menu-->

@yield('content')
<div class="mb-3 d-md-none">
<div class="sidenav-overlay"></div>
<div class="drag-target"></div>
</div>
<!-- BEGIN: Footer-->
<footer class="footer d-none d-md-block footer-static footer-light">
    <p class="clearfix blue-grey lighten-2 mb-0"><span class="float-md-left d-block d-md-inline-block mt-25">COPYRIGHT &copy; 2019<a class="text-bold-800 grey darken-2" href="{{$site->url.'/home'}}">{{$site->name}},</a>All rights Reserved</span><span class="float-md-right d-none d-md-block">Created By <a href="https://www.facebook.com/jan.fadhillah.3/">Jan Falih Fadhillah</a></span>
        <button class="btn btn-primary btn-icon scroll-top" type="button"><i class="feather icon-arrow-up"></i></button>
    </p>
</footer>
<footer class="w-100 bg-primary p-50 justify-content-around position-bottom-0 d-flex d-md-none position-fixed">
        <a href={{$site->url.'/home'}} class="text-white text-center d-block center justify-content-center">
            <i class="feather center icon-home font-large-1"></i>
            <span class="text-white d-flex align-items-center text-center">Home</span>
        </a>
        <a href={{$site->url.'/ticket'}} class="text-white text-center d-block center justify-content-center">
            <i class="feather center icon-mail font-large-1"></i>
            @if ($ticket->count() > 0) 
            <div class="badge badge-pill position-absolute badge-warning">{{$ticket->count()}}</div>
            @endif
            <span class="text-white d-flex align-items-center text-center">Ticket</span>
        </a>
        <a href={{$site->url.'/history'}} class="text-white text-center d-block center justify-content-center">
            <i class="feather center icon-clock font-large-1"></i>
            <span class="text-white d-flex align-items-center text-center">Riwayat</span>
        </a>
        <a href={{$site->url.'/profile'}} class="text-white text-center d-block center justify-content-center">
            <i class="feather center icon-user font-large-1"></i>
            <span class="text-white d-flex align-items-center text-center">Profile</span>
        </a>
</div>
</footer>
<!-- END: Footer-->
@section('js')
    <!-- BEGIN: Vendor JS-->
    <script src="{{asset('app-assets/vendors/js/vendors.min.js')}}"></script>
    <!-- BEGIN Vendor JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.js"></script>
    <!-- BEGIN: Theme JS-->
    <script src="{{asset('app-assets/js/core/app-menu.js')}}"></script>
    <script src="{{asset('app-assets/js/core/app.min.js')}}"></script>
    <script src="{{asset('app-assets/js/scripts/components.js')}}"></script>
    <script src="{{asset('app-assets/js/scripts/customizer.min.js')}}"></script>
    <script src="{{asset('app-assets/js/scripts/footer.min.js')}}"></script>
    <!-- END: Theme JS-->
    

@show
</body>
<!-- END: Body-->
</html>
