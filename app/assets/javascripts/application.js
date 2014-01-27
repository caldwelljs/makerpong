// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

// $(function(){ $(document).foundation(); 
//   $('.lose-navbar .top-bar').remove();

// });
// $( document ).ready(function() {
//   $(".winner-page-wrapper").css("background-color", "red");
// });


// Attempt for active link styling with addClass
// $(function() {
//   $('.top-right-links a[href^="/' + location.pathname.split("/")[1] + '"]').addClass('active');
// });


// Click and HOver for new game dropdown
  // $('#new-game').on('click', function () {
  //   $(".new-game-section").slideDown('fast');
  // })


  // $(document).ready(function () {
  //   $("#new-game").hover(function () {
  //       $(".new-game-section").toggleClass("show-log");  //Toggle the active class to the area is hovered
  //   }
  // });

$(document).ready(function() {
    $('.new-game-button').click(function(){

		$('.form-wrap').fadeIn().css('display','block');
    $('#close').click(function(){
    	// $('.modal-bg').fadeOut();		
    	$('.form-wrap').fadeOut();
         return false;
    });
	});
    $('.top-right-links a.active').on('click', function(){
    	$(this).removeClass('active');
	});
});




// var addPic = 
// $('.pic.empty').append('<div><%= link_to "Click Edit Profile to add a profile picture", edit_player_registration %></div>');

// $('#profile-pic').hover(function(){
//   $('#update-msg').toggle();
// });


// $( "li" ).hover(
//   function() {
//     $( this ).append( $( "<span> ***</span>" ) );
//   }, function() {
//     $( this ).find( "span:last" ).remove();
//   }
// );
