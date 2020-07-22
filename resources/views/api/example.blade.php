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
                            <h4 class="card-title"><i class="feather icon-book"></i> Api Class</h4>
                        </div>
                        <div class="card-content">
                            <div class="card-body">
                                <pre>
                                    <code class="language-php">
                                        class LiteX
                                        {
                                            public $lite_url = '{{$site->url}}/lite/';
                                            
                                            // Mobile Recharge
                                            public function orderPpob($key,$service,$target) {
                                                return $this->connect($this->lite_url.'mobile-recharge',array('Authorization: '.$key,'Action: order','Service: '.$service,'Target: '.$target));
                                            }
                                            public function statusPpob($key,$oid) {
                                                return $this->connect($this->lite_url.'mobile-recharge',array('Authorization: '.$key,'Action: status','OrderID: '.$oid));
                                            }
                                            public function servicesPpob($key) {
                                                return $this->connect($this->lite_url.'mobile-recharge',array('Authorization: '.$key,'Action: services'));
                                            }
                                            
                                            // Social Media
                                            public function orderSocmed($key,$service,$target,$qty) {
                                                return $this->connect($this->lite_url.'social-media',array('Authorization: '.$key,'Action: order','Service: '.$service,'Target: '.$target,'Quantity: '.$qty));
                                            }
                                            public function statusSocmed($key,$oid) {
                                                return $this->connect($this->lite_url.'social-media',array('Authorization: '.$key,'Action: status','OrderID: '.$oid));
                                            }
                                            public function servicesSocmed($key) {
                                                return $this->connect($this->lite_url.'social-media',array('Authorization: '.$key,'Action: services'));
                                            }
                                            
                                            // Deposit
                                            public function newDeposit($key,$method,$amount,$sender) {
                                                return $this->connect($this->lite_url.'deposit',array('Authorization: '.$key,'Action: request','Method: '.$method,'Amount: '.$amount,'Sender: '.$sender));
                                            }
                                            public function statusDeposit($key,$req_id) {
                                                return $this->connect($this->lite_url.'deposit',array('Authorization: '.$key,'Action: status','RequestID: '.$req_id));
                                            }
                                            public function cancelDeposit($key,$req_id) {
                                                return $this->connect($this->lite_url.'deposit',array('Authorization: '.$key,'Action: cancel','RequestID: '.$req_id));
                                            }
                                            
                                            // Other
                                            public function profile($key) {
                                                return $this->connect($this->lite_url.'information',array('Authorization: '.$key,'Action: profile'));
                                            }
                                            
                                            
                                            private function connect($end_point,$header) {
                                                $ch = curl_init();
                                                curl_setopt($ch, CURLOPT_URL, $end_point);
                                                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
                                                curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
                                                $chresult = curl_exec($ch);
                                                $json_result = json_decode($chresult, true);
                                                return $json_result;
                                            }
                                        }
                                    </code>
                                </pre>
                            </div>
                            <div class="card-header">
                                <h4 class="card-title"><i class="feather icon-book"></i> Example Request</h4>
                        
                            </div>
                            <div class="card-body">
                                <pre>
                                    <code class="language-php">
                                    header("Content-Type: application/json");
                                    require_once 'path/to/function.php';
                                    $LiteX = new LiteX;

                                    $key = "-----"; // your api key

                                    // Profile
                                    $profile = $LiteX->profile($key);
                                    print_r($profile);

                                    // Mobile Recharge
                                        # Pemesanan
                                        $mr_srv = ""; // Service ID
                                        $mr_tgt = ""; // Order Target
                                        $mr_order = $LiteX->orderPpob($key,$mr_srv,$mr_tgt);
                                        print_r($mr_order);
                                        
                                        # Cek Status
                                        $mr_oid = ""; // Order ID
                                        $mr_status = $LiteX->statusPpob($key,$mr_oid);
                                        print_r($mr_status);
                                        
                                        # Mendapatkan Layanan
                                        $mr_services = $LiteX->servicesPpob($key);
                                        print_r($mr_services);
                                        

                                    // Social Media
                                        # Pemesanan
                                        $sm_srv = ""; // Service ID
                                        $sm_tgt = ""; // Order Target
                                        $sm_qty = ""; // Order Quantity
                                        $sm_order = $LiteX->orderSocmed($key,$sm_srv,$sm_tgt,$sm_qty);
                                        print_r($sm_order);
                                        
                                        # Cek Status
                                        $sm_oid = ""; // Order ID
                                        $sm_status = $LiteX->statusSocmed($key,$sm_oid);
                                        print_r($sm_status);
                                        
                                        # Mendapatkan Layanan
                                        $sm_services = $LiteX->servicesSocmed($key);
                                        print_r($sm_services);
                                        
                                    // Deposit
                                        # Permintaan
                                        $depo_method = ""; // Metode Deposit (Telkomsel, XL, BTPN Jenius, OVO)
                                        $depo_amount = ""; // Jumlah Deposit
                                        $depo_sender = ""; // Nomor Pengirim
                                        $depo_request = $LiteX->newDeposit($key,$depo_method,$depo_amount,$depo_sender);
                                        print_r($depo_request);
                                        
                                        # Cek Status
                                        $req_id = ""; // Request ID
                                        $depo_status = $LiteX->statusDeposit($key,$req_id);
                                        print_r($depo_status);
                                        
                                        # Pembatalan Deposit
                                        $req_id1 = ""; // Request ID
                                        $depo_cancel = $LiteX->cancelDeposit($key,$req_id);
                                        print_r($depo_cancel);
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
@endsection
@section('js')
    @parent
    <!-- BEGIN: Page Vendor JS-->
    <script src="../../../app-assets/vendors/js/ui/prism.min.js"></script>
    <!-- END: Page Vendor JS-->
@endsection