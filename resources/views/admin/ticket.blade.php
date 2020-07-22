@extends('layouts.board')
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
        <div class="col-md-12 col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">
                        <i class="feather icon-mail"></i>&nbsp;Ticket</h4>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <p class="card-text">Berikut merupakan ticket yang anda telah anda kirim.</p>
                        <div class="table-responsive">
                            <table class="table zero-configuration" id="cat-table">
                                <thead>
                                    <tr>
                                        <th>Ticket Id</th>
                                        <th>Subject</th>
                                        <th>Status</th>
                                        <th>Date</th>
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
                <form method="POST" action={{$site->url.'/dashboard/admin/ticket/'.session('subject')->id.'/edit'}}>
                    @csrf
                <div class="modal-body">
                    <div class="form-body m-2">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" readonly class="form-control" name="title" value="{{session('subject')->title}}">
                                    <div class="form-control-position">
                                        <i class="feather icon-globe"></i>
                                    </div>
                                    <label for="first-name-floating-icon">Judul</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <fieldset class="form-group">
                                        <select name="status" class="form-control" id="basicSelect">
                                            <option value="">-- Pilih Status --</option>
                                            <option value="success">Success</option>
                                            <option value="waiting">Waiting</option>
                                            <option value="closed">Closed</option>
                                        </select>
                                    </fieldset>
                                    <div class="form-control-position">
                                        <i class="feather icon-zap"></i>
                                    </div>
                                    <label for="contact-floating-icon">Status</label>
                                </div>
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
</section>
@endsection

@section('js')
@parent
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
    $(function() {
            $('#cat-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: site.url + "/dashboard/admin/ticket/json",
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'title', name: 'title'},
                    { data: 'status', name: 'status' },
                    { data: 'date', name:'date'},
                    { data: 'action', name:'action'}
                ]
            });
        });
    </script>
     
     @if (session('subject'))
     <script>
         $(window).on('load',function() {
             $('#default').modal('show');
         });
     </script>
 @endif
@endsection