<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

include PATH_THIRD . 'mailchimp/lib/src/MailChimp.php';
use \DrewM\MailChimp\MailChimp;

class Mailchimp_ext {

    var $name           = 'Mailchimp Extension';
    var $version        = '1.0';
    var $description    = 'Perform various mailchimp tasks';
    var $settings_exist = 'y';
    var $docs_url       = ''; 

    var $settings = array();

    function __construct($settings='')
    {
        $this->settings = $settings;
        $this->mc = new MailChimp(ee()->config->item('mcp_api'));
    }

    function activate_extension() 
    {

        $data = array(
            'class'     => __CLASS__,
            'method'    => 'subscribe',
            'hook'      => 'freeform_module_insert_end',
            'settings'  => serialize($this->settings),
            'priority'  => 10,
            'version'   => $this->version,
            'enabled'   => 'y'
        );

        ee()->db->insert('extensions', $data);
    }

    function update_extension($current = '')
    {
        if ($current == '' OR $current == $this->version)
        {
            return FALSE;
        }

        if ($current < '1.0')
        {
            // Update to version 1.0
        }

        ee()->db->where('class', __CLASS__);
        ee()->db->update(
                    'extensions',
                    array('version' => $this->version)
        );
    }

    function disable_extension()
    {
        ee()->db->where('class', __CLASS__);
        ee()->db->delete('extensions');
    }

    function subscribe($field_input_data, $entry_id, $form_id)
    {
        $list_id = ee()->config->item('wildflower_list');

        $data = array(
            'email_address'     => $field_input_data['email'],
            'status'            => 'subscribed',
            'merge_fields'      => array(
                'FNAME'     => $field_input_data['first_name'],
                'LNAME'     => $field_input_data['last_name'],
                'CITY'      => $field_input_data['city'],
                'CHILD_AGE' => $field_input_data['age']
            )
        );

        $email_hash = md5($data['email_address']);
        $status = $this->check_status($list_id, $email_hash);

        if ( $status['status'] == 404 )
        {
            // not subscribed
            $result = $this->mc->post("lists/$list_id/members/", $data);
        }
        else
        {
            // subscribed, let's update
            $result = $this->mc->patch("lists/$list_id/members/$email_hash", $data);
        }
        return;
    }

    function check_status($list_id, $email)
    {
        $result = $this->mc->get("/lists/$list_id/members/$email");
        return $result;
    }
}
