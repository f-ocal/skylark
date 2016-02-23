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
              'marker-symbol': 'marker-stroked'
            })
          });

          layer.addTo(mapGeo)
          marker.addTo(mapGeo)

          marker.on('click', function(e){
            mapGeo.setView([e.latlng.lat, e.latlng.lng], 11)
          });

        });

      });

  });







