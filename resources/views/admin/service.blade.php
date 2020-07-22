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
                    <h4 class="card-title">Tambah Service</h4>
                </div>
                <div class="card-content">
                    <form class="form" method="POST" action={{ route('service.admin.add') }}>
                        @csrf
                    
                        <div class="card-body">
                            <div class="form-body">
                    <div class="row">
                    <div class="col-md-6">
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
                                                <input type="text" class="@error('code') is-invalid @enderror form-control" name="code" placeholder="Code">
                                                @error('code')
                                                <small class="text-danger">{{$message}}.</small>
                                                @enderror
                                                <div class="form-control-position">
                                                    <i class="feather icon-feather"></i>
                                                </div>
                                                <label for="email-id-floating-icon">Code</label>

                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-label-group position-relative has-icon-left">
                                                <input type="text" class="@error('code_operan') is-invalid @enderror form-control" name="code_operan" placeholder="Code Operan">
                                                @error('code_operan')
                                                <small class="text-danger">{{$message}}.</small>
                                                @enderror
                                                <div class="form-control-position">
                                                    <i class="feather icon-feather"></i>
                                                </div>
                                                <label for="email-id-floating-icon">Code Operan</label>

                                            </div>
                                        </div>                     
                                        <div class="col-12">
                                            <div class="form-label-group position-relative has-icon-left">
                                                <input type="text" class="@error('price') is-invalid @enderror form-control" name="price" placeholder="Price">
                                                @error('price')
                                                <small class="text-danger">{{$message}}.</small>
                                                @enderror
                                                <div class="form-control-position">
                                                    <i class="feather icon-globe"></i>
                                                </div>
                                                <label for="email-id-floating-icon">Price</label>

                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-label-group position-relative has-icon-left">
                                                <input type="text" class="@error('price_api') is-invalid @enderror form-control" name="price_api" placeholder="Price Api">
                                                @error('price_api')
                                                <small class="text-danger">{{$message}}.</small>
                                                @enderror
                                                <div class="form-control-position">
                                                    <i class="feather icon-globe"></i>
                                                </div>
                                                <label for="email-id-floating-icon">Price Api</label>
                                            </div>
                                        </div>                                        
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" class="@error('price_operan') is-invalid @enderror form-control" name="price_operan" placeholder="Price Operan">
                                            @error('price_operan')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-globe"></i>
                                            </div>
                                            <label for="email-id-floating-icon">Price Operan</label>
                                        </div>
                                    </div>
                                    
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" class="@error('note') is-invalid @enderror form-control" name="note" placeholder="Note / Catatan Pada Service">
                                            @error('note')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-clipboard"></i>
                                            </div>
                                            <label for="email-id-floating-icon">Note</label>
                                        </div>
                                    </div>

                                    </div>
                    </div>
                    <div class="col-md-6">
                                <div class="row">
                                    
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" class="@error('min') is-invalid @enderror form-control" name="min" placeholder="min">
                                            @error('min')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-link"></i>
                                            </div>
                                            <label for="email-id-floating-icon">Min</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <input type="text" class="@error('max') is-invalid @enderror form-control" name="max" placeholder="max">
                                            @error('max')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="feather icon-link"></i>
                                            </div>
                                            <label for="email-id-floating-icon">Max</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <fieldset class="form-group">
                                                <select name="operan" class="@error('operan') is-invalid @enderror form-control" id="basicSelect">
                                                    <option value="">-- Pilih Operan --</option>
                                                    @foreach ($operan as $oper)
                                                    <option value={{$oper->id}}>{{$oper->name}}</option>
                                                    @endforeach
                                                </select>
                                                @error('operan')
                                                <small class="text-danger">{{$message}}.</small>
                                                @enderror
                                            </fieldset>
                                            <div class="form-control-position">
                                                <i class="feather icon-zap"></i>
                                            </div>
                                            <label for="contact-floating-icon">Operan</label>
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
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <fieldset class="form-group">
                                                <select name="category" class="@error('templalte') is-invalid @enderror form-control" id="basicSelect">
                                                    <option value="">-- Pilih Category --</option>
                                                    @foreach($category as $cat)
                                                    <option value={{$cat->id}}>{{$cat->name}}</option>
                                                    @endforeach
                                                </select>
                                                @error('category')
                                                <small class="text-danger">{{$message}}.</small>
                                                @enderror
                                            </fieldset>
                                            <div class="form-control-position">
                                                <i class="feather icon-zap"></i>
                                            </div>
                                            <label for="contact-floating-icon">Category</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-label-group position-relative has-icon-left">
                                            <fieldset class="form-group">
                                                <select name="provider" id="provider" class="@error('provider') is-invalid @enderror form-control" id="basicSelect">
                                                    <option value="">-- Pilih Provider --</option>                                 
                                                </select>
                                                @error('provider')
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
                                            <input type="text" class="@error('point') is-invalid @enderror form-control" name="point" placeholder="Point jika memesan layanan ini">
                                            @error('point')
                                            <small class="text-danger">{{$message}}.</small>
                                            @enderror
                                            <div class="form-control-position">
                                                <i class="fa fa-trophy"></i>
                                            </div>
                                            <label for="email-id-floating-icon">Price Operan</label>
                                        </div>
                                    </div>        
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
                    <h4 class="card-title">Service</h4>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <p class="card-text">Berikut merupakan data yang ada dan telah ditambahkan, service akan muncul pada halaman home.</p>
                        <div class="table-responsive">
                            <table class="table zero-configuration" id="cat-table">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Code</th>
                                        <th>Code Operan</th>
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
    @if (session('service'))
        
    <!-- Modal -->
    
    @foreach (session('service') as $item)
    <div class="modal fade text-left" id="default" tabindex="-1" aria-labelledby="myModalLabel1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content" style="overflow-y:auto">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel1">#{{ $item->id }}&nbsp;{{ $item->name }}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="POST" action={{route('service.admin.edit')}}>
                    @csrf
                <div class="modal-body">
                    <div class="form-body m-2">
                        <div class="row">
                            <div class="col-12">
                                <input type="hidden" name="id" value={{$item->id}}>
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
                                    <input type="text" value={{$item->code}} class="@error('code') is-invalid @enderror form-control" name="code" placeholder="Code">
                                    @error('code')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-feather"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Code</label>

                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" value={{$item->code_operan}} class="@error('code_operan') is-invalid @enderror form-control" name="code_operan" placeholder="Code Operan">
                                    @error('code_operan')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-feather"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Code Operan</label>

                                </div>
                            </div>                     
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" value={{$item->price}} class="@error('price') is-invalid @enderror form-control" name="price" placeholder="Price">
                                    @error('price')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-globe"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Price</label>

                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" value={{$item->price_api}} class="@error('price_api') is-invalid @enderror form-control" name="price_api" placeholder="Price Api">
                                    @error('price_api')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-globe"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Price Reseller</label>
                                </div>
                            </div>
   
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" value={{$item->price_operan}} class="@error('price_operan') is-invalid @enderror form-control" name="price_operan" placeholder="Price Operan">
                                    @error('price_operan')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-globe"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Price Operan</label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" value={{$item->note}} class="@error('note') is-invalid @enderror form-control" name="note" placeholder="Note / Catatan Pada Service">
                                    @error('note')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-clipboard"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Note</label>
                                </div>
                            </div>

                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" value={{$item->min}} class="@error('min') is-invalid @enderror form-control" name="min" placeholder="min">
                                    @error('min')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-link"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Min</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" value={{$item->max}} class="@error('max') is-invalid @enderror form-control" name="max" placeholder="max">
                                    @error('max')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="feather icon-link"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Max</label>
                                </div>
                            </div>
                            
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input type="text" value={{$item->point}} class="@error('point') is-invalid @enderror form-control" name="point" placeholder="Point">
                                    @error('point')
                                    <small class="text-danger">{{$message}}.</small>
                                    @enderror
                                    <div class="form-control-position">
                                        <i class="fa fa-trophy"></i>
                                    </div>
                                    <label for="email-id-floating-icon">point</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <fieldset class="form-group">
                                        <select name="operan" class="@error('operan') is-invalid @enderror form-control" id="basicSelect">
                                            <option value={{$item->operan->id}}>{{$item->operan->name}}</option>
                                            @foreach ($operan as $oper)
                                            <option value={{$oper->id}}>{{$oper->name}}</option>
                                            @endforeach
                                        </select>
                                        @error('operan')
                                        <small class="text-danger">{{$message}}.</small>
                                        @enderror
                                    </fieldset>
                                    <div class="form-control-position">
                                        <i class="feather icon-zap"></i>
                                    </div>
                                    <label for="contact-floating-icon">Operan</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <fieldset class="form-group">
                                        <select name="status" class="@error('status') is-invalid @enderror form-control" id="basicSelect">
                                            <option value={{$item->status}}>
                                            @if ($item->status === "active")
                                                Active
                                            @else
                                                Not Active
                                            @endif    
                                            </option>
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
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <fieldset class="form-group">
                                        <select name="category" class="@error('category') is-invalid @enderror form-control" id="basicSelect">
                                            <option value="">-- Pilih Category --</option>
                                            @foreach($category as $cat)
                                            <option value={{$cat->id}}>{{$cat->name}}</option>
                                            @endforeach
                                        </select>
                                        @error('category')
                                        <small class="text-danger">{{$message}}.</small>
                                        @enderror
                                    </fieldset>
                                    <div class="form-control-position">
                                        <i class="feather icon-zap"></i>
                                    </div>
                                    <label for="contact-floating-icon">Category</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <fieldset class="form-group">
                                        <select name="provider" id="provider" class="@error('provider') is-invalid @enderror form-control" id="basicSelect">
                                            <option value={{$item->provider->id}}>{{$item->provider->name}}</option>
                                            
                                        </select>
                                        @error('provider')
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
      var site = {!! json_encode($site->toArray()) !!};
        $(function() {
            $('#cat-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: "{{ route('service.admin.json') }}",
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'code', name: 'code'},
                    { data: 'code_operan', name: 'code_operan'},
                    { data: 'name', name: 'name'},
                    { data: 'status', name: 'status' },
                    { data: 'action', name: 'action', searchable:'false' }
                ]
            });
        });

        $(function(){
            $('select[name=category]').change(function(){
              var url = site.url +'/dashboard/admin/category/' + $(this).val() + '/provider';  
                $.get(url,function(data){
                    var select = $('form select[name=provider]');
                    select.empty();
                    $.each(data,function(key,value) {
                        select.append('<option value=' + value.id + '>' + value.name + '</option>');
                    });
                });
            })
        });
    </script>
    @if (session('service'))
        <script>
            $(window).on('load',function() {
                $('#default').modal('show');
            });
        </script>
    @endif
@endsection