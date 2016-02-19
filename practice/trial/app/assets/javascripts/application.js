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
// = require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){

  $('#button').on('click', function(e){
    e.preventDefault();

    $.ajax({
      url: 'https://api.mapbox.com/uploads/v1/natasha-t/credentials?access_token=sk.eyJ1IjoibmF0YXNoYS10IiwiYSI6ImNpa3Q0YmhuYjAwMjl1YW0zMGJhcDAya2MifQ.C4u_Lx4TzEuA6HIkbTJFwg',
      type: 'GET'
    }).done(function(response){
      console.log("BEFORE")
      console.log(response)
      console.log("AFTER")
    });

  });

});