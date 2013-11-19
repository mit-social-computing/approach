<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/*
 * Dynamic Configs
 --------------------------------------------------------------------------------*/

$s = 'BASE INSTALL';

$base_url = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') ? 'https' : 'http');
$base_url .= '://'.$_SERVER['HTTP_HOST'].'/';
$admin_url  = $base_url . 'admin.php';

$env = strpos($base_url, 'staging') ? 'staging' : 'production';
$env = strpos($base_url, 'dev') ? 'local' : $env;

$config['app_version'] = '272';
$config['install_lock'] = '';
$config['license_number'] = 'CORE';
$config['debug'] = '1';
$config['doc_url'] = 'http://ellislab.com/expressionengine/user-guide/';
$config['is_system_on'] = 'y';
$config['allow_extensions'] = 'y';
$config['cookie_prefix'] = '';
$config['save_tmpl_files'] = 'y';

$config['site_url'] = $base_url;
$config['cp_url'] = $admin_url;
$config['webroot'] = FCPATH;
$config['system_path'] = $config['webroot'] . '../ee';
$config['site_label'] = 'Base Install';

$config['theme_folder_url'] = $config['site_url'].'themes/';
$config['theme_folder_path'] = $config['webroot'].'themes/';

$config['tmpl_file_basepath'] = $config['webroot'].'assets/templates/';

$config['avatar_url'] = $base_url.'images/avatars/';
$config['avatar_path'] = $config['webroot'].'images/avatars/';
$config['photo_url'] = $base_url.'images/member_photos/';
$config['photo_path'] = $config['webroot'].'images/member_photos/';
$config['sig_img_url'] = $base_url.'images/signature_attachments/';
$config['sig_img_path'] = $config['webroot'].'images/signature_attachments/';
$config['prv_msg_upload_path'] = $config['webroot'].'images/pm_attachments/';

// END EE config items

/* 
 * CodeIgniter Configuration
 ------------------------------------------------------------------*/

$config['base_url'] = $config['site_url'];
$config['index_page'] = '';
$config['uri_protocol']	= 'AUTO';
$config['url_suffix'] = '';
$config['language']	= 'english';
$config['charset'] = 'UTF-8';
$config['enable_hooks'] = FALSE;
$config['subclass_prefix'] = 'EE_';
$config['permitted_uri_chars'] = 'a-z 0-9~%.:_\\-';
$config['enable_query_strings'] = FALSE;
$config['directory_trigger'] = 'D';
$config['controller_trigger'] = 'C';
$config['function_trigger'] = 'M';
$config['log_threshold'] = 0;
$config['log_path'] = '';
$config['log_date_format'] = 'Y-m-d H:i:s';
$config['cache_path'] = '';
$config['encryption_key'] = '';
$config['global_xss_filtering'] = FALSE;
$config['csrf_protection'] = FALSE;
$config['compress_output'] = FALSE;
$config['time_reference'] = 'local';
$config['rewrite_short_tags'] = TRUE;
$config['proxy_ips'] = '';

/* 
 * Universal database connection settings
 -------------------------------------------------------------------*/
$active_group = $env;
$active_record = TRUE;

$db['local']['hostname'] = 'LOCALHOST';
$db['local']['username'] = 'LOCALUSER';   
$db['local']['password'] = 'LOCALPASS'; 
$db['local']['database'] = 'LOCALDB';   
$db['staging']['hostname'] = 'STAGINGHOST';
$db['staging']['username'] = 'STAGINGUSER';   
$db['staging']['password'] = 'STAGINGPASS'; 
$db['staging']['database'] = 'STAGINGDB';   
$db['production']['hostname'] = 'PRODUCTIONHOST';
$db['production']['username'] = 'PRODUCTIONUSER';
$db['production']['password'] = 'PRODUCTIONPASS';
$db['production']['database'] = 'PRODUCTIONDB';

$db[$active_group]['dbdriver'] = 'mysql';
$db[$active_group]['pconnect'] = FALSE;
$db[$active_group]['dbprefix'] = 'exp_';
$db[$active_group]['swap_pre'] = 'exp_';
$db[$active_group]['db_debug'] = FALSE;
$db[$active_group]['cache_on'] = FALSE;
$db[$active_group]['autoinit'] = FALSE;
$db[$active_group]['char_set'] = 'utf8';
$db[$active_group]['dbcollat'] = 'utf8_general_ci';
$db[$active_group]['cachedir'] = $config['system_path'].'/expressionengine/cache/db_cache/';

/* End of file config.php */
/* Location: ./system/expressionengine/config/config.php */
