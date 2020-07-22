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
                <div class="card-header">
                    <h4 class="card-title">Pengaturan Website</h4>
                </div>
                <div class="card-content">
                    <form class="form" method="POST" enctype="multipart/form-data" action={{ route('website.admin.update') }}>
                        @csrf
                    <div class="card-body">
                            <div class="form-body">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group position-relative ">
                                            <div class="custom-file">
                                                <input type="file" {{$site->url."/storage/".$site->image}} id="inputGroupFile01" class="@error('file') is-invalid @enderror custom-file-input" name="file" placeholder="Logo">
                                                <label class="custom-file-label" for="inputGroupFile01">Pilih Gambar Logo</label>
                                            </div>
                                            @error('file')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" value="{{$site->name}}" class="@error('name') is-invalid @enderror form-control" name="name" placeholder="Name">
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
                                            <input type="text" value={{$site->url}} class="@error('link') is-invalid @enderror form-control" name="link" placeholder="Link">
                                            @error('link')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-feather"></i>
                                            </div>
                                            <label for="email-id-floating-icon">Link</label>

                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" value={{$site->telp}} class="@error('telp') is-invalid @enderror form-control" name="telp" placeholder="Telepon">
                                            @error('telp')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-phone"></i>
                                            </div>
                                            <label for="email-id-floating-icon">Telepon</label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="email" value={{$site->email}} class="@error('email') is-invalid @enderror form-control" name="email" placeholder="Email">
                                            @error('email')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-mail"></i>
                                            </div>
                                            <label for="email-id-floating-icon">Email</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" value="{{$site->title}}" class="@error('title') is-invalid @enderror form-control" name="title" placeholder="Judul">
                                            @error('title')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-globe"></i>
                                            </div>
                                            <label for="email-id-floating-icon">Judul</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <fieldset class="form-group">
                                            <textarea class="form-control @error('description') is-invalid @enderror" id="basicTextarea" rows="3" placeholder="Description" name="description">{{$site->description}}</textarea>
                                            @error('description')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                        </fieldset>
                                    </div>
                                    <div class="col-12">
                                        <fieldset class="form-group">
                                            <textarea class="form-control @error('alamat') is-invalid @enderror " id="basicTextarea" rows="3" placeholder="Alamat" name="alamat">{{$site->alamat}}</textarea>
                                            @error('alamat')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                        </fieldset>
                                    </div>
                                    
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <fieldset class="form-group">
                                                <select name="status" class="@error('status') is-invalid @enderror form-control" id="basicSelect">
                                                    <option value={{$site->status}}>@if ($site->status === 'not')
                                                        Not Maintenance
                                                        @else
                                                        Maintenance
                                                        @endif</option>
                                                    <option value="">-- Pilih Status --</option>
                                                    <option value="maintenance">Maintenance</option>
                                                    <option value="not">Not Maintenance</option>
                                                </select>
                                                @error('status')
                                                <small class="text-danger">{{$message}}.</small>
                                                @enderror
                                            </fieldset>
                                            <div class="form-control-position">
                                                <i class="feather icon-zap"></i>
                                            </div>
                                            <label for="contact-floating-icon">Maintenance</label>
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
    </div>
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
                ajax: "{{ route('operan.admin.json') }}",
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'name', name: 'name' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', searchable:'false' }
                ]
            });
        });
    </script>
    
@endsection