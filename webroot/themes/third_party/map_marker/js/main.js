/*global L,mapmarker, $*/
'use strict';
function addMarker(ll, map) {
  var marker = L.marker(ll, {
      draggable: true,
      icon: L.mapbox.marker.icon({
          'marker-size': 'large',
          'marker-symbol': 'building',
          'marker-color': '#fff'
      })
    })

    marker.bindPopup(ll.label)

    marker.on('click', function(e) {
        e.target.setPopupContent(ll.label)
        marker.openPopup()
    })

    marker.addTo(map)
  return marker
}

$(function() {
  var mapId = 'noslouch.hp1dlcam',
    map = L.mapbox.map('map', mapId)
      .setView(
        L.latLng(mapmarker.map_center_lat, mapmarker.map_center_long),
        mapmarker.map_zoom)

  if ( mapmarker.landmarks ) {
    map.whenReady(function() {
      mapmarker.landmarks.forEach(function(landmark){
        var ll = L.latLng(landmark.lat, landmark.long)
        addMarker(ll, map)
      })
    })
  }
})
