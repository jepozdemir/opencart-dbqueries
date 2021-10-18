TRUNCATE TABLE oc_category_filter;

INSERT INTO oc_category_filter
(category_id,
filter_id)
select distinct c.category_id,f.filter_id from oc_category as c
inner join oc_product_to_category as pc on pc.category_id=c.category_id
inner join oc_product as p on p.product_id=pc.product_id
inner join oc_product_option_value as pov on pov.product_id=p.product_id
inner join oc_filter as f on f.filter_id=pov.option_value_id
where c.status=1 and not exists (select null from oc_category_filter where filter_id=f.filter_id and category_id=c.category_id)
