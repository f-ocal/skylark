$(document).ready(function(){
  // showBasicMap();
  // showMarkerOnTheMap()

//put access key in ENV variable
L.mapbox.accessToken = 'pk.eyJ1Ijoic2hhd25zcGVhcnMiLCJhIjoiY2lrdDJ2ZHI1MDAyNHZvbTNhZ3B2bm41MCJ9.WdbcbGGIoMKx9B3sC9ODuQ';


var mapGeo = L.mapbox.map('map_geo', 'mapbox.satellite').setView([27.433,-1.700], 3);

  $('.sidebar').hide();

   //Opacity handle
  opacityHandle(gon.images);

  gon.images.forEach ( function (image) {
    console.log(image)
    var layer = L.mapbox.tileLayer(image.map);
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
          'marker-color': '#cc33ff',
          'marker-symbol': 'marker-stroked',
        })
      });

      layer.addTo(mapGeo)
      marker.addTo(mapGeo)

    //Marker setup
      marker.on('click', function(e){
        mapGeo.setView([e.latlng.lat, e.latlng.lng], 14)

         //Toggle Sidebar
        $('.sidebar').show();
        $('#close-sb').on('click', function(){
          $('.sidebar').hide();
        })


       //Empty and Fill Info div with image information
        var tilesetName = image.tileset_name
        var tlNameH2Tag = '<h2 class="sb-tl-name">' + tilesetName + '</h2>'

        var username = image.username
        var usernamePTag = '<p class="sb-username"> Mapmaker: ' + image.username + '</p>'

        var cameraType = image.camera_type
        var cameraTypePTag = '<p class="sb-camera-type"> Camera Type: ' + cameraType + '</p>'

        var descr = image.description
        var descrPTag = '<p class="sb-desc">' + descr + '</p>'

        $('#info').empty();
        $('#info').append(tlNameH2Tag + usernamePTag + cameraTypePTag + descrPTag)
        });

         //Add and Remove marker on zoom
          mapGeo.on('zoomend', function(){
            if(mapGeo.getZoom() >= 10){
              marker.setOpacity(0);
            } else {
              marker.setOpacity(1);
            }
          });
        });
      });

  });

  var opacityHandle = function(images){
    var handle = document.getElementById('handle'),
    start = false,
    startTop;

    document.onmousemove = function(e){
      if(!start) return;
      //Adjust Control
      handle.style.top = Math.max(-5, Math.min(195, startTop + parseInt(e.clientY, 10) - start)) + 'px';
      //Adjust opacity -- loop through images

        image_layer.setOpacity(1 - (handle.offsetTop / 200));
    }

    handle.onmousedown = function(e) {
      // Record initial positions.
      console.log("working??")
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






