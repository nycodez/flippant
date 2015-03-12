<?php
if(isset($page[1]))
{
	if($page[1]=='view')
	{
		View($page[0], $page[2]);
	}
	elseif($page[1]=='new')
	{
		Add($page[0], $page[2]);
	}
	elseif($page[1]=='settings')
	{
		Settings($page[0]);
	}
}
else
{
	Splash($page[0]);
}

function Settings($module)
{
	global $conn;
	global $moduleOptions;

	$class = new $moduleOptions[$module]['class']($conn);
	$customFields = $class->GetAllCustomFields($moduleOptions[$module]['table']);

	foreach($customFields as $subgroup => $v)
	{
		echo '<h3>'. $subgroup .'</h3>';

		foreach($v as $kk => $vv)
		{
			echo 'ID <input type=text value="'. $vv['key'] .'" /><br />';
			echo 'Name <input type=text value="'. $vv['name'] .'" /><br />';
			echo 'Label <input type=text value="'. $vv['label'] .'" /><br />';
			echo 'Type <select>
				<option></option>
				<option>Checkbox</option>
				<option>Radio</option>
				<option>Select</option>
				<option>Text</option>
				<option>Textarea</option>
				</select><br />';
			echo 'Options <input type=text value="'. $vv['options'] .'" /><br />';
			echo 'Maxlength <input type=text value="'. $vv['maxlength'] .'" /><br />';
			echo 'Placeholder <input type=text value="'. $vv['placeholder'] .'" /><br />';
			echo 'Default <input type=text value="'. $vv['default'] .'" /><br />';
			echo 'Required <input type=checkbox value="'. $vv['required'] .'" /><br />';
			echo '<br />';
		}
		echo '<hr />';
	}
}

function View($module, $id)
{
	global $conn;
	global $moduleOptions;

	echo '<h1>View '. $moduleOptions[$module]['singular'] .'</h1>';
?>

<select class=basicDropdown>
 <option>Actions</option>
 <option>Recalculate Balances</option>
 <option>Run Collections Report</option>
 <option>Send an Email</option>
 <option>Mark Inactive</option>
</select>

<?php
	$class = new $moduleOptions[$module]['class']($conn);
	$info = $class->GetInfo($id);
	echo '<div class=basicInfoTable>';
	foreach($info['custom'] as $k => $v)
	{
		echo '<div>'. showElement($v) .'</div>';
	}
	echo '</div>';
}

function Add($module, $type)
{
	global $conn;
	global $moduleOptions;

	echo '<h1>New '. $moduleOptions[$module]['singular'] .'</h1>';
?>

<?php
	$class = new $moduleOptions[$module]['class']($conn);
	$customFields = $class->GetCustomFields($moduleOptions[$module]['table'], $type);
	echo '<div class=basicInfoTable>';
	foreach($customFields as $k => $v)
	{
		echo '<div>'. showElement($v) .'</div>';
	}
	echo '</div>';
}

function Splash($module)
{
	global $conn;
	global $moduleOptions;

	echo '<h1>'. $moduleOptions[$module]['plural'] .'</h1>';
?>

<select class=basicDropdown>
 <option>Actions</option>
<?php
foreach($moduleOptions[$module]['reports'] as $k => $v)
{
	echo '<option value="/'. $module .'/reports/'. $k .'">'. $v .'</option>';
}
?>
</select>

<select class=basicDropdown>
 <option>Filter</option>
 <option selected>All Active</option>
<?php
foreach($moduleOptions[$module]['types'] as $k => $v)
{
	echo '<option value="/'. $module .'/filter/'. $k .'">'. $v .'s</option>';
}
?>
 <option>Inactive</option>
</select>

<select class=specialDropdown onChange="top.location.href=this.options[this.selectedIndex].value;" >
 <option></option>

<?php
foreach($moduleOptions[$module]['types'] as $k => $v)
{
	echo '<option value="/'. $module .'/new/'. $k .'">New '. $v .'</option>';
}
?>
 <option value="/<?php echo $module; ?>/export/">Export Current View</option>
 <option value="/<?php echo $module; ?>/settings/">Settings</option>
</select>

<table class=basicListTable>
 <thead>
  <tr>
   <th><input type=checkbox onclick="toggle(this.parent);" /></th>
   <th>Name</th>
   <th>Company</th>
   <th>Type</th>
   <th>Owes</th>
   <th>Credits</th>
  </tr>
 </thead>
 <tbody>
<?php
	$class = new $moduleOptions[$module]['class']($conn);
	$catalog = $class->GetCatalog();
	foreach($catalog  as $k => $v)
	{
	echo "
	  <tr>
	   <td><input type=checkbox '></td>
	   <td><a href='/$module/view/{$v['id']}'>{$v['name']}</a></td>
	   <td>{$v['companyName']}</td>
	   <td>{$v['type']}</td>
	   <td>{$v['unpaid']}</td>
	   <td>{$v['credit']}</td>
	  </tr>
	";
	}
?>
 </tbody>
</table>
<?php
}
