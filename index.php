<?php
require_once 'includes/config.inc.php';
require_once 'includes/base.inc.php';
require_once 'includes/auth.inc.php';
require_once 'includes/form.inc.php';
require_once 'app/header.php';

echo '<div id=content>';

$page = explode('/', $_REQUEST['string']);

switch($page[0])
{
	case 'calendar';
	case 'contacts';
	case 'items';
	case 'records';
	require_once 'app/standard.php';
	break;
	case 'income';
	require_once 'app/income.php';
	break;
	case 'expense';
	require_once 'app/expense.php';
	break;
	case 'reports';
	require_once 'app/reports.php';
	break;
	case 'dashboard';
	default;
	require_once 'app/dashboard.php';
	break;
}

echo '</div>';
