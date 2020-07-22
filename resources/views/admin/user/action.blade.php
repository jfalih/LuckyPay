<div class="row">
    <a href={{route('user_show',$id)}} class="btn btn-warning ml-1 mr-1"><i class="feather icon-edit"></i></a>
    <form action="{{route('user.admin.delete', $id)}}" method="post">
        @method('DELETE')
        @csrf
        <button class="btn btn-danger" type="submit"><i class="feather icon-trash"></i></button>
    </form>
</div>