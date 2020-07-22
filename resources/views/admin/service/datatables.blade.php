<form action={{route('service.admin.show')}} method="POST">
    @csrf
<div class="row">
<input type="hidden" name="id" value={{$id}}>
<button type='submit'class='btn btn-relief-primary mr-1 mb-1 waves-effect waves-light'>
    <i class='feather icon-edit text-white'></i>
</button>
</form>
<a href="/dashboard/admin/service/delete/{{$id}}" class="btn btn-relief-danger mr-1 mb-1 waves-effect waves-light">
    <i class="feather icon-trash text-white"></i>
</a>
</div>