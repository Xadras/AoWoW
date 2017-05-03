<?php

// ?????????? ??????? iteminfo
require_once('includes/allitems.php');
require_once('includes/allreputation.php');

$smarty->config_load($conf_file, 'items');

// ????????? ?? ??????? ????? ? ???????? ?????
point_delim($podrazdel,$class,$subclass);

global $DB;

$cache_str = (empty($class)?'x':intval($class)).'_'.(empty($subclass)?'x':intval($subclass));

if(!$items = load_cache(7, $cache_str))
{
	unset($items);

// ???????;
   $slots = null;
   if(isset($_REQUEST['sl'])){
       if(is_array($_REQUEST['sl'])){
           $sl = $_REQUEST['sl'];
           foreach($sl as $k=>$v){
               if(is_numeric($v)){
                   $slots[] = $v;
               }
           }
       }
   }
   if(!is_array($slots)){
       if(isset($type)){
           $slots[] = $type;
       }else{
           for($i=0;$i<=28;$i++){
              $slots[] = $i; 
           }
       }
   }
   
   // ???
   $quality = null;
   if(isset($_REQUEST['qu'])){
       
       if(is_array($_REQUEST['qu'])){
           $qu = $_REQUEST['qu'];
           foreach($qu as $q=>$u){
               if(is_numeric($u)){
                   $quality[] = $u;
               }
           }
       }
   }
   
   if(!is_array($quality)){
           for($i=0;$i<=7;$i++){
              $quality[] = $i; 
           }
   }
   $ad = "DESC";
     if(isset($_REQUEST['gb']) && is_numeric($_REQUEST['gb'])){
         
         if($_REQUEST['gb']==1){
             $gb = 'InventoryType';
         }elseif($_REQUEST['gb']==2){
             $gb = 'RequiredLevel';
         }elseif($_REQUEST['gb']==2){
             $gb = 'name';
             $ad = "ASC";
         }else{
             $gb = 'quality';
         }
     }else{
          $gb = 'quality';
     }

	// ?????????? ?????? ? ??, ??????????? ????? ?? ???????? ?????? ? ?????????
	$rows = $DB->select('
		SELECT ?#, i.entry, maxcount
			{, l.name_loc?d AS `name_loc`}
		FROM ?_icons, item_template i
			{LEFT JOIN (locales_item l) ON l.entry=i.entry AND ?d}
		WHERE
			id=displayid
			{ AND class=? }
			{ AND subclass=? }
            { AND i.ItemLevel >= ? }
            { AND i.ItemLevel <= ? }
            { AND i.RequiredLevel >= ?}
            { AND i.RequiredLevel <= ?}
            { AND i.name LIKE ? }
            { AND i.InventoryType IN (?a) }
            { AND i.Quality IN ( ?a ) }
            
		ORDER BY quality DESC, name
		',
		$item_cols[2],
		($_SESSION['locale'])? $_SESSION['locale']: DBSIMPLE_SKIP,
		($_SESSION['locale'])? 1: DBSIMPLE_SKIP,
		($class!='')? $class: DBSIMPLE_SKIP,
		($subclass!='')? $subclass: DBSIMPLE_SKIP,
        // search
        isset($_REQUEST['minle']) && is_numeric($_REQUEST['minle']) ? $_REQUEST['minle'] : "0",   // min item level
        isset($_REQUEST['maxle']) && is_numeric($_REQUEST['maxle']) ? $_REQUEST['maxle'] : "120", // max item level
        
        isset($_REQUEST['minrl']) && is_numeric($_REQUEST['minrl']) ? $_REQUEST['minrl'] : "0",   // min reuqest level
        isset($_REQUEST['maxrl']) && is_numeric($_REQUEST['maxrl']) ? $_REQUEST['maxrl'] : "70",  // max request level
        isset($_REQUEST['na']) ? "%". strip_tags(str_replace(array('[',']'),array('',''),urldecode($_REQUEST['na']))). "%" : "%%", // search by name
        
        $slots,
        $quality,
        $gb
	);

	$i=0;
	$items = array();
	foreach ($rows as $numRow=>$row)
	{
		$items[$i] = array();
		$items[$i] = iteminfo2($row);
		$i++;
	}

	save_cache(7, $cache_str, $items);
}

global $page;
$page = array(
	'Mapper' => false,
	'Book' => false,
	'Title' => $smarty->get_config_vars('Items'),
	'tab' => 0,
	'type' => 0,
	'typeid' => 0,
	'path' => "[0, 0, ".$class.", ".$subclass."]",
);
$smarty->assign('page', $page);

// ?????????? ?????????? mysql ????????
$smarty->assign('mysql', $DB->getStatistics());
// ???? ???? ???? ?????????? ? ???? ??????? - ???????? ?????? ? ??????????? ? ????? ?????????????
if (count($allitems)>=0)
	$smarty->assign('allitems',$allitems);
if (count($items>=0))
	$smarty->assign('items', $items);
// ????????? ????????
$smarty->display('items.tpl');
?>