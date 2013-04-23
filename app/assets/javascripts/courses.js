jQuery(document).ready(function() {
	jQuery('.taken', this).click(function() {
		var data=$(this).attr('href');
		$.ajax({
			type: "POST", url: "http://"+location.host+"/add/"+data, data: data,
		});
		//$('#taken').hide();
		$(this).text('');
		$(this).replaceWith('<img src="/assets/icon_checkmark_green_small.png">');
		return false;
	});
});