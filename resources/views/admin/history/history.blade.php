@extends('admin.history')
@section('pulsa')
<div class="col-md-12 col-12">
    <div class="card">
        <div class="card-header">
            <h4 class="card-title">
                <i class="feather icon-{{$template->icon}}"></i>&nbsp;History&nbsp;{{$template->name}}</h4>
        </div>
        <div class="card-content">
            <div class="card-body card-dashboard">
                <p class="card-text">Berikut merupakan data yang anda telah order.</p>
                <div class="table-responsive-xl" >
                    <table class="table" id="cat-table">
                        <thead>
                            <tr>
                                <th></th>
                                <th>History Id</th>
                                <th>Name</th>
                                <th>Kuantitas</th>
                                <th>Target</th>
                                <th>Sn</th>
                                <th>Harga</th>
                                <th>Keuntungan</th>
                                <th>Pembeli</th>
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
@endsection
@section('barujs')
    
<script>
    var site = {!! json_encode($site->toArray()) !!};
    var category = {!! json_encode($template) !!};
    $(function() {
            $('#cat-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: site.url + "/dashboard/admin/history/"+ category.slug +"/json",
                columns: [
                    { data: 'via', name: 'via' },
                    { data: 'id', name: 'id' },
                    { data: 'service.name', name: 'service.name', orderable:false},
                    { data: 'quantity', name:'quantity'},
                    { data: 'target', name:'target'},
                    { data: 'sn', name:'sn'},
                    { data: 'price', name:'price'},
                    { data: 'keuntungan', name:'keuntungan', orderable:false},
                    { data: 'user.name', name:'user.name', orderable:false},
                    { data: 'status', name: 'status' },
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