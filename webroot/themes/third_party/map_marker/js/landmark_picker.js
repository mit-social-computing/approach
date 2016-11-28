/*global $,L,window,document*/
$(function(){
    function addMarker(ll, type) {
        var popup, school, marker
        if ( type === 'school' && map.markerLayer.school ) {
            school = map.markerLayer.getLayer(map.markerLayer.school)
            school.setLatLng(ll)
            $('#mapmarker-' + school._leaflet_id + '-latlng').val([ll.lat, ll.lng])
        } else {
            popup = $('<a href="#" id="delete">Delete this landmark?</a>')
            marker = L.marker(ll, {
                draggable: true,
                icon: L.mapbox.marker.icon({
                    'marker-size': 'large',
                    'marker-symbol': type === 'school' ? 'building' : 'marker-stroked',
                    'marker-color': '#fff'
                })
            })

            // store for deleteMarker
            popup.data('marker', marker)

            marker.bindPopup(popup[0])
            marker.type = type

            marker.on('mouseover mouseout', hightlightInput)
            marker.on('dragend', dragMarkerHandler)
            marker.on('click', function(e) {
                e.target.setPopupContent(popup[0])
                marker.openPopup()
            })

            marker.addTo(map.markerLayer)

            if ( type === 'school' ) {
                map.markerLayer.school = marker._leaflet_id
            }
        }

        return marker
    }

    function dragMarkerHandler(e) {
        var lat = e.target._latlng.lat,
            lng = e.target._latlng.lng,
            markerId = e.target._leaflet_id

        $('#mapmarker-' + markerId  + '-latlng').val([lat, lng])
    }

    function hightlightInput(e) {
        $('.mapmarker-' + e.target._leaflet_id + '[type=text]').toggleClass('highlight')
    }

    function landmarkLabelToggle(e) {
        var markerId = $(e.target).data('markerId'),
            marker = map.markerLayer.getLayer(markerId),
            popup = $('<a href="#" id="delete">Delete this landmark?</a>')

        if (e.type === 'focusin') {
            marker.setPopupContent(e.target.value || '')
            marker.openPopup()
        } else if (e.type === 'focusout') {
            //marker.closePopup()
        }
    }

    function deleteMarker(e) {
        e.preventDefault()

        var marker = $(e.target).data('marker')
        map.markerLayer.removeLayer(marker)

        if (marker.type === 'school') {
            map.markerLayer.school = null
        }
    }

    function buildMenu() {
        var $menu = $('<ul id="landmarkMenu"/>')
                .append('<li id="schoolOption" />')
                .append('<li id="landmarkOption" />'),
            $landmarkLink = $('<a href="#" id="landmarkLink" />').text('Add Landmark Here'),
            schoolText = map.markerLayer.school ? 'Replace School' : 'Add School Here',
            $schoolLink = $('<a href="#" id="schoolLink" />').text(schoolText)

        $menu.find('#schoolOption').append($landmarkLink)
        $menu.find('#landmarkOption').append($schoolLink)

        return $menu
    }

    function openMarkerMenu(e) {
        var menu = buildMenu()

        // store for addMarker call inside markerMenuHandler
        menu.data('latlng', e.latlng)

        e.target.openPopup(menu[0], e.latlng)
    }

    function markerMenuHandler(e) {
        e.preventDefault()

        var latlng = $(e.target).parents('#landmarkMenu').data('latlng')

        if (e.target.id === 'landmarkLink') {
            addMarker(latlng, 'landmark')
        } else if (e.target.id === 'schoolLink') {
            addMarker(latlng, 'school')
        }

        map.closePopup()
    }

    function mapClickHandler(e) {
        var id = e.target.id

        if (id === 'landmarkLink' || id === 'schoolLink') {
            markerMenuHandler(e)
        } else if (id === 'delete') {
            deleteMarker(e)
        } else if (e.target.nodeName !== 'INPUT') {
            if ( document.activeElement !== undefined ) {
                document.activeElement.blur()
            } else {
                $('*:focus').blur()
            }
        }
    }

    function inputHandler(e) {
        var $list = $('#landmarkList'),
            $label, $latlng, markerId = e.layer._leaflet_id

        if ( e.type === 'layeradd' ) {
            $label = $('<input type="text" />').attr({
                placeholder : 'Enter a label for this landmark',
                class : 'mapmarker-' + markerId,
                name : 'mapmarker__school_map[landmarks][' + markerId + '][label]'
            }).data('markerId', markerId)

            $latlng = $('<input type="hidden" />').attr({
                class : 'mapmarker-' + markerId,
                name : 'mapmarker__school_map[landmarks][' + markerId + '][latlng]',
                id : 'mapmarker-' + markerId
            }).val( e.layer._latlng.toString().match(/[^A-Za-z\(\)]+/) )

            $type = $('<input type="hidden" />').attr({
                class : 'mapmarker-' + markerId,
                name : 'mapmarker__school_map[landmarks][' + markerId + '][type]'
            }).val( e.layer.type )

            $list.append($label).append($latlng).append($type)

        } else if ( e.type === 'layerremove' ) {
            $('.mapmarker-' + markerId).remove()
        }
    }

    function updateZoom(e) {
        document.getElementById('mapmarkerZoom').value = e.target._zoom
    }

    function updateCenter(e) {
        var lat = e.target.getCenter().lat,
            lng = e.target.getCenter().lng
        document.getElementById('mapmarkerCenter').value = [lat, lng]
    }


    var mapId = 'noslouch.hp1dlcam',
        map = L.mapbox.map('map', mapId)
            .setView(
                mapmarker.mapCenter ?
                    L.latLng(mapmarker.mapCenter[0], mapmarker.mapCenter[1]) :
                    [0, 0],
                mapmarker.zoom ? mapmarker.zoom : 10 )

    map.markerLayer.school = null
    map.addControl(L.mapbox.geocoderControl(mapId, {
        keepOpen : true
    }))

    if ( mapmarker.landmarks ) {
        map.whenReady(function() {
            setTimeout(function(){
                mapmarker.landmarks.forEach(function(landmark){
                    var ll = L.latLng(landmark.lat, landmark.long),
                        marker = addMarker(ll, landmark.type)

                    // all inputs for this landmark
                    $('.mapmarker-' + landmark.landmark_id).each(function(idx, el) {
                        el.className = 'mapmarker-' + marker._leaflet_id
                    })

                    // latlng hidden input for this landmark
                    // ID it so we can grab it later to update in case of drag event
                    $('#mapmarker-' + landmark.landmark_id + '-latlng')
                        .attr( 'id', 'mapmarker-' + marker._leaflet_id + '-latlng' )

                    // Store map marker ID in an easy to get way for focus event
                    $('.mapmarker-' + marker._leaflet_id +'[type=text]')
                        .data('markerId', marker._leaflet_id)
                })

                map.markerLayer.on('layeradd', inputHandler)
                map.markerLayer.on('layerremove', inputHandler)

            }, 1000)
        })
    }
    else {
        map.markerLayer.on('layeradd', inputHandler)
        map.markerLayer.on('layerremove', inputHandler)
    }

    map.on('contextmenu', openMarkerMenu)
    map.on('zoomend', updateZoom)
    map.on('moveend', updateCenter)

    document.getElementById('map').addEventListener('click', mapClickHandler, true)
    $('#landmarkList').on('focus blur', 'input', landmarkLabelToggle)
    //window.map = map
})
