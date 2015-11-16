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
//= require dropzone
//= require turbolinks
//= require_tree .
//= require agency/agency


var ready = function() {
	var container = $('.well');
	var content = $('.image');
	
	$(".shake").jrumble({x: 1,y: 0, rotation: 0 });

	$(".glyphicon").hover(function(){
		$(this).closest("div.shake").trigger('startRumble');
	}, function(){
		$(this).closest("div.shake").trigger('stopRumble');
	});
	$(".well").jrumble({x: 1,y: 0, rotation: 0 });
	$(".glyphicon").hover(function(){
		$(this).closest("div.well").trigger('startRumble');
	}, function(){
		$(this).closest("div.well").trigger('stopRumble');
	});
	Dropzone.autoDiscover = false;

	// grap our upload form by its id
	$("#logoupload").dropzone({
		// restrict image size to a maximum 1MB
		maxFilesize: 1,
		// changed the passed param to one accepted by
		// our rails app
		paramName: "logo[image]",
		// show remove links on each image upload
		addRemoveLinks: true
	});
}
$(document).ready(ready);
$(document).on('page:load', ready);






