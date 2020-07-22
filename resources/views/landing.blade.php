
<!doctype html>
<html lang="en">

<!-- Mirrored from agencyco.themetags.com/index-1.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 12 Jun 2020 13:18:32 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- SEO Meta description -->
    <meta name="description"
          content={{$site->description}}>
    <meta name="author" content={{$site->name}}>

    <!-- OG Meta Tags to improve the way the post looks when you share the page on LinkedIn, Facebook, Google+ -->
    <meta property="og:site_name" content={{$site->name}}/> <!-- website name -->
    <meta property="og:site" content={{$site->url}}/> <!-- website link -->
    <meta property="og:title" content={{$site->title}}/> <!-- title shown in the actual shared post -->
    <meta property="og:description" content={{$site->description}}/> <!-- description shown in the actual shared post -->
    <meta property="og:image" content={{$site->url.'/storage/'.$site->image}}/> <!-- image link, make sure it's jpg -->
    <meta property="og:url" content={{$site->url}}/> <!-- where do you want your post to link to -->
    <meta property="og:type" content="website"/>

    <!--title-->
    <title>{{$site->title}} - {{$site->name}}</title>

    <!--favicon icon-->
    <link rel="icon" href={{$site->url.'/storage/'.$site->image}} type="image/png" sizes="16x16">

    <!--google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Comfortaa:500,600,700%7COpen+Sans&amp;display=swap" rel="stylesheet">

    <!--Bootstrap css-->
    <link rel="stylesheet" href="{{asset('landing/css/bootstrap.min.css')}}">
    <!--Magnific popup css-->
    <link rel="stylesheet" href="{{asset('landing/css/magnific-popup.css')}}">
    <!--Themify icon css-->
    <link rel="stylesheet" href="{{asset('landing/css/themify-icons.css')}}">
    <!--Owl carousel css-->
    <link rel="stylesheet" href="{{asset('landing/css/owl.carousel.min.css')}}">
    <link rel="stylesheet" href="{{asset('landing/css/owl.theme.default.min.css')}}">
    <!--custom css-->
    <link rel="stylesheet" href="{{asset('landing/css/style.css')}}">
    <!--responsive css-->
    <link rel="stylesheet" href="{{asset('landing/css/responsive.css')}}">

</head>
<body>

<!--header section start-->
<header class="header">
    <!--start navbar-->
    <nav class="navbar navbar-expand-lg fixed-top bg-transparent">
        <div class="container">
            <a class="navbar-brand" href={{$site->url}}><img src={{$site->url.'/storage/'.$site->image}} width="180" alt="logo" class="landing/img-fluid"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="ti-menu"></span>
            </button>

            <div class="collapse navbar-collapse main-menu" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    @auth
                    <li class="nav-item dropdown">
                        <a class="nav-link page-scroll" href={{$site->url.'/home'}}>
                            Home
                        </a>
                    </li>    
                    @endauth
                    @guest
                    <li class="nav-item dropdown">
                        <a class="nav-link page-scroll" href={{$site->url.'/login'}}>
                            Login
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link page-scroll" href={{$site->url.'/register'}}>Register</a>
                    </li>
                    @endguest
                </ul>
            </div>
        </div>
    </nav>
    <!--end navbar-->
</header>
<!--header section end-->

