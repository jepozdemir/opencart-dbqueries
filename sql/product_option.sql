SELECT * FROM oc_product_option;

insert into oc_product_option (product_id,option_id,required)
select p.product_id,#option_id,1 from oc_product  as p where not exists (select null from oc_product_option as op where op.product_id=p.product_id && op.option_id=#option_id);