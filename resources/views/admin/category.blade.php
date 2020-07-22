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
                    <h4 class="card-title">Tambah Category</h4>
                </div>
                <div class="card-content">
                    <form class="form" method="POST" action={{ route('cat.admin.add') }}>
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
                                            <input type="text" class="@error('icon') is-invalid @enderror form-control" name="icon" placeholder="Icon">
                                            @error('icon')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-feather"></i>
                                            </div>
                                            <label for="email-id-floating-icon">Icon</label>

                                        </div>
                                    </div>
                                    
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" class="@error('slug') is-invalid @enderror form-control" name="slug" placeholder="Slug">
                                            @error('slug')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-globe"></i>
                                            </div>
                                            <label for="email-id-floating-icon">Slug</label>

                                        </div>
                                    </div>
                                    
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <fieldset class="form-group">
                                                <select name="template" class="@error('template') is-invalid @enderror form-control" id="basicSelect">
                                                    <option value="">-- Pilih Template --</option>
                                                    <option value="pln">PLN</option>
                                                    <option value="pulsa">Pulsa</option>
                                                    <option value="sosmed">Sosmed</option>
                                                </select>
                                                @error('template')
                                                <small class="text-danger">{{$message}}.</small>
                                                @enderror
                                            </fieldset>
                                            <div class="form-control-position">
                                                <i class="feather icon-zap"></i>
                                            </div>
                                            <label for="contact-floating-icon">Template</label>
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
                    <h4 class="card-title">Category</h4>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <p class="card-text">Berikut merupakan data yang ada dan telah ditambahkan, category akan muncul pada halaman home.</p>
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
        <div class="col-12">
            <div class="card">
                <h4 class="m-1">Demo Category</h4>
            </div>
            <div class="row">
            @forelse ($category as $cat)
            <div class="col-3 col-sm-3">
                <div class="card text-center">
                    <div class="card-content">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="avatar bg-rgba-primary p-50 m-0 mt-1 mb-3">
                                        <div class="avatar-content">
                                            <i class="{{$cat->icon}} text-primary font-large-5"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">                                                
                                    <a href={{ $site['url']."/category/".$cat->slug }} class="btn btn-block btn-outline-primary mb-0 waves-effect waves-light">
                                        {{ $cat->name }}
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @empty
            <div class="col-12">
                <h4 class="text-center">No data available</h4>
            </div>
            @endforelse
            </div>
        </div>
    </div>
    @if (session('category'))
        
    <!-- Modal -->
    
    @foreach (session('category') as $item)
    <div class="modal fade text-left" id="default" tabindex="-1" aria-labelledby="myModalLabel1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel1">#{{ $item->id }}&nbsp;{{ $item->name }}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="POST" action={{route('cat.admin.edit')}}>
                    @csrf
                <div class="modal-body">
                    <div class="form-body m-2">
                        <div class="row">
                            <div class="col-12">
                                <input type="hidden" name="id" value={{$item->id}}>
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" class="@error('name') is-invalid @enderror form-control" name="name" value="{{$item->name}}" placeholder="Name">
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
                                    <input type="text" class="@error('icon') is-invalid @enderror form-control" name="icon" value="{{$item->icon}}" placeholder="Icon">
                                    @error('icon')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-feather"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Icon</label>

                                </div>
                            </div>
                            
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" class="@error('slug') is-invalid @enderror form-control" name="slug" value="{{$item->slug}}" placeholder="Slug">
                                    @error('slug')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-globe"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Slug</label>

                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <fieldset class="form-group">
                                        <select name="template" class="@error('template') is-invalid @enderror form-control" id="basicSelect">
                                            <option value="{{$item->template}}">{{$item->template}}</option>
                                            <option value="">-- Pilih Template --</option>
                                            <option value="pulsa">Pulsa</option>
                                            <option value="sosmed">Sosmed</option>
                                            <option value="pln">PLN</option>
                                        </select>
                                        @error('template')
                                        <small class="text-danger">{{$message}}.</small>
                                        @enderror
                                    </fieldset>
                                    <div class="form-control-position">
                                        <i class="feather icon-zap"></i>
                                    </div>
                                    <label for="contact-floating-icon">Status</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <fieldset class="form-group">
                                        <select name="status" class="@error('status') is-invalid @enderror form-control" id="basicSelect">
                                            <option value="{{$item->status}}">{{$item->status}}</option>
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
                ajax: "{{ route('cat.admin.json') }}",
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'name', name: 'name' },
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', searchable:'false' }
                ]
            });
        });
    </script>
    
    @if (session('category'))
        <script>
            $(window).on('load',function() {
                $('#default').modal('show');
            });
        </script>
    @endif
@endsection