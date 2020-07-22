@extends('layouts.auth')
@section('css')
@parent
<!-- BEGIN: Page CSS-->
<link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/core/menu/menu-types/vertical-menu.css')}}">
<link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/core/colors/palette-gradient.css')}}">
<link rel="stylesheet" type="text/css" href="{{asset('app-assets/css/pages/dashboard-ecommerce.css')}}">
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
                    <div class="col-lg-12 col-md-6 col-12">
                        @if ($subject->status !== 'closed')
                        <div class="card chat-application">
                          <div class="card-header">
                            <h4 class="card-title">#{{$subject->id}} - {{$subject->title}}</h4>
                          </div>
                          <div class="chat-app-window">
                            <div class="user-chats">
                              <div class="chats">
                                @foreach ($ticket as $item)
                                @if($item->user_id == Auth::user()->id)
                                <span class="float-right">{{Auth::user()->name}}</span>
                                <br>
                                <div class="chat">
                                  <div class="chat-avatar">
                                    <a class="avatar m-0" data-toggle="tooltip" href="#" data-placement="left" title=""
                                      data-original-title="">
                                      <img src="../../../app-assets/images/portrait/small/avatar-s-11.jpg" alt="avatar" height="40"
                                        width="40" />
                                    </a>
                                  </div>
                                  <div class="chat-body">
                                    <div class="chat-content">
                                        <div class="row">
                                        <div class="col-sm-12">
                                            <p>{{$item->pesan}}</p>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                                </div>    
                                @else
                                <span class="float-left">{{$item->user->name}}</span>
                                <br>
                                <div class="chat chat-left">
                                  <div class="chat-avatar mt-50">
                                    <a class="avatar mt-25" data-toggle="tooltip" href="#" data-placement="left" title=""
                                      data-original-title="">
                                      <img src="../../../app-assets/images/portrait/small/avatar-s-2.jpg" alt="avatar" height="40"
                                        width="40" />
                                    </a>
                                  </div>
                                  <div class="chat-body">
                                    <div class="chat-content">
                                        <div class="row">
                                        <div class="col-sm-12">
                                            <p>{{$item->pesan}}</p>
                                        </div>
                                       
                                        </div>
                                    </div>
                                </div>
                                </div>  
                                @endif
                                @endforeach
                              </div>
                            </div>
                            <div class="chat-footer">
                            <form method="POST"  action="{{route('ticket.update', $subject->id)}}">
                              @csrf
                              <div class="card-body d-flex justify-content-around pt-0">
                                <input type="text" class="@error('pesan') is-invalid @enderror form-control mr-50" name="pesan" placeholder="Tulis pesanmu..">
                                   @error('pesan')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                <button type="submit" class="btn btn-icon btn-primary"><i class="feather icon-navigation"></i></button>
                              </div>
                            </form>
                            </div>
                          </div>
                        </div>
                        @else
                            <div class="card">
                                <div class="card-content">
                                    <div class="card-body">
                                        Ticket sudah ditutup oleh admin, Terimakasih..&nbsp;
                                        <a href={{route('home')}} class="btn btn-primary"><i class="feather icon-arrow-left"></i>&nbsp;Kembali</a>
                                    </div>
                                </div>
                            </div>
                        @endif
                      </div>
                    </div>
            </div>
            </section>
            
    @if (session('subject'))

    <!-- Modal -->
    <div class="modal fade text-left" id="default" tabindex="-1" aria-labelledby="myModalLabel1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel1">Ticket Komplain</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="POST" enctype="multipart/form-data" action={{route('ticket.create')}}>
                    @csrf
                <div class="modal-body">
                    <div class="form-body m-2">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" class="@error('title') is-invalid @enderror form-control" name="title" placeholder="Judul">
                                    @error('title')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-globe"></i>
                                    </div>
                                    <label for="first-name-floating-icon">Judul</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group position-relative ">
                                    <div class="custom-file">
                                        <input type="file" id="inputGroupFile01" class="@error('file') is-invalid @enderror custom-file-input" name="file" placeholder="Judul">
                                        <label class="custom-file-label" for="inputGroupFile01">Pilih File</label>
                                    </div>
                                    @error('file')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-12">
                                <fieldset class="form-label-group">
                                    <textarea class="form-control @error('pesan') is-invalid @enderror" id="label-textarea" rows="3" name="pesan" placeholder="Pesan"></textarea>
                                    @error('pesan')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <label for="label-textarea">Pesan</label>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Kirim</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    @endif
        </div>
    </div>
 </div>
 @endsection
 @section('js')
 @parent
 
    <!-- BEGIN: Page JS-->
    <script src="../../../app-assets/js/scripts/pages/app-chat.min.js"></script>
    <!-- END: Page JS-->
 @endsection