<?php
if (strpos($_SERVER['PHP_SELF'], '/')) exit('Script must be run from .bak directory');
if ( !isset($_SERVER['argv'][1]) ) exit("Must specify an environment.\nOne of \"d s p\".");

switch($_SERVER['argv'][1]) {
    case 'd':
        $env = 'dev';
        break;
    case 's':
        $env = 'staging';
        break;
    case 'p':
        $env = 'production';
        break;
    default:
        exit("Must specify an environment.\nOne of \"d s p\".");
        break;
}

/* 
  Title: export_db.php
  Purpose - Export database from an ExpressionEngine install
  Author - Doug Avery <doug.avery@viget.com>
*/

/* @group get DB info */

	define('BASEPATH', true);
	include '../ee/expressionengine/config/database.php';

/* @end */

/* @group export DB */

	exec("mysqldump \
		--opt \
		--user={$db[$env]['username']} \
		--password={$db[$env]['password']} \
		{$db[$env]['database']} > sql/db_dump.sql");

/* @end */

/* @group feedback */

	echo("Export database: {$db[$env]['database']}\n");

/* @end */

?>
