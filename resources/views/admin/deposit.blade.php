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
        <div class="col-md-6 col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Tambah Deposit</h4>
                </div>
                <div class="card-content">
                    <form action="{{ route('deposit.admin.add') }}" class="form" method="POST" enctype="multipart/form-data">
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
                                            <input type="text" class="@error('atas_nama') is-invalid @enderror form-control" name="atas_nama" placeholder="Atas Nama">
                                            @error('atas_nama')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-user"></i>
                                            </div>
                                            <label for="first-name-floating-icon">Atas Nama</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="card-body d-flex justify-content-around pt-0">
                                            <div class="custom-file">
                                                <input type="file" id="inputGroupFile01" class="@error('image') is-invalid @enderror custom-file-input" name="image" placeholder="Pilih Gambar">
                                                <label class="custom-file-label" for="inputGroupFile01">Pilih Gambar</label>
                                            </div>
                                            @error('image')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" class="@error('min') is-invalid @enderror form-control" name="min" placeholder="Min">
                                            @error('min')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-user"></i>
                                            </div>
                                            <label for="first-name-floating-icon">Min</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" class="@error('rate') is-invalid @enderror form-control" name="rate" placeholder="Rate">
                                            @error('rate')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-dollar-sign"></i>
                                            </div>
                                            <label for="email-id-floating-icon">Rate</label>

                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" class="@error('rekening') is-invalid @enderror form-control" name="rekening" placeholder="Rekening">
                                            @error('rekening')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-dollar-sign"></i>
                                            </div>
                                            <label for="email-id-floating-icon">Rekening</label>

                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" class="@error('code') is-invalid @enderror form-control" name="code" placeholder="Code">
                                            @error('code')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-globe"></i>
                                            </div>
                                            <label for="email-id-floating-icon">Code</label>

                                        </div>
                                    </div>            
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <fieldset class="form-group">
                                                <select name="jenis" class="@error('jenis') is-invalid @enderror form-control" id="basicSelect">
                                                    <option value="">-- Pilih Jenis --</option>
                                                    <option value="otomatis">Otomatis</option>
                                                    <option value="manual">Manual</option>
                                                </select>
                                                @error('jenis')
                                                <small class="text-danger">{{$message}}.</small>
                                                @enderror
                                            </fieldset>
                                            <div class="form-control-position">
                                                <i class="feather icon-zap"></i>
                                            </div>
                                            <label for="contact-floating-icon">jenis</label>
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
        <div class="col-md-6 col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Jenis Deposit</h4>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <p class="card-text">Berikut merupakan data yang ada dan telah ditambahkan, deposit akan muncul pada halaman deposit.</p>
                        <div class="table-responsive">
                            <table class="table zero-configuration" id="cat-table">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
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
    @if (session('deposit'))
        
    <!-- Modal -->
    
    @foreach (session('deposit') as $item)
    <div class="modal fade text-left" id="default" tabindex="-1" aria-labelledby="myModalLabel1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel1">#{{ $item->id }}&nbsp;{{ $item->name }}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="POST" action={{$site->url.'/dashboard/admin/deposit/'.$item->id.'/update'}}>
                    @csrf
                <div class="modal-body">
                    <div class="form-body m-2">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" class="@error('name') is-invalid @enderror form-control" name="name" value={{$item->name}} placeholder="Name">
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
                                    <input type="text" class="@error('min') is-invalid @enderror form-control" name="min" value={{$item->min}} placeholder="Min">
                                    @error('min')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-user"></i>
                                    </div>
                                    <label for="first-name-floating-icon">Min</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" class="@error('rate') is-invalid @enderror form-control" value={{$item->rate}} name="rate" placeholder="Rate">
                                    @error('rate')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-dollar-sign"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Rate</label>

                                </div>
                            </div>
                            
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" class="@error('rekening') is-invalid @enderror form-control" value={{$item->rekening}}  name="rekening" placeholder="Rekening">
                                    @error('rekening')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-dollar-sign"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Rekening</label>

                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" class="@error('code') is-invalid @enderror form-control" value={{$item->code}}  name="code" placeholder="Code">
                                    @error('code')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-globe"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Code</label>

                                </div>
                            </div>
                                        
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <fieldset class="form-group">
                                        <select name="jenis" class="@error('jenis') is-invalid @enderror form-control" id="basicSelect">
                                            <option value={{$item->jenis}}>{{$item->jenis}}</option>
                                            <option value="">-- Pilih Jenis --</option>
                                            <option value="otomatis">Otomatis</option>
                                            <option value="manual">Manual</option>
                                        </select>
                                        @error('jenis')
                                        <small class="text-danger">{{$message}}.</small>
                                        @enderror
                                    </fieldset>
                                    <div class="form-control-position">
                                        <i class="feather icon-zap"></i>
                                    </div>
                                    <label for="contact-floating-icon">jenis</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <fieldset class="form-group">
                                        <select name="status" class="@error('status') is-invalid @enderror form-control" id="basicSelect">
                                            <option value={{$item->status}}>{{$item->status}}</option>
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
    @endforeach
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
                ajax: "{{ route('deposit.admin.json') }}",
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'name', name: 'name' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', searchable:'false' }
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