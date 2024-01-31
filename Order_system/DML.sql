select customer_name from customer
where customer_name like 'Ma%';

select `order`.order_id, count(item.item_id) as count_of_items ,sum(order_item.quantity * item.unit_price) as total_price 
from `order`
inner join order_item
on `order`.order_id = order_item.order_id
inner join item 
on order_item.item_id = item.item_id
group by `order`.order_id;

select shipment.order_id,shipment.ship_date 
from shipment
join `order`
on shipment.order_id = `order`.order_id
join warehouse 
on warehouse.warehouse_id = shipment.warehouse_id
where warehouse.warehouse_city = 'Arica' and shipment.ship_date <=NOW();


select sum(order_item.quantity * item.unit_price) as total_price 
FROM item
join order_item 
on order_item.item_id = item.item_id
inner join `order`
on `order`.order_id = order_item.order_id
inner join shipment
on shipment.order_id = `order`.order_id
join warehouse 
on warehouse.warehouse_id = shipment.warehouse_id
where warehouse.warehouse_id = '8' and shipment.ship_date <=NOW()