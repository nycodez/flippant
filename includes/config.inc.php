<?php
date_default_timezone_set('America/New_York');
$base = dirname(dirname(__FILE__));
$defaultDateFormat = 'm/d/Y g:ia';
$dbhost = 'localhost';
$dbuser = 'w3b4pp';
$dbpass = 'w4b4ppP4$$';
$dbname = 'webapp';

$moduleOptions = array
(
 'contacts' => array
 (
  'singular' => 'Contact',
  'plural' => 'Contacts',
  'class' => 'Contacts',
  'table' => 'entity',
  'types' => array
  (
   'contact' => 'Contact',
   'employee' => 'Employee',
   'group' => 'Group',
   'user' => 'User',
   'vendor' => 'Vendor',
  ),
  'reports' => array
  (
   'recalculateBalances' => 'Recalculate Balances',
   'runCollectionsReport' => 'Run Collections Report',
   'sendAnEmail' => 'Send an Email',
   'markInactive' => 'Mark as Inactive',
  ),
 ),
 'calendar' => array
 (
  'singular' => 'Event',
  'plural' => 'Events',
  'class' => 'Calendar',
  'table' => 'record',
  'types' => array
  (
   'call' => 'Call',
   'conference' => 'Conference',
   'meeting' => 'Meeting',
   'lunch' => 'Lunch',
   'dinner' => 'Dinner',
  ),
  'reports' => array
  (
   'sendReminderEmail' => 'Send Reminder Email',
   'markInactive' => 'Mark as Inactive',
   'duplicate' => 'Duplicate',
  ),
 ),
 'records' => array
 (
  'singular' => 'Record',
  'plural' => 'Records',
  'class' => 'Records',
  'table' => 'record',
  'types' => array
  (
   'call' => 'Call',
   'document' => 'Document',
   'event' => 'Event',
  ),
  'reports' => array
  (
   'reassign' => 'Reassign',
   'markInactive' => 'Mark as Inactive',
   'duplicate' => 'Duplicate',
  ),
 ),
 );

