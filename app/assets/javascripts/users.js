jQuery(document).ready(function() {
	jQuery('.remove', this).click(function() {
		var data=$(this).attr('href');
		$.ajax({
			type: "POST", url: "http://"+location.host+"/remove_course/"+data, data: data,
		});
		//$('#taken').hide();
		$(this).parent().remove();
		return false;
	});
});