@extends('order')
@section('pln')
<section class="simple-validation">
	<div class="row mb-5">
		<div class="col-md-12">
      @if (session('error'))
            <div class="alert alert-danger m-1" role="alert">
                <strong>Oops..!</strong> {{session('error')}}
            </div>
            @endif
            @if (session('success'))
            <div class="alert alert-success m-1" role="alert">
                <strong>Yihaa..!</strong> {{session('success')}}
            </div>
            @endif
			<div class="card">
				<div class="card-header">
					<h4 class="card-title"><i class="{{$template->icon}}"></i>&nbsp;{{$template->name}}</h4>
				</div>
				<div class="card-content">
				    <div class="card-body">
                        <p>Silahkan pilih provider dibawah untuk order.</p>
                        <form class="form-horizontal" method="POST" action={{route('order', $template->slug)}}>
                            @csrf
        				    <div class="row">
        						<div class="col-sm-12">
                                    <div class="form-group">
                                        <div class="text-bold-600 font-medium-2 mb-1">
                                            Provider
                                        </div>
                                        <select name="provider" class="select2 form-control">
                                            <option value="">-- Pilih Provider --</option>
                                            @foreach ($provider as $prov)
                                            <option value={{$prov->id}}>{{$prov->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>            
        						<div class="col-sm-12">
                                            <div class="form-group">              
                                            <div class="text-bold-600 font-medium-2 mb-1">
                                                Layanan
                                            </div>
                                                <select name="service" class="select2 @error('service') is-invalid @enderror form-control">
                                                    <option value="">-- Pilih Provider Dahulu --</option>
                                                </select>
                                                @error('service')
                                                <small class="text-danger">{{$message}}.</small>
                                                @enderror
                                            </div>
                                   
                                        </div>
                				<div class="col-sm-12">
                						    <div class="form-group">
                						        <div class="text-bold-600 font-medium-2 mb-1">
                                                    Target
                                                </div>
                							    <div class="controls">
                                                  <fieldset>
                                                    <div class="input-group">
                                                      <div class="input-group-prepend">
                                                        <span class="input-group-text">ID/NO</span>
                                                      </div>
                                                      <input type="text" name="target" class="@error('target') is-invalid @enderror form-control nomorhp" placeholder="Cth:081234567891" aria-label="Target Harus Angka">
                                                      @error('target')
                                                                    <small class="text-danger">{{$message}}.</small>
                                                      @enderror
                                                    </div>
                                                   </fieldset>
                                                    <div class="help-block"></div>
                                                </div>
                                            </div>
                                        </div>
                                <div class="col-sm-12" id="note"></div>
                                <div class="col-sm-12">
                                            <div class="form-group">
                                            <div class="text-bold-600 font-medium-2 mb-1">
                                                Harga
                                            </div>
                                                <fieldset>
                                                    <div class="input-group">
                                                      <div class="input-group-prepend">
                                                        <span class="input-group-text">Rp</span>
                                                      </div>
                                                      <input name="price" id="price" type="text" class="form-control" aria-label="Amount (to the nearest dollar)" disabled>
                                                      <div class="input-group-append">
                                                        <span class="input-group-text">,00</span>
                                                      </div>
                                                    </div>
                                                  </fieldset>
                                            </div>
                                        </div>
                            </div>
                            <button type="submit" class="btn btn-primary waves-effect waves-light">Submit</button>
        					<button type="reset" class="btn btn-danger waves-effect waves-light">Reset</button>
			            </form>
                    </div>
                </div>
			</div>
		</div>
	</div>
</section>
@endsection
@section('barujs')
    <script>
          var site = {!! json_encode($site->toArray()) !!};
    $(function(){
        var provider = $('select[name=provider]');
        provider.change(function(){
          var url = site.url + '/provider/' + $(this).val() + '/service';  
            $.get(url,function(data){
                var select = $('form select[name=service]');
                select.empty();
                select.append('<option value="0" >-- Pilih Service --</option>')
                $.each(data,function(key,value) {
                    select.append('<option value=' + value.id + '>' + value.name + '</option>');
                });
            });
        })
    });
    $(function(){
        var service = $('select[name=service]');
        var quantity = $('input[name=quantity]');
        service.change(function(){
            var url = site.url + '/service/' + $(this).val() + '/json';
            $.get(url, function(data){
                var harga = $('#price');
                var note = $('#note')
                note.empty();
                harga.empty();
                $.each(data,function(key,value) {
                    harga.val(value.price);
                    note.append('<div class="col-sm-12"><div class="form-group"><div class="alert alert-primary">'+ value.note +'</div></div></div>')
                });
            })
        });
    })
    </script>
@endsection