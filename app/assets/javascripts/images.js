$(document).ready(function(){


//put access key in ENV variable
L.mapbox.accessToken = 'pk.eyJ1Ijoic2hhd25zcGVhcnMiLCJhIjoiY2lrdDJ2ZHI1MDAyNHZvbTNhZ3B2bm41MCJ9.WdbcbGGIoMKx9B3sC9ODuQ';


  var mapGeo = L.mapbox.map('map_geo', 'mapbox.satellite').setView([27.433,-1.700], 3);

   gon.images.forEach ( function (image) {
      var layer = L.mapbox.tileLayer(image.map);

       layer.on('ready', function() {
          var tileJSON = layer.getTileJSON();
          var marker_lat = tileJSON.bounds[0]
          var marker_long = tileJSON.bounds[1]

          var marker = L.marker([(marker_long), marker_lat], {
            icon: L.mapbox.marker.icon({
              'marker-size': 'large',
              'marker-color': '#cc33ff',
              'marker-symbol': 'marker-stroked',

            })
          });

          layer.addTo(mapGeo)
          marker.addTo(mapGeo)

          marker.on('click', function(e){
            // e.preventDefault();
            mapGeo.setView([e.latlng.lat, e.latlng.lng], 11)

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

              mapGeo.on('zoomend', function(){
                if(mapGeo.getZoom() >= 8){
                  console.log("zoooooooom")
                  marker.setOpacity(0);
                }
                else{
                  marker.setOpacity(1);
                }

              })

        });

      });

  });

// Images Index
  //loads all markers, global view - DONE
  // Sidebar
      //hide on load
      //appear on click of marker, with clicked image info; upon clicking another marker, previous marker info disappears
      //toggle on and off on click





