// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var ready = function() {
	var container = $('.well');
	var content = $('.image');
	
	$(".shake").jrumble({x: 1,y: 0, rotation: 0 });

	$(".glyphicon").hover(function(){
		$(this).closest("div.shake").trigger('startRumble');
	}, function(){
		$(this).closest("div.shake").trigger('stopRumble');
	});
	 // $(".image").css("top-margin",$(".image").closest('.well').height() / 2);
	// $('.well').height());
	// content.css("left", (container.width()-content.width())/2);
	// content.css("top", (container.height()-content.height())/2);

}
$(document).ready(ready);
$(document).on('page:load', ready());

$(window).load(function() {
	$(".well").each(function(index, element) {
		var img = $(element).children(".image");
		$(img).attr("id", index);
		console.log($(img).children("a").children("img").outerHeight())	;
		$("div#" + index).css("margin-top", ( 320 - $(img).children("a").children("img").outerHeight())/2); 
	});
});