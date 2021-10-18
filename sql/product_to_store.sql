SELECT * FROM oc_product_to_store;

TRUNCATE TABLE oc_product_to_store;
insert into oc_product_to_store(product_id,store_id)
select product_id,0 from oc_product as p where
not exists (select null from oc_product_to_store where product_id=p.product_id);

SELECT * FROM oc_product_to_store;
