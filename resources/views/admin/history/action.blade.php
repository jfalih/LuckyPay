<a href="{{$site->url.'/history/'.$slug.'/'.$id}}" class='btn btn-relief-primary mr-1 mb-1 waves-effect waves-light'>
    <i class='feather icon-eye text-white'></i>
</a>
<form action="{{ route('order.admin.show',[$slug, $id])}}" method="post">
    @csrf
<button type="submit" class='btn btn-relief-warning mr-1 mb-1 waves-effect waves-light'>
    <i class='feather icon-edit text-white'></i>
</button>
</form>
<form action="{{ route('order.admin.destroy',[$slug, $id])}}" method="post">
    @method('DELETE')
    @csrf
    <button type="submit" class="btn btn-relief-danger mr-1 mb-1 waves-effect waves-light">
        <i class="feather icon-trash text-white"></i>
    </button>
</form>