select warehouse.warehouse_id  ,warehouse.warehouse_city , count(shipment.order_id) as order_cnt
from warehouse
left join shipment 
on warehouse.warehouse_id = shipment.warehouse_id 
group by warehouse.warehouse_id  ,warehouse.warehouse_city
order by warehouse.warehouse_id;

select customer.customer_name , count(`order`.order_id) as order_cnt
from customer
left join `order` 
on customer.customer_id = `order`.customer_id 
group by  customer.customer_name
order by  customer.customer_name;

select item.item_id 
from item
where item.item_id not in(
select item_id 
from order_item);