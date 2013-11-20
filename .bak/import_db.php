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
  Title: import_db.php
  Purpose - Import database into an ExpressionEngine install
  Author - Doug Avery <doug.avery@viget.com>
*/

/* @group get DB info */

	define('BASEPATH', true);
	include '../ee/expressionengine/config/database.php';

/* @end */

/* @group drop, create, import DB */

	exec("mysql \
		--user={$db[$env]['username']} \
		--password={$db[$env]['password']} \
		-e 'drop database {$db[$env]['database']}'");

	exec("mysql \
		--user={$db[$env]['username']} \
		--password={$db[$env]['password']} \
		-e 'create database {$db[$env]['database']}'");
	
	exec("mysql \
		--user={$db[$env]['username']} \
		--password={$db[$env]['password']} \
		{$db[$env]['database']} < sql/db_dump.sql");

/* @end */

/* @group feeback */

	echo("Import database: {$db[$env]['database']}\n");

/* @end */

?>
