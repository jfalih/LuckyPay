<div class="row d-flex justify-content-around">
    <a href="{{$site.'/deposit/'.$id.'/history'}}" class="btn btn-primary"><i class="feather icon-eye"></i> Detail</a>
    <a href="{{$site.'/dashboard/admin/history/deposit/'.$id.'/show'}}" class="btn btn-warning"><i class="feather icon-edit"></i> Edit</a>
    <form action="{{route('deposit.delete', $id)}}" method="post" >
        @method('DELETE')
        @csrf 
        <button type="submit" class="btn btn-danger"><i class="feather icon-trash"></i> Delete</button>
    </form>
</div>