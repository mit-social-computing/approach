<div class="mapmarker-map" id="mapmarkerMap">
    <div class="landmark-picker" id="map"></div>
    <fieldset class="landmark-list" id="landmarkList">
        <?php foreach ($landmarks as $l): ?>
            <input  type="text" 
                    placeholder="Enter a label for this landmark"
                    class="mapmarker-<?=$l['landmark_id']?>" 
                    value="<?=$l['label']?>"
                    name="mapmarker[landmarks][<?=$l['landmark_id']?>][label]">

            <input  type="hidden" 
                    id="mapmarker-<?=$l['landmark_id']?>-latlng"
                    class="mapmarker-<?=$l['landmark_id']?>" 
                    value="<?=$l['lat']?>, <?=$l['long']?>"
                    name="mapmarker[landmarks][<?=$l['landmark_id']?>][latlng]">

            <input  type="hidden" 
                    class="mapmarker-<?=$l['landmark_id']?>" 
                    value="<?=$l['type']?>"
                    name="mapmarker[landmarks][<?=$l['landmark_id']?>][type]">
        <?php endforeach ?>
    </fieldset>
    <input  type="hidden" 
            id="mapmarkerZoom"
            name="mapmarker[zoom]"
            value="<?=$map_zoom ? $map_zoom : 10?>">

    <input  type="hidden" 
            id="mapmarkerCenter"
            name="mapmarker[center]"
            value="<?=$map_center_lat?>,<?=$map_center_long?>">
</div>
<!-- .wildflower-map -->

<script>
    var mapmarker = {};
    mapmarker.landmarks = <?=json_encode($landmarks)?>;
    mapmarker.zoom = <?=$map_zoom?>;
    mapmarker.mapCenter = [<?=$map_center_lat?>, <?=$map_center_long?>]
</script>
