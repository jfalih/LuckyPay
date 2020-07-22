@extends('admin.history')
@section('pln')
<div class="col-md-12 col-12">
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">
                <i class="feather icon-{{$template->icon}}"></i>&nbsp;History&nbsp;{{$template->name}}</h4>
        </div>
        <div class="card-content">
            <div class="card-body card-dashboard">
                <p class="card-text">Berikut merupakan data yang anda telah order.</p>
                <div class="table-responsive" >
                    <table class="table" id="cat-table">
                        <thead>
                            <tr>
                                <th></th>
                                <th>History Id</th>
                                <th>Operan Id</th>
                                <th>Provider</th>
                                <th>Name</th>
                                <th>Kuantitas</th>
                                <th>Target</th>
                                <th>Sn</th>
                                <th>Harga</th>
                                <th>Keuntungan</th>
                                <th>Pembeli</th>
                                <th>Status</th>
                                <th>Operan</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

    @if (session('order'))
        
    <!-- Modal -->
    
    @foreach (session('order') as $item)
    <div class="modal fade text-left" id="default" tabindex="-1" aria-labelledby="myModalLabel1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel1">#{{ $item->id }}&nbsp;{{ $item->user->name }}</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form method="POST" action="{{route('order.admin.edit', [$template->slug, $item->id])}}">
                    @csrf
                <div class="modal-body">
                    <div class="form-body">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input readonly type="text" class="form-control" value="{{$item->target}}">
                                    <div class="form-control-position">
                                        <i class="feather icon-user"></i>
                                    </div>
                                    <label for="first-name-floating-icon">Target</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input readonly type="text" class="form-control" value="{{$item->service->name}}" placeholder="Quantity">
                                    <div class="form-control-position">
                                        <i class="feather icon-feather"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Service</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input readonly type="text" class="form-control" value="{{$item->user->name}}" placeholder="Pembeli">
                                    <div class="form-control-position">
                                        <i class="feather icon-globe"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Pembeli</label>

                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <input readonly type="text" class="form-control" value="{{$item->price}}" placeholder="Harga">
                                    <div class="form-control-position">
                                        <i class="feather icon-dollar-sign"></i>
                                    </div>
                                    <label for="email-id-floating-icon">Harga</label>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-label-group position-relative has-icon-left">
                                    <fieldset class="form-group">
                                        <select name="status" class="@error('status') is-invalid @enderror form-control" id="basicSelect">
                                            <option value="{{$item->status}}">{{$item->status}}</option>
                                            <option value="">-- Pilih Status --</option>
                                            <option value="pending">Pending</option>
                                            <option value="success">Success</option>
                                            <option value="canceled">Canceled</option>
                                            <option value="processing">Processing</option>
                                            <option value="partial">Partial</option>
                                            <option value="error">Error</option>
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
                                        <select name="refund" class="@error('refund') is-invalid @enderror form-control" id="basicSelect">
                                            <option value="{{$item->refund}}">{{$item->refund}}</option>
                                            <option value="">-- Pilih Refund --</option>
                                            <option value="YES">YES</option>
                                            <option value="NO">NO</option>
                                        </select>
                                        @error('refund')
                                        <small class="text-danger">{{$message}}.</small>
                                        @enderror
                                    </fieldset>
                                    <div class="form-control-position">
                                        <i class="feather icon-zap"></i>
                                    </div>
                                    <label for="contact-floating-icon">Refund</label>
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
@section('barujs')
    
<script>
    var site = {!! json_encode($site->toArray()) !!};
    var category = {!! json_encode($template) !!};
    $(function() {
            $('#cat-table').DataTable({
                processing: true,
                serverSide: true,
                 "order": [[ 1, "desc" ]],
                ajax: site.url + "/dashboard/admin/history/"+ category.slug +"/json",
                columns: [
                    { data: 'via', name: 'via' },
                    { data: 'id', name: 'id' },
                    { data: 'trx_id', name: 'trx_id' },
                    { data: 'provider', name: 'provider' },
                    { data: 'service.name', name: 'service.name', orderable:false},
                    { data: 'quantity', name:'quantity'},
                    { data: 'target', name:'target'},
                    { data: 'sn', name:'sn'},
                    { data: 'price', name:'price'},
                    { data: 'keuntungan', name:'keuntungan', orderable:false},
                    { data: 'user.name', name:'user.name', orderable:false},
                    { data: 'status', name: 'status' },
                    { data: 'operan', name: 'operan' },
                    { data: 'action', name: 'action', searchable:'false' }
                ]
            });
        });
    </script>
    
    @if (session('order'))
        <script>
            $(window).on('load',function() {
                $('#default').modal('show');
            });
        </script>
    @endif
@endsection