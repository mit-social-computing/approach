<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Map Marker fieldtype
 *
 * @package     Map Marker
 * @author			Brian Whitton
 * @link			http://brianwhitton.com
 */

require_once PATH_THIRD . 'map_marker/config.php';

class Map_marker_ft extends EE_Fieldtype
{
	var $info = array(
		'name'		=> MAPMARKER_MAP_NAME,
		'version'	=> MAPMARKER_VERSION
	);

  var $defaults = array(
    'landmark_label' => '',
    'map_center_lat' => 0,
    'map_center_long' => 0,
    'map_zoom' => 2,
    'landmarks' => array());
	
	// --------------------------------------------------------------------
  
  function install()
  {
    return $this->defaults;
  }
	
	/**
	 * Display Field on Publish
     * Used to render the publish field.
     *
	 * @access	public
	 * @param	$data (array) – Current field data, blank for new entries
	 * @return	$field (string) - The field to display on the publish page
	 *
	 */
	public function display_field($data = array())
	{
        if ( ! empty($data))
        {
            $unseralized = unserialize($data);
        }
        else 
        {
          foreach($this->defaults as $key => $val)
          {
            $data[$key] = $val;
          }
        }
        // loading map dependencies in the tab file messes up other third-party
        // scripts. so we're loading any fieldtype dependencies here.
        $this->map_dependencies();
        return ee()->load->view('map_field', $data, TRUE);
	}
  
  
	/**
	 * Prep data for saving
	 *
	 * @access	public
	 * @param	submitted field data
	 * @return	string to save
	 */
   function save()
   {
      $data = ee()->input->post('mapmarker');
      $to_save = array('landmarks' => array());
      if ( isset($data['landmarks']) )
      {
        foreach($data['landmarks'] as $id => $landmark)
        {
          list($lat, $lng) = explode(',', $landmark['latlng']);
          $to_save['landmarks'][] = array(
            'landmark_id' => $id,
            'label' => $landmark['label'],
            'lat' => trim($lat),
            'long' => trim($lng)
          );
        }
      }

      $to_save['map_zoom'] = $data['zoom'];
      list($lat, $long) = explode(',', $data['center']);
      $to_save['map_center_lat'] = $lat;
      $to_save['map_center_long'] = $long;
      
      return base64_encode(serialize($to_save));
      
   }
   
   function display_settings($data)
   {
     $label = isset($data['landmark_label']) ? $data['landmark_label'] : $this->settings['landmark_label'];
     
     ee()->table->add_row(
       'Landmark Label',
       form_input('landmark_label', $label)
     );
   }
   
   function save_settings($data)
   {
     return array(
       'landmark_label' => ee()->input->post('landmark_label')
     );
   }
	
	// --------------------------------------------------------------------
		
    private function map_dependencies()
    {
        ee()->cp->add_to_head("<link href='https://api.tiles.mapbox.com/mapbox.js/v1.6.2/mapbox.css' rel='stylesheet' />");
        ee()->cp->add_to_head("<link href='".URL_THIRD_THEMES."/map_marker/css/landmark_picker.css' rel='stylesheet' />");

        ee()->cp->add_to_foot("<script src='https://api.tiles.mapbox.com/mapbox.js/v1.6.2/mapbox.js'></script>");
        ee()->cp->add_to_foot("<script src='".URL_THIRD_THEMES."/map_marker/js/landmark_picker.js'");
    }

	// --------------------------------------------------------------------
}
