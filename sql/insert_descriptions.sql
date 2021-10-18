--Assume that one of the oc_product table columns contains the temp product name, I have choosen the 'location' column in this sample.
insert into oc_product_description (product_id,language_id,name)
select product_id, 1, location from oc_product p where location != ''
and not exists(select null from oc_product_description where product_id=p.product_id);

update oc_product
set image=CONCAT('catalog/products/', slugify(location),'.jpg'),
status=1,
quantity=10,
date_added=now(),
tax_class_id=10,
points=0,
stock_status_id=9,
weight_class_id=1,
length_class_id=1,
date_available=DATE_ADD(now(), INTERVAL -1 DAY)

update oc_product set location=''

update oc_product
set status=0 where price=0 and status=1;