@extends('layouts.board')
@section('css')
    @parent
    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="../../../app-assets/vendors/css/tables/datatable/datatables.min.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/core/menu/menu-types/horizontal-menu.css">
    <link rel="stylesheet" type="text/css" href="../../../app-assets/css/core/colors/palette-gradient.css">
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
                <i class="feather icon-gift"></i>&nbsp;History&nbsp;Deposit</h4>
        </div>
        <div class="card-content">
            <div class="card-body card-dashboard">
                <p class="card-text">Berikut merupakan data deposit yang anda telah dipesan.</p>
                <div class="table-responsive">
                    <table class="table zero-configuration" id="cat-table">
                        <thead>
                            <tr>
                                <th>Deposit Id</th>
                                <th>Pemesan</th>
                                <th>Nama Bank</th>
                                <th>Rekening</th>
                                <th>Jumlah</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

    @if (session('deposit'))
        
    <!-- Modal -->
    
    @foreach (session('deposit') as $item)
    <div class="modal fade text-left" id="default" tabindex="-1" aria-labelledby="myModalLabel1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel1">#{{ $item->id }}&nbsp;{{ $item->user->name }}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="POST" action={{route('hisdepo.admin.edit',$item->id)}}>
                    @method('put')
                    @csrf
                <div class="modal-body">
                    <div class="form-body m-2">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <fieldset class="form-group">
                                        <select name="status" class="@error('status') is-invalid @enderror form-control" id="basicSelect">
                                            <option value="{{$item->status}}">{{$item->status}}</option>
                                            <option value="">-- Pilih Status --</option>
                                            <option value="pending">Pending</option>
                                            <option value="success">Success</option>
                                            <option value="canceled">Canceled</option>
                                        </select>
                                        @error('status')
                                        <small class="text-danger">{{$message}}.</small>
                                        @enderror
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
                    <button type="submit" class="btn btn-primary">Accept</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    @endforeach
    @endif
@endsection
@section('js')
@parent
    <!-- BEGIN: Page Vendor JS-->
    <script src="{{asset('app-assets/vendors/js/tables/datatable/pdfmake.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/vfs_fonts.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.buttons.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.html5.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.print.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/buttons.bootstrap.min.js')}}"></script>
    <script src="{{asset('app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js')}}"></script>
    <!-- END: Page Vendor JS-->
<script>
    var site = {!! json_encode($site->toArray()) !!};
    $(function() {
            $('#cat-table').DataTable({
                processing: true,
                serverSide: true,
                 "order": [[ 0, "desc" ]],
                ajax: site.url + "/dashboard/admin/history/deposit/json",
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'user.name', name:'user.name'},
                    { data: 'deposit.name', name:'deposit.name'},
                    { data: 'deposit.rekening', name:'deposit.rekening'},
                    { data: 'jumlah', name:'jumlah'},
                    { data: 'status', name:'status'},
                    { data: 'action', name:'action'},
                ]
            });
        });
    </script>
    
    @if (session('deposit'))
        <script>
            $(window).on('load',function() {
                $('#default').modal('show');
            });
        </script>
    @endif
@endsection