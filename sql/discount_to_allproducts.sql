set @today = now();
INSERT INTO oc_product_discount
(product_id,
customer_group_id,
quantity,
priority,
price,
date_start,
date_end)
select product_id,1,quantity,1,round((price-(price*0.3))),@today,DATE_ADD(@today, INTERVAL 1 month) from oc_product where status=1 and quantity>0
