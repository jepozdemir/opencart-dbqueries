set @today = now();
INSERT INTO oc_product_special
(product_id,
customer_group_id,
priority,
price,
date_start,
date_end)
select product_id,
1,
1,
round(price * 0.7),
@today,
DATE_ADD(@today, INTERVAL 1 year) 
from oc_product where status=1 and quantity>0
