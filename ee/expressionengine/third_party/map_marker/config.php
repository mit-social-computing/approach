<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if ( ! defined('MAPMARKER_VERSION')) define('MAPMARKER_VERSION', '0.1.0');
if ( ! defined('MAPMARKER_DESCRIPTION')) define('MAPMARKER_DESCRIPTION',  'Map Marker CMS Extensions');
if ( ! defined('MAPMARKER_NAME')) define('MAPMARKER_NAME', 'Map Marker');
if ( ! defined('MAPMARKER_MAP_NAME')) define('MAPMARKER_MAP_NAME', 'Map Marker Map');

function bw_dump($var) {
    echo '<pre>';
    print_r($var);
    exit;
}
