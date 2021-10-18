INSERT INTO oc_product_related
(product_id,
related_id)
select p.product_id,p2.product_id from oc_product as p
inner join oc_product_to_category pc1 on pc1.product_id=p.product_id
inner join oc_product_to_category pc2 on pc2.category_id = pc1.category_id
inner join oc_product p2 on pc2.product_id = p2.product_id and p2.product_id != p.product_id
where not exists (select null from oc_product_related where product_id=p.product_id and related_id=p2.product_id) limit 10000