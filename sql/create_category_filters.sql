TRUNCATE TABLE  oc_filter;
INSERT INTO oc_filter
(filter_id,
filter_group_id,
sort_order)
SELECT option_value_id,#filtergroup1, (@row_number:=@row_number + 1) AS sort_order
    FROM oc_option_value_description ,
    (SELECT @row_number:=0) AS t
    WHERE option_id=#option1
    ORDER BY 
    option_value_id  
	LIMIT 100;
    
INSERT INTO oc_filter
(filter_id,
filter_group_id,
sort_order)
SELECT option_value_id,#filtergroup2, (@row_number:=@row_number + 1) AS sort_order
    FROM oc_option_value_description ,
    (SELECT @row_number:=0) AS t
    WHERE option_id=#option2
    ORDER BY 
    option_value_id  
	LIMIT 100;

TRUNCATE TABLE oc_filter_description;
INSERT INTO oc_filter_description
(filter_id,
language_id,
filter_group_id,
name)
SELECT f.filter_id,1,f.filter_group_id,ovd.name
    FROM oc_option_value_description  ovd
    INNER JOIN oc_filter AS f ON f.filter_id = ovd.option_value_id;
    
TRUNCATE TABLE oc_category_filter;
INSERT INTO oc_category_filter
(category_id,
filter_id)
select distinct c.category_id,pov.option_value_id from oc_product_to_category pc
inner join oc_category as c on c.category_id = pc.category_id
inner join oc_product as p on p.product_id=pc.product_id
inner join oc_product_option_value as pov on pov.product_id=p.product_id
where p.status=1 and c.status=1