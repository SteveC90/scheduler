jQuery(document).ready(function() {
	jQuery('#subject_id').change(function() {
		var data=$('#subject_id').val();
		$.ajax({
			type: "POST", url: "http://"+location.host+"/dynamic_courses/"+data, data: data,
		});
	});
});