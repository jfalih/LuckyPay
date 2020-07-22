@extends('order')
@section('pulsa')
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
          <form class="form-horizontal" method="POST" action={{route('order', $template->slug)}}>
            @csrf
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<div class="controls">
                      <fieldset>
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text">NO</span>
                          </div>
                          <input name="nomorhp" id="nomorhp" class="@error('nomorhp') is-invalid @enderror form-control nomorhp" placeholder="Cth: 081234567891" aria-label="Amount (to the nearest dollar)">
                          @error('nomorhp')
                                        <small class="text-danger">{{$message}}.</small>
                          @enderror
                        </div>
                       </fieldset>
                      <div class="help-block"></div>
                    </div>
                  </div>
                <div id="service"></div>
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
      var template = {!! json_encode($template->toArray()) !!};
      var provider = {!! json_encode($provider->toArray()) !!};
      var kartu;
        $("#nomorhp").keyup(function(){
          const nope = $('#nomorhp').val();
          const operator = nope.substring(0,3);
          if( operator === '811' || operator === '812' || operator === '813'
          || operator === '821' || operator === '822' || operator === '852' || operator === '853'
          || operator === '823'){
            $("#nomorhp").addClass('telkomsel');
            var kartu = 'telkomsel';
          } else if(operator === '851'){
            $("#nomorhp").addClass('byu');
            var kartu = 'by.u';
          } else if(operator === '814' || operator === '815' || operator === '816'
          || operator === '855' || operator === '856' || operator === '857' || operator === '858'){
            $("#nomorhp").addClass('indosat');
            var kartu = 'indosat';
          } else if(operator === '817' || operator === '818' || operator === '819'
          || operator === '859' || operator === '877' || operator === '878') {
            $("#nomorhp").addClass('xl');
            var kartu = 'xl';
          } else if(operator === '838' || operator === '831' || operator === '832' || operator === '833'){
            $('#nomorhp').addClass('axis');
            var kartu = 'axis';
          } else if(operator === '895' || operator === '896' || operator === '897' || operator === '899'){
            $('#nomorhp').addClass('three');
            var kartu = 'three';
          } else if(operator === '881' || operator === '882' || operator === '883' || operator === '884'
          || operator === '885' || operator === '886' || operator === '887' || operator === '888' || operator === '889'){
            $('#nomorhp').addClass('smartfren');
            var kartu = 'smartfren';
          } else if(operator === '828'){
            $('#nomorhp').addClass('ceria');
            var kartu = 'ceria';
          } else if(nope.length < 3){
            const service = $('#service');
            service.empty();
            var kartu = null;
            $("#nomorhp").removeClass('telkomsel');
            $("#nomorhp").removeClass('indosat');
            $("#nomorhp").removeClass('xl');
            $("#nomorhp").removeClass('axis');
            $("#nomorhp").removeClass('three');
            $("#nomorhp").removeClass('smartfren');
            $("#nomorhp").removeClass('ceria');
          }
          const url = site.url + '/service/'+ template.slug + '/' + kartu +'/json';
          $.each(provider, function(provider_key,provider_value) { 
            const service = $('#service');      
                $.get(url,function(data){
                    service.empty();
                    let i = 0;
                    let j = 0;
                    $.each(data, function(key,value) {
                        service.append(
                          '<div class="form-group"><div class="vs-radio-con service"><input onchange="ubahNote(this)" type="radio" id="'+ i++ +'" name="service" value="'+ value.id +'"><span class="vs-radio"><span class="vs-radio--border"></span><span class="vs-radio--circle"></span></span><div class="nominal">'+ value.provider.name +'</div><div class="subnominal">'+ value.name +'</div><div class="harga"><div class="nominal">Harga</div><div class="subnominal">'+ value.price +'</div></div></div></div>'
                          );
                        service.append('<div id='+ "note" + j++ +' style="display:none" class="text-white card bg-primary"><div class="card-body">'+ value.note +'</div></div>')
                    });
                });
          });    
        });

      function ubahNote(input){
          const totalsebelum = Number(input.id) - 1;
          const totalsesudah = Number(input.id) + 1;
          const note = $('#note'+ input.id);
          const sebelum = $('#note' + totalsebelum);
          const sesudah = $('#note' + totalsesudah);
          sesudah.css('display','none');
          note.css('display','block');
          sebelum.css('display','none');  
      }
    </script>
@endsection