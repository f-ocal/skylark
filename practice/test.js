$(document).ready(function(){


  $.ajax({
    url: 'https://api.mapbox.com/uploads/v1/karlaking2/credentials?access_token=pk.eyJ1Ijoia2FybGFraW5nMiIsImEiOiJjaWV1d29pZ2QwczhwczltMm1lbWMxZnJmIn0._CLLgaefzXvhtCeSs61tzQ',
    type: 'GET'
  }).done(function(response){
    console.log("BEFORE")
    console.log(response)
    console.log("AFTER")
  });




});