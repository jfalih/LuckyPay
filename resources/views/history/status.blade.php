@if ($status === "pending")
<div class="badge badge-warning">{{$status}}</div>
@endif
@if ($status === "success")
<div class="badge badge-success">{{$status}}</div>
@endif
@if ($status === "canceled")
<div class="badge badge-danger">{{$status}}</div>
@endif
@if ($status === "error")
<div class="badge badge-danger">{{$status}}</div>
@endif
@if ($status === "partial")
<div class="badge badge-danger">{{$status}}</div>
@endif
@if ($status === "processing")
<div class="badge badge-info">{{$status}}</div>
@endif