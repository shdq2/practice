var is_chk = $.cookie('chk');
if(is_chk == 'y'){
	var id = $.cookie('id');
	var pw = $.cookie('pw');
	$('#id').val(id);
	$('#pw').val(pw);
	$('#rememberme-0').attr("checked",true);
}

$('#signin').click(function(){
	if($('#rememberme-0').is(':checked')){
		var id = $('#id').val();
		var pw = $('#pw').val();
		
		$.cookie('id',id,{expried:1});
		$.cookie('pw',pw,{expried:1});
		$.cookie('chk','y',{expried:1});
	}else{
		$.cookie('id',"",{expried:1});
		$.cookie('pw',"",{expried:1});
		$.cookie('chk','n',{expried:1});
	}
	});