<!--body content wrap start-->
<div class="main">

    <!--hero section start-->
    <section class="hero-section pt-100 background-img"
             style="background: url('landing/img/hero-bg-1.jpg')no-repeat center center / cover">
        <div class="container">
            <div class="row align-items-center justify-content-between">
                <div class="col-md-6 col-lg-6">
                    <div class="hero-content-left text-white mt-5">
                        <h1 class="text-white">{{$site->title}}</h1>
                        <p class="lead">{{$site->description}}</p>
                        <a href={{$site->url.'/login'}} class="btn solid-btn btn-primary">Login</a>
                        <a href={{$site->url.'/register'}} class="btn solid-btn btn-primary">Register</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-5">
                    <div class="hero-animation-img">
                        <img class="img-fluid d-block animation-one" src="landing/img/hero-app_development_02.svg"
                             alt="animation image">
                        <img class="img-fluid d-none d-lg-block animation-two"
                             src="landing/img/hero-app_development_01.svg" alt="animation image" width="120">
                        <img class="img-fluid d-none d-lg-block animation-four animation-new" src="landing/img/hero-app_development_03.svg"
                             alt="animation image" width="100">
                    </div>
                </div>
            </div>
            <!--counter start-->
            <div class="row">
                <ul class="list-inline counter-wrap">
                    <li class="list-inline-item">
                        <div class="single-counter text-center">
                            <span>{{$total_user}}</span>
                            <h6>Total Users</h6>
                        </div>
                    </li>
                    <li class="list-inline-item">
                        <div class="single-counter text-center">
                            <span>{{$total_deposit}}</span>
                            <h6>Total Deposit</h6>
                        </div>
                    </li>
                    <li class="list-inline-item">
                        <div class="single-counter text-center">
                            <span>{{$total_pemesanan}}</span>
                            <h6>Total Pemesanan</h6>
                        </div>
                    </li>
                    <li class="list-inline-item">
                        <div class="single-counter text-center">
                            <span>{{$total_layanan}}</span>
                            <h6>Total Layanan</h6>
                        </div>
                    </li>
                </ul>
            </div>
            <!--counter end-->
        </div>
    </section>
    <!--hero section end-->



    <!--about us section start-->
    <section id="about" class="about-us ptb-100 gray-light-bg">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <div class="about-content-left">
                        <p class="color-secondary"><strong>About Us</strong></p>
                        <h2>Apa {{$site->name}} itu?</h2>
                        <p>{{$site->name}} memudahkan anda dalam era digital yang serba cepat ini, pembayaran digital seperti pulsa, kuota, dan voucher games dapat dibeli dengan mudah di {{$site->name}}</p>
                        <div class="row mt-5">
                            <div class="col single-feature mb-4">
                                <div class="d-flex align-items-center mb-2">
                                    <span class="ti-alarm-clock rounded mr-3 icon icon-color-2"></span>
                                    <h5 class="mb-0">Menghemat Waktu</h5>
                                </div>
                                <p>Anda dapat menghemat waktu anda dengan memesan layanan di {{$site->name}}</p>
                            </div>
                            <div class="col single-feature mb-4">
                                <div class="d-flex align-items-center mb-2">
                                    <span class="ti-star rounded mr-3 icon icon-color-3"></span>
                                    <h5 class="mb-0">Ingit Hits?</h5>
                                </div>
                                <p>Order layanan tambah follower di {{$site->name}} dan jadilah super star.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="about-content-right">
                        <img src="landing/img/about-img.png" alt="about us" class="img-fluid">
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--about us section end-->

    <!--our services section start-->
    <section id="services" class="our-services-section ptb-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-7">
                    <div class="section-heading text-center mb-5">
                        <h2>Kami senang dapat membantu anda..</h2>
                        <p class="lead">{{$site->name}} selalu ingin membantu customer dengan pelayanan terbaik kami.</p>
                    </div>
                </div>
            </div>
            <div class="row no-gutters">
                <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                    <div class="single-services single-feature-hover gray-light-bg single-feature text-center p-5 h-100">
                        <span class="ti-support icon-color-1 icon rounded"></span>
                        <div class="feature-content">
                            <h5 class="mb-2">Help Service</h5>
                            <p>Kami selalu siap membantu jika Anda membutuhkan kami dalam penggunaan layanan kami.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                    <div class="single-services single-feature-hover gray-light-bg single-feature text-center p-5 h-100">
                        <span class="ti-thumb-up icon-color-2 icon rounded"></span>
                        <div class="feature-content">
                            <h5 class="mb-2">Best Service</h5>
                            <p>Kami selalu mengutamakan kualitas terbaik untuk layanan yang kami sediakan demi kepercayaan client.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                    <div class="single-services single-feature-hover gray-light-bg single-feature text-center p-5 h-100">
                        <span class="ti-tablet icon-color-3 icon rounded"></span>
                        <div class="feature-content">
                            <h5 class="mb-2">Responsive</h5>
                            <p>Website kami dapat diakses melalui berbagai device atau perangkat baik PC, tablet, maupun mobile phone.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                    <div class="single-services single-feature-hover gray-light-bg single-feature text-center p-5 h-100">
                        <span class="ti-control-shuffle icon-color-4 icon rounded"></span>
                        <div class="feature-content">
                            <h5 class="mb-2">Api Support</h5>
                            <p>Kami memiliki Dukungan API Untuk pemilik panel sehingga Anda dapat menjual kembali layanan kami dengan mudah.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                    <div class="single-services single-feature-hover gray-light-bg single-feature text-center p-5 h-100">
                        <span class="ti-bolt icon-color-5 icon rounded"></span>
                        <div class="feature-content">
                            <h5 class="mb-2">Auto Update</h5>
                            <p>Layanan kami selalu melakukan update secara berkala untuk meningkatkan kualitas layanan dan memberi Anda pengalaman terbaik.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                    <div class="single-services single-feature-hover gray-light-bg single-feature text-center p-5 h-100">
                        <span class="ti-announcement icon-color-6 icon rounded"></span>
                        <div class="feature-content">
                            <h5 class="mb-2">Reseller</h5>
                            <p>Anda dapat menjual kembali layanan kami dan menumbuhkan Profit Anda dengan mudah.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--our services section end-->

    <!--call to action start-->
    <section class="call-to-action ptb-100 background-img"
             style="background: url('landing/img/hero-bg-2.jpg')no-repeat center center / cover fixed">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-11 mb-3">
                    <div class="call-to-action-content text-center text-white">
                        <h2 class="text-white">Download APLIKASI {{$site->name}} Dengan Mudah Klik Dibawah Ini..</h2>
                    </div>
                </div>
                <div class="col-11">
                    <div class="call-to-action-btn text-center">
                        <a href="https://play.google.com/store/apps/details?id=com.tokopaedi.luckynurapriana"><img width="400" src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png"/></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--call to action end-->

