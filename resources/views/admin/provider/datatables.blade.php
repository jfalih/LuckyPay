<form action={{route('provider.admin.show')}} method="POST">
    @csrf
<input type="hidden" name="id" value={{$id}}>
<button type='submit'class='btn btn-relief-primary mr-1 mb-1 waves-effect waves-light'>
    <i class='feather icon-edit text-white'></i>
</button>
</form>
<a href="/dashboard/admin/provider/delete/{{$id}}" class="btn btn-relief-danger mr-1 mb-1 waves-effect waves-light">
    <i class="feather icon-trash text-white"></i>
</a>