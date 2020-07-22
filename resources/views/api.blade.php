@extends('layouts.auth')
@section('css')
@parent

<link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/ui/prism.min.css">
    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/core/menu/menu-types/vertical-menu.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/core/colors/palette-gradient.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/pages/dashboard-analytics.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/pages/card-analytics.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/plugins/tour/tour.css')}}">
    <!-- END: Page CSS-->
@endsection
@section('content')
<div class="app-content content">
    <div class="content-overlay"></div>
    <div class="header-navbar-shadow"></div>
    <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body">
            <div class="row" id="table-striped">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title"><i class="feather icon-book"></i> Api Documentation</h4>
                        </div>
                        <div class="card-content">
                            <div class="card-body">
                                <p class="card-text">Use <code class="highlighter-rouge">.table-striped</code> to add zebra-striping to any table row within the <code class="highlighter-rouge">&lt;tbody&gt;</code>. This styling doesn't work in IE8 and below as <code>:nth-child</code> CSS selector isn't supported.</p>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-striped mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">HTTP METHOD</th>
                                            <th scope="col">POST</th>
                                        </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <th scope="row">API URL</th>
                                      <td>{{$site->url.'/api'}}</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">Format Response</th>
                                      <td>JSON</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">Example <i>Class</i></th>
                                      <td><a href="{{$site->url.'/api/example'}}" class="btn btn-primary">PHP</a></td>
                                    </tr>
                                  </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title"><i class="feather icon-user"></i> Profile</h4>
                        </div>
                        <div class="card-content">
                            <div class="card-body">                  
                                <div class="table-responsive">
                                    <table class="table table-striped mb-0">
                                    <tbody>
                                        <tr>
                                        <th scope="row">Request URL</th>
                                        <td>{{$site->url.'/api/information'}}</td>
                                        </tr>
                                    </tbody>
                                    </table>
                                </div>   
                            </div>
                            <div class="table-responsive">
                                <table class="table table-striped mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">Parameter</th>
                                            <th scope="col">Description</th>
                                        </tr>
                                  </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">Key</th>
                                        <td>Api Key Anda</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Action</th>
                                        <td>profile</td>
                                    </tr>
                                </tbody>
                                </table>
                            </div>
                            <div class="card-body">
                                <p>Success Response:</p>
                                <pre>
                                    <code class="language-json">{
                                        [result] => true
                                        [data] =>
                                        {
                                            [username] => DwiCode
                                            [full_name] => Riko Susanto
                                            [balance] => 19172342
                                        }   
                                    }
                                    </code>
                                </pre>
                            </div>
                        </div>
                    </div>
                </div>         
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title"><i class="feather icon-shopping-cart"></i> New Order</h4>
                        </div>
                        <div class="card-content">
                            <div class="card-body">                  
                                <div class="table-responsive">
                                    <table class="table table-striped mb-0">
                                    <tbody>
                                        <tr>
                                        <th scope="row">Mobile Recharge</th>
                                        <td>{{$site->url.'/api/mobile-recharge'}}</td>
                                        </tr>
                                        <tr>
                                        <th scope="row">Social Media</th>
                                        <td>{{$site->url.'/api/social-media'}}</td>
                                        </tr>
                                    </tbody>
                                    </table>
                                </div>   
                            </div>
                            <div class="table-responsive">
                                <table class="table table-striped mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">Parameter</th>
                                            <th scope="col">Description</th>
                                        </tr>
                                  </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">Key</th>
                                        <td>Api Key Anda</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Action</th>
                                        <td>order</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Service</th>
                                        <td>ID Layanan</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Target</th>
                                        <td>Target pesanan sesuai kebutuhan (username/url/id/nomor hp).</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Quantity</th>
                                        <td>Jumlah pesan. (Tidak diperlukan jika pesan layanan mobile recharge)</td>
                                    </tr>
                                </tbody>
                                </table>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <p>Success Response:</p>
                                        <pre>
                                            Mobile Recharge
                                            <code class="language-json">
                                                {
                                                    [result] => true
                                                    [data] =>
                                                        {
                                                            [trx_id] => 123456
                                                            [message] => Pesanan berhasil! Pesanan akan diproses
                                                        }
                                                
                                                }
                                            </code>
                                        </pre>
                                    </div>
                                    <div class="col-md-6">
                                        <p>Success Response:</p>
                                        <pre>
                                            Social Media
                                            <code class="language-json">{
                                                    [result] => true
                                                    [data] =>
                                                        {
                                                            [trx_id] => 123456
                                                            [price] => 80
                                                        }
                                                    }                                                
                                            </code>
                                        </pre>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                     
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title"><i class="feather icon-zap"></i> Check Status</h4>
                        </div>
                        <div class="card-content">
                            <div class="card-body">                  
                                <div class="table-responsive">
                                    <table class="table table-striped mb-0">
                                    <tbody>
                                        <tr>
                                        <th scope="row">Mobile Recharge</th>
                                        <td>{{$site->url.'/api/mobile-recharge'}}</td>
                                        </tr>
                                        <tr>
                                        <th scope="row">Social Media</th>
                                        <td>{{$site->url.'/api/social-media'}}</td>
                                        </tr>
                                    </tbody>
                                    </table>
                                </div>   
                            </div>
                            <div class="table-responsive">
                                <table class="table table-striped mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">Parameter</th>
                                            <th scope="col">Description</th>
                                        </tr>
                                  </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">Key</th>
                                        <td>Api Key Anda</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Action</th>
                                        <td>status</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">order_id</th>
                                        <td>ID Pemesanan</td>
                                    </tr>
                                </tbody>
                                </table>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <p>Success Response:</p>
                                        <pre>
                                            Mobile Recharge
                                            <code class="language-json">
                                                {
                                                    [result] => true
                                                    [data] =>
                                                        {
                                                            [trx_id] => 123456
                                                            [message] => Pesanan berhasil! Pesanan akan diproses
                                                        }
                                                
                                                }
                                            </code>
                                        </pre>
                                    </div>
                                    <div class="col-md-6">
                                        <p>Success Response:</p>
                                        <pre>
                                            Social Media
                                            <code class="language-json">{
                                                    [result] => true
                                                    [data] =>
                                                        {
                                                            [trx_id] => 123456
                                                            [price] => 80
                                                        }
                                                    }                                                
                                            </code>
                                        </pre>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                     
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title"><i class="feather icon-list"></i> Services</h4>
                        </div>
                        <div class="card-content">
                            <div class="card-body">                  
                                <div class="table-responsive">
                                    <table class="table table-striped mb-0">
                                    <tbody>
                                        <tr>
                                        <th scope="row">Mobile Recharge</th>
                                        <td>{{$site->url.'/api/mobile-recharge'}}</td>
                                        </tr>
                                        <tr>
                                        <th scope="row">Social Media</th>
                                        <td>{{$site->url.'/api/social-media'}}</td>
                                        </tr>
                                    </tbody>
                                    </table>
                                </div>   
                            </div>
                            <div class="table-responsive">
                                <table class="table table-striped mb-0">
                                    <thead>
                                        <tr>
                                            <th scope="col">Parameter</th>
                                            <th scope="col">Description</th>
                                        </tr>
                                  </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">Key</th>
                                        <td>Api Key Anda</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Action</th>
                                        <td>services</td>
                                    </tr>
                                </tbody>
                                </table>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <p>Success Response:</p>
                                        <pre>
                                            Mobile Recharge
                                            <code class="language-json">
                                                {
                                                    [result] => true
                                                    [data] => 
                                                        {
                                                            [0] => 
                                                                {
                                                                    [category] => Paket Internet Indosat Promo
                                                                    [name] =>  10GB+Unlimited APK (30HR)
                                                                    [type] => paket-internet
                                                                    [code] => IDP10
                                                                    [price] => 86890
                                                                    [status] => null
                                                                }
                                                        }
                                                }
                                            </code>
                                        </pre>
                                    </div>
                                    <div class="col-md-6">
                                        <p>Success Response:</p>
                                        <pre>
                                            Social Media
                                            <code class="language-json">
                                                {
                                                    [result] => true
                                                    [data] => 
                                                        {
                                                            [0] => 
                                                                {
                                                                    [id] => 285
                                                                    [category] => Instagram Auto Likes - 7 Days Subscription
                                                                    [name] => 	80 Auto Likes + Views - 30 Days
                                                                    [price] => 138240000
                                                                    [min] => 1
                                                                    [max] => 1
                                                                    [note] => USERNAME ONLY
                                                                }
                                                        }
                                                }
                                            </code>
                                        </pre>
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
@endsection
@section('js')
    @parent
    <!-- BEGIN: Page Vendor JS-->
    <script src="../../../app-assets/vendors/js/ui/prism.min.js"></script>
    <!-- END: Page Vendor JS-->
@endsection