<div class="row">
    <a href="/dashboard/admin/berita/{{$id}}" class="btn btn-relief-primary mr-1 mb-1 waves-effect waves-light">
        <i class="feather icon-edit text-white"></i>
    </a>
    <form action="{{ route('berita.admin.destroy', $id)}}" method="post">
        @method('DELETE')
        @csrf
        <button type="submit" class="btn btn-relief-danger mr-1 mb-1 waves-effect waves-light">
            <i class="feather icon-trash text-white"></i>
        </button>
     </form>
    
</div>