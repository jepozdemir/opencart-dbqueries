update oc_product p
inner join (select product_id, (@row_number:=@row_number + 1) AS sort_order from oc_product, (SELECT @row_number:=0) AS t  order by model as ptemp
on p.product_id=ptemp.product_id
set p.sort_order=ptemp.sort_order;

--check
select product_id,model, sort_order, (@row_number:=@row_number + 1) AS sort_order from oc_product, (SELECT @row_number:=0) AS t order by model