<form method="POST" action="{{route('berita.show', $id)}}">
    @csrf
    <button class="btn btn-relief-primary mr-1 mb-1 waves-effect waves-light">
        <i class="feather icon-eye text-white"></i>&nbsp;Detail
    </button>
</form>