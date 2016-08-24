<?php

$smarty->config_load($conf_file, 'objects');

$type = $podrazdel;

if(!$data = load_cache(4, intval($type)))
{
	unset($data);

	// Подключаемся к ДБ:
	global $DB;
	global $AoWoWconf;

	// Получаем данные по этому типу объектов
$rows = $DB->select('
    SELECT g.* {, a.requiredskill1 as ?#} {, a.requiredskill2 as ?#}
    FROM gameobject_template g {, gameobject_questrelation ?#} {, aowow_lock ?#} 
    WHERE 
        1 = 1 
        { AND g.type = ? } 
        { AND g.data0=a.lockID AND g.type=3 AND a.type1=2 AND 1=?} 
        { AND g.data0=a.lockID AND g.type=3 AND a.type2=2 AND 1=?} 
        { AND a.lockproperties1=2 AND 1=?}
        { AND a.lockproperties1=3 AND 1=?}
        { AND a.lockproperties2=1 AND 1=?}
        { AND g.entry = q.?#}
		LIMIT 400
    ',
    (($type==-3) or ($type==-4))? 'skill': DBSIMPLE_SKIP,
    ($type==-5)? 'skill': DBSIMPLE_SKIP,
    ($type==-2)? 'q': DBSIMPLE_SKIP,
    (($type==-3) or ($type==-4) or ($type==-5))? 'a': DBSIMPLE_SKIP,
    ($type>0)? $type : DBSIMPLE_SKIP,
    (($type==-3) or ($type==-4))? 1: DBSIMPLE_SKIP,
    ($type==-5)? 1: DBSIMPLE_SKIP,
    ($type==-3)? 1: DBSIMPLE_SKIP,
    ($type==-4)? 1: DBSIMPLE_SKIP,
    ($type==-5)? 1: DBSIMPLE_SKIP,
    ($type==-2)? 'id': DBSIMPLE_SKIP
);


	$i = 0;
	$data = array();
	foreach ($rows as $numRow=>$row)
	{
		$data[$i] = array();
		$data[$i]['entry'] = $row['entry'];
		if (IsSet($row['skill']))
			$data[$i]['skill'] = $row['skill'];
		$data[$i]['name'] = $row['name_loc']?$row['name_loc']:$row['name'];
		// TODO: Расположение
		$data[$i]['location'] = "[-1]";
		// Тип объекта
		$data[$i]['type'] = (isset($type))? $type : $row['type'];
		$i++;
	}
	save_cache(4, intval($type), $data);
}
global $page;
$page = array(
	'Mapper' => false,
	'Book' => false,
	'Title' => $smarty->get_config_vars('Objects'),
	'tab' => 0,
	'type' => 0,
	'typeid' => 0,
	'path' => '[0, 5,'.$podrazdel.']'
);
$smarty->assign('page', $page);

// Передаем массив данных шаблонизатору
$smarty->assign('data', $data);
// Статистика выполнения mysql запросов
$smarty->assign('mysql', $DB->getStatistics());

$smarty->display('objects.tpl');

?>