</div>
<!--body content wrap end-->

<!--footer section start-->
<footer class="footer-setion">

    <!--footer top start-->
    <div class="footer-top pt-5 pb-5">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-4 mb-4 mb-lg-0">
                    <div class="footer-nav-wrap">
                        <img src={{$site->url.'/storage/'.$site->image}} alt="footer logo" width="180" class="img-fluid mb-3">
                        <p>{{$site->description}}</p>

                        <ul class="list-inline">
                            <li class="list-inline-item"><span class="ti-arrow-circle-right mr-2"></span> <a href="#">Terms Of Services</a></li>
                            <li class="list-inline-item"><span class="ti-arrow-circle-right mr-2"></span> <a href="#">Frequently Asked Question</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 ml-auto mb-4 mb-lg-0">
                    <div class="footer-nav-wrap">
                        <h5 class="mb-3">Our location</h5>
                        <ul class="list-unstyled">
                            <li class="mb-2"><span class="ti-arrow-circle-right mr-2"></span><strong>Address:</strong>
                                {{$site->alamat}}
                            </li>
                            <li class="mb-2"><span class="ti-arrow-circle-right mr-2"></span><strong>Phone:</strong> <a
                                    href="tel:+61283766284">{{$site->telp}}</a></li>
                            <li class="mb-2"><span class="ti-arrow-circle-right mr-2"></span><strong>Email:</strong><a
                                    href="mailto:mail@example.com">{{$site->email}}</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="footer-nav-wrap">
                        <h5 class="mb-3">Quick links</h5>
                        <ul class="list-unstyled">
                            @guest
                            <li class="mb-2"><i class="ti-arrow-circle-right mr-2"></i> <a
                                href={{$site->url.'/login'}}>Login</a></li>
                            <li class="mb-2"><i class="ti-arrow-circle-right mr-2"></i> <a href={{$site->url.'/register'}}>Register</a></li>    
                            @endguest
                            @auth
                            <li class="mb-2"><i class="ti-arrow-circle-right mr-2"></i> <a href={{$site->url.'/home'}}>Home</a></li>
                            @endauth
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--footer top end-->

    <!--footer copyright start-->
    <div class="footer-bottom gray-light-bg pt-4 pb-4">
        <div class="container">
            <div class="row text-center text-md-left align-items-center">
                <div class="col-md-6 col-lg-5"><p class="text-md-left copyright-text pb-0 mb-0">Copyrights © 2019. All
                    rights reserved by
                    <a href="https://www.facebook.com/jan.fadhillah.3/">Jan Falih Fadhillah</a></p></div>
                <div class="col-md-6 col-lg-7">
                    <ul class="social-list list-inline list-unstyled text-md-right">
                        <li class="list-inline-item"><a href="#" target="_blank" title="Facebook"><span
                                class="ti-facebook"></span></a></li>
                        <li class="list-inline-item"><a href="#" target="_blank" title="Twitter"><span
                                class="ti-twitter"></span></a></li>
                        <li class="list-inline-item"><a href="#" target="_blank"
                                                        title="Instagram"><span class="ti-instagram"></span></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--footer copyright end-->
</footer>
<!--footer section end-->



<!--jQuery-->
<script src="{{asset('landing/js/jquery-3.4.1.min.js')}}"></script>
<!--Popper js-->
<script src="{{asset('landing/js/popper.min.js')}}"></script>
<!--Bootstrap js-->
<script src="{{asset('landing/js/bootstrap.min.js')}}"></script>
<!--Magnific popup js-->
<script src="{{asset('landing/js/jquery.magnific-popup.min.js')}}"></script>
<!--jquery easing js-->
<script src="{{asset('landing/js/jquery.easing.min.js')}}"></script>
<!--owl carousel js-->
<script src="{{asset('landing/js/owl.carousel.min.js')}}"></script>
<!--custom js-->
<script src="{{asset('landing/js/scripts.js')}}"></script>
</html>