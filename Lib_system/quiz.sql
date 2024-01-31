select customer.customer_name , sum(order_item.quantity*item.unit_price) as spent_money
from customer
left  join `order` 
on customer.customer_id = `order`.order_id
left join order_item
on order_item.order_id = `order`.order_id
left join item 
on item.item_id = order_item.item_id
group by customer_name;


