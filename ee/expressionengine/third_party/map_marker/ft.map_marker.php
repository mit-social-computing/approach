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
    'map_center_lat' => 0,
    'map_center_long' => 0,
    'map_zoom' => 10,
    'landmarks' => array());
	
	// --------------------------------------------------------------------
	
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
   function save($data)
   {
      $to_save = array('map' => array(), 'landmarks' => array());
      foreach($this->defaults as $key => $val)
      {
          $to_save['map'][] = ee()->input->post($key.'_field_id'.$this->field_id);
      }
      
      return serialize($to_save);
      
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
