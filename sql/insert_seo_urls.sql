delete from oc_seo_url where query like 'category_id=%';
INSERT INTO oc_seo_url
(store_id,
language_id,
query,
keyword)
select 0,1,CONCAT('category_id=',category_id),slugify(name) from oc_category_description;

delete from oc_seo_url where query like 'product_id=%';
INSERT INTO oc_seo_url
(store_id,
language_id,
query,
keyword)
select 0,1,CONCAT('product_id=',product_id),slugify(name) from oc_product_description;

