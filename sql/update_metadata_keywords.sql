
UPDATE oc_product_description as pd
inner join oc_product_to_category as pc on pd.product_id=pc.product_id
inner join oc_category_description as cd on cd.category_id=pc.category_id
inner join oc_product as p on p.product_id=pc.product_id
SET pd.meta_title=pd.name, 
pd.meta_keyword=CONCAT(LOWER(pd.name),',',LOWER(cd.name),',',p.model,',other common product keywords');

UPDATE oc_category_description as cd
SET cd.meta_title=cd.name, 
cd.meta_keyword=CONCAT(LOWER(cd.name),',other common category keywords')
