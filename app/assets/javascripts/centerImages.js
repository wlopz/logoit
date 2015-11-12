$(document).load(function() {
	$(".well").each(function(index, element) {
		var img = $(element).children(".image");
		$(img).attr("id", index);
		$("div#" + index).css("margin-top", ( 320 - $(img).outerHeight())/2); 
	});
});