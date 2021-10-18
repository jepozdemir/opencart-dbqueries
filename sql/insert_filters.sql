SELECT * FROM oc_filter_group;
SELECT * FROM oc_filter_group_description;

/*INSERT INTO oc_filter_group (filter_group_id,sort_order) values(1,2);
INSERT INTO oc_filter_group_description
(filter_group_id,language_id,name) values(1,1,'Group 1');
INSERT INTO oc_filter_group (filter_group_id,sort_order) values(2,1);
INSERT INTO oc_filter_group_description
(filter_group_id,language_id,name) values(2,1,'Group 2');*/

/*TRUNCATE TABLE  `oc_filter`;
TRUNCATE TABLE `oc_filter_description`;*/

insert into oc_filter(filter_id,filter_group_id,sort_order)
SELECT OV.option_value_id,2,OV.sort_order FROM oc_option_value_description OVD
INNER JOIN oc_option_value AS OV ON OVD.option_value_id=OV.option_value_id
WHERE OV.option_id=5 AND not exists(select null from oc_filter_description fd where fd.filter_group_id=2 and fd.filter_id=OV.option_value_id);

insert into oc_filter_description(filter_id,language_id,filter_group_id,name)
SELECT OV.option_value_id,OVD.language_id,2,OVD.name FROM oc_option_value_description OVD
INNER JOIN oc_option_value AS OV ON OVD.option_value_id=OV.option_value_id
WHERE OV.option_id=5 AND not exists(select null from oc_filter_description fd where fd.filter_group_id=2 and fd.filter_id=OV.option_value_id);

insert into oc_filter(filter_id,filter_group_id,sort_order)
SELECT OV.option_value_id,1,OV.sort_order FROM oc_option_value_description OVD
INNER JOIN oc_option_value AS OV ON OVD.option_value_id=OV.option_value_id
WHERE OV.option_id=11 AND not exists(select null from oc_filter_description fd where fd.filter_group_id=1 and fd.filter_id=OV.option_value_id);

insert into oc_filter_description(filter_id,language_id,filter_group_id,name)
SELECT OV.option_value_id,OVD.language_id,1,OVD.name FROM oc_option_value_description OVD
INNER JOIN oc_option_value AS OV ON OVD.option_value_id=OV.option_value_id
WHERE OV.option_id=11 AND not exists(select null from oc_filter_description fd where fd.filter_group_id=1 and fd.filter_id=OV.option_value_id);
