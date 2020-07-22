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
        
        <div class="col-12">
            <div class="card">
                <div class="card-header d-flex align-items-start pb-0">
                    <div>
                        <h2 class="text-bold-700 mb-0">{{number_format($total_user)}}</h2>
                        <p>Total User Terdaftar</p>
                    </div>
                    <div class="avatar bg-rgba-primary p-50 m-0">
                        <div class="avatar-content">
                            <i class="fa fa-users text-primary font-medium-5"></i>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
        <div class="col-md-12 col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Tambah User</h4>
                </div>
                <div class="card-content">
                    <form class="form" method="POST" >
                        @csrf
                    <div class="card-body">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" class="@error('name') is-invalid @enderror form-control" name="name" placeholder="Name">
                                            @error('name')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-user"></i>
                                            </div>
                                            <label for="first-name-floating-icon">Name</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" class="@error('password') is-invalid @enderror form-control" name="password" placeholder="Password">
                                            @error('password')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-lock"></i>
                                            </div>
                                            <label for="first-name-floating-icon">Password</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" class="@error('email') is-invalid @enderror form-control" name="email" placeholder="Email">
                                            @error('email')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-mail"></i>
                                            </div>
                                            <label for="first-name-floating-icon">Email</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="number" class="@error('balance') is-invalid @enderror form-control" name="balance" placeholder="Balance / Saldo">
                                            @error('balance')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-feather"></i>
                                            </div>
                                            <label for="email-id-floating-icon">Balance</label>

                                        </div>
                                    </div>                              
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <fieldset class="form-group">
                                                <select name="level" class="@error('level') is-invalid @enderror form-control" id="basicSelect">
                                                    <option value="">-- Pilih Level --</option>
                                                    <option value="member">Member</option>
                                                    <option value="api">Api</option>
                                                    <option value="developer">Developer</option>
                                                </select>
                                                @error('level')
                                                <small class="text-danger">{{$message}}.</small>
                                                @enderror
                                            </fieldset>
                                            <div class="form-control-position">
                                                <i class="feather icon-zap"></i>
                                            </div>
                                            <label for="contact-floating-icon">Level</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <fieldset class="form-group">
                                                <select name="status" class="@error('status') is-invalid @enderror form-control" id="basicSelect">
                                                    <option value="">-- Pilih Status --</option>
                                                    <option value="active">Active</option>
                                                    <option value="not_active">Not Active</option>
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
                    <div class="card-footer">
                            <button type="submit" class="btn btn-primary mr-1">Submit</button>
                            <button type="reset" class="btn btn-warning mr-1">Reset</button>
                    </div>
                    
                </form>
                </div>
            </div>
        </div>
        <div class="col-md-12 col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">List User</h4>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <p class="card-text">Berikut adalah data user yang telah terdaftar di {{$site->name}}.</p>
                        <div class="table-responsive">
                            <table class="table zero-configuration" id="cat-table">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Balance</th>
                                        <th>Point</th>
                                        <th>Level</th>
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
    </div>
    @if (session('user'))
    <?php 
    $session = session('user');
    ?>
    <!-- Modal -->
    <div class="modal fade text-left" id="default" tabindex="-1" aria-labelledby="myModalLabel1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel1">#{{ $session->id }}&nbsp;{{ $session->name }}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="POST" action="{{route('user.admin.update', $session->id)}}">
                    @method('PUT')
                    @csrf
                <div class="modal-body">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" value="{{$session->name}}" class="@error('name') is-invalid @enderror form-control" name="name" placeholder="Name">
                                    @error('name')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-user"></i>
                                    </div>
                                    <label for="first-name-floating-icon">Name</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" value="{{$session->email}}" class="@error('email') is-invalid @enderror form-control" name="email" placeholder="Email">
                                    @error('email')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-mail"></i>
                                    </div>
                                    <label for="first-name-floating-icon">Email</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="number"  value="{{$session->balance}}" class="@error('balance') is-invalid @enderror form-control" name="balance" placeholder="Balance / Saldo">
                                    @error('balance')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-feather"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Balance</label>

                                </div>
                            </div>                              
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <fieldset class="form-group">
                                        <select name="level" class="@error('level') is-invalid @enderror form-control" id="basicSelect">
                                            <option  value="{{$session->level}}">{{$session->level}}</option>
                                            <option value="">-- Pilih Level --</option>
                                            <option value="member">Member</option>
                                            <option value="api">Api</option>
                                            <option value="developer">Developer</option>
                                        </select>
                                        @error('level')
                                        <small class="text-danger">{{$message}}.</small>
                                        @enderror
                                    </fieldset>
                                    <div class="form-control-position">
                                        <i class="feather icon-zap"></i>
                                    </div>
                                    <label for="contact-floating-icon">Level</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <fieldset class="form-group">
                                        <select name="status" class="@error('status') is-invalid @enderror form-control" id="basicSelect">
                                            <option  value="{{$session->status}}">{{$session->status}}</option>
                                            <option value="">-- Pilih Status --</option>
                                            <option value="active">Active</option>
                                            <option value="not_active">Not Active</option>
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
    @endif
</section>
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
        $(function() {
            $('#cat-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ route('user.admin.json') }}",
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'name', name: 'name' },
                    { data: 'balance', name: 'balance'},
                    { data: 'point', name: 'point'},
                    { data: 'level', name: 'level' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', searchable:'false' }
                ]
            });
        });
    </script>
    
    @if (session('user'))
        <script>
            $(window).on('load',function() {
                $('#default').modal('show');
            });
        </script>
    @endif
@endsection