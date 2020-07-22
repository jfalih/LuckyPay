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
            <section id="page-account-settings">
                <div class="row">
                  <div class="col-sm-8">
                    <div class="card overflow-hidden">
                      <div class="card-header">
                        <h4 class="card-title"><i class="feather icon-user"></i> Profile</h4>
                      </div>
                      <div class="card-content">
                        <div class="card-body">
                          <!-- Nav tabs -->
                          <ul class="nav nav-tabs nav-fill" id="myTab" role="tablist">
                            <li class="nav-item">
                              <a class="nav-link active" id="home-tab-fill" data-toggle="tab" href="#home-fill" role="tab" aria-controls="home-fill" aria-selected="false">Pengaturan Akun</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" id="profile-tab-fill" data-toggle="tab" href="#profile-fill" role="tab" aria-controls="profile-fill" aria-selected="false">Ganti Password</a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" id="api-tab-fill" data-toggle="tab" href="#api-fill" role="tab" aria-controls="messages-fill" aria-selected="true">Pengaturan Api</a>
                            </li>
                          </ul>
              
                          <!-- Tab panes -->
                          <div class="tab-content pt-1">
                            <div class="tab-pane active" id="home-fill" role="tabpanel" aria-labelledby="home-tab-fill">
                                <form method="POST" action="{{ route('change_name')}}">
                                    @csrf
                                    <div class="row">
                                      <div class="col-12">
                                        <div class="form-group">
                                          <div class="controls">
                                            <label for="account-name">Name</label>
                                            <input type="text" name="name" class="form-control"
                                              value={{$user->name}} required
                                              data-validation-required-message="This name field is required">
                                          </div>
                                        </div>
                                      </div>
                                      
                                      <div class="col-12">
                                        <div class="form-group">
                                          <div class="controls">
                                            <label for="account-name">Level</label>
                                            <input readonly class="form-control" id="account-name" placeholder="Name"
                                              value={{$user->level}}>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="col-12">
                                        <div class="form-group">
                                          <div class="controls">
                                            <label for="account-e-mail">E-mail</label>
                                            <input type="email" readonly class="form-control" id="account-e-mail" placeholder="Email"
                                              value={{$user->email}} required
                                              data-validation-required-message="This email field is required">
                                          </div>
                                        </div>
                                      </div>
                                      <div class="col-12 d-flex flex-sm-row flex-column justify-content-end">
                                        <button type="submit" class="btn btn-primary mb-1 mb-sm-0">Save
                                          changes</button>
                                      </div>
                                    </div>
                                  </form>
                            </div>
                            <div class="tab-pane" id="profile-fill" role="tabpanel" aria-labelledby="profile-tab-fill">
                                <form method="POST" action="{{route('change_password')}}">
                                    @csrf
                                    <div class="row">
                                      <div class="col-12">
                                        <div class="form-group">
                                          <div class="controls">
                                            <label for="account-old-password">Password Lama</label>
                                            <input type="password" class="form-control" id="account-old-password" name="password_lama" required
                                              placeholder="Old Password"
                                              data-validation-required-message="This old password field is required">
                                          </div>
                                        </div>
                                      </div>
                                      <div class="col-12">
                                        <div class="form-group">
                                          <div class="controls">
                                            <label for="account-new-password">Password Baru</label>
                                            <input type="password" id="account-new-password" name="password_baru" class="form-control"
                                              placeholder="New Password" required
                                              data-validation-required-message="The password field is required" minlength="6">
                                          </div>
                                        </div>
                                      </div>
                                      <div class="col-12">
                                        <div class="form-group">
                                          <div class="controls">
                                            <label for="account-retype-new-password">Ulangi Password Baru</label>
                                            <input type="password" name="konfirm_password_baru" class="form-control" required
                                              id="account-retype-new-password" data-validation-match-match="password"
                                              placeholder="New Password"
                                              data-validation-required-message="The Confirm password field is required" minlength="6">
                                          </div>
                                        </div>
                                      </div>
                                      <div class="col-12 d-flex flex-sm-row flex-column justify-content-end">
                                        <button type="submit" class="btn btn-primary mb-1 mb-sm-0">Save
                                          changes</button>
                                      </div>
                                    </div>
                                  </form>
                            </div>
                            <div class="tab-pane" id="api-fill" role="tabpanel" aria-labelledby="api-tab-fill">
                                <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="valueapi">Api Key</label>
                                        <div class="input-group">
                                            <input value={{Auth::user()->api_key}} readonly id="valueapi" type="text" class="form-control" placeholder="Button on right" aria-describedby="button-addon2">
                                            <div class="input-group-append" id="button-addon2">
                                            <button class="btn btn-primary waves-effect waves-light" id="newapi" type="button">Generate New Api</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                    <label for="valueapi">IP Static</label>
                                    <fieldset>
                                        <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text" id="basic-addon1">IP</span>
                                        </div>
                                        <input type="text" class="form-control" @if ($user->ip_static !== null)
                                        value={{$user->ip_static}}
                                        @endif name="static_ip" placeholder="0.0.0.0" aria-describedby="basic-addon1">
                                        </div>
                                    </fieldset>
                                    </div>
                                </div>
                                <div class="col-12 d-flex flex-sm-row flex-column justify-content-end">
                                  <button type="submit" class="btn btn-primary mb-1 mb-sm-0">Save
                                    changes</button>
                                </div>
                                </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </section>
              <!-- account setting page end -->
              
        </div>
    </div>
 </div>
@endsection
@section('js')
@parent
    <!-- BEGIN: Page Vendor JS-->
    <script src="{{asset('app-assets/vendors/js/charts/apexcharts.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/extensions/tether.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/extensions/shepherd.min.js')}}"></script>
    <!-- END: Page Vendor JS-->


    <!-- BEGIN: Page JS-->
    <script src="../../../app-assets/js/scripts/navs/navs.min.js"></script>
    <!-- END: Page JS-->
    <script>
        $('#newapi').click(function(){
             var site = {!! json_encode($site->toArray()) !!};
            const url = site.url + '/profile/api';  
                $.get(url,function(data){
                    $('#valueapi').val(data);
                });
        });
        </script>
@endsection