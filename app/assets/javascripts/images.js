$(document).ready(function(){
  // showBasicMap();
  // showMarkerOnTheMap()

//put access key in ENV variable
L.mapbox.accessToken = 'pk.eyJ1Ijoic2hhd25zcGVhcnMiLCJhIjoiY2lrdDJ2ZHI1MDAyNHZvbTNhZ3B2bm41MCJ9.WdbcbGGIoMKx9B3sC9ODuQ';
var mapGeo = L.mapbox.map('map_geo', 'mapbox.satellite').setView([27.433,-1.700], 3);

$('.sidebar').hide();



  //Turn gon image into layer
  var layers = []
  gon.images.forEach ( function (image) {
    var layer = L.mapbox.tileLayer(image.map, {format: 'png128' });
    addMarkerstoLayer(mapGeo, layer, image);
    layers.push(layer)
    return layers;
  });

    //Opacity handle
    opacityHandle(layers);


});



var addMarkerstoLayer = function(map, layer, image){
    //add markers to layer
    layer.on('ready', function() {
      var tileJSON = layer.getTileJSON();

      var north_bound = tileJSON.bounds[3]
      var south_bound = tileJSON.bounds[1]
      var east_bound = tileJSON.bounds[0]
      var west_bound = tileJSON.bounds[2]

      var marker_long = (north_bound + south_bound)/2
      var marker_lat = (east_bound + west_bound)/2

      var marker = L.marker([(marker_long), marker_lat], {
        icon: L.mapbox.marker.icon({
          'marker-size': 'large',
          'marker-color': '#ED2152',
          'marker-symbol': 'marker-stroked',
        })
      });
      //add layer and marker to map
      layer.addTo(map)
      marker.addTo(map)

      displayImageInfoOnClick(map, marker, image)
    });
  }

  var displayImageInfoOnClick = function(map, marker, image){
    marker.on('click', function(e){
      map.setView([e.latlng.lat, e.latlng.lng], 14)

       //Empty and Fill Info div with image information
       var tilesetName = image.tileset_name
       var tlNameH2Tag = '<h2 class="sb-tl-name">' + tilesetName + '</h2>';
       var username = image.username;
       var usernamePTag = '<p class="sb-username"> Mapmaker: ' + image.username + '</p>';
       var cameraType = image.camera_type;
       var cameraTypePTag = '<p class="sb-camera-type"> Camera Type: ' + cameraType + '</p>';
       var descr = image.description;
       var descrPTag = '<p class="sb-desc">' + descr + '</p>';

       var voteCount = image.upvotes
       var voteCountPTag = '<p class="sb-votecount">' + voteCount + '</p>'

       $('#info').empty();
       $('#info').append(tlNameH2Tag + usernamePTag + cameraTypePTag + descrPTag + voteCountPTag);

         //Toggle Sidebar
         $('.sidebar').show();
        //  $('#close-sb').on('click', function(){
        //   $('.sidebar').hide();
        // });

         //Add and Remove marker on zoom
         map.on('zoomend', function(){
          if(map.getZoom() >= 10){
            marker.setOpacity(0);
          } else {
            marker.setOpacity(1);
          }
        });

       });
    }

var opacityHandle = function(image_layers){
  var handle = document.getElementById('handle'),
  start = false,
  startTop;

  document.onmousemove = function(e){
    if(!start) return;
      //Adjust Control
      handle.style.top = Math.max(-5, Math.min(195, startTop + parseInt(e.clientY, 10) - start)) + 'px';
      //Adjust opacity -- loop through images
      for(var i=0; i < image_layers.length; i++){
        image_layers[i].setOpacity(1 - (handle.offsetTop / 200));
      }
    }

    handle.onmousedown = function(e) {
      // Record initial positions.
      start = parseInt(e.clientY, 10);
      startTop = handle.offsetTop - 5;
      return false;
    };

    document.onmouseup = function(e) {
      start = null;
    };
  }






// Images Index
  //loads all markers, global view - DONE
  // Sidebar
      //hide on load
      //appear on click of marker, with clicked image info; upon clicking another marker, previous marker info disappears - DONE
      //toggle on and off on click






