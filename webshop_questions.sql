select customer.name as 'Customer who bought black pants from SweetPants in size EU38'
from customer
inner join orders on orders.customer_id = customer.id
inner join product_orders on product_orders.orders_id = orders.id
inner join product on product.id = product_orders.product_id
inner join product_category on product_category.product_id = product.id
inner join category on category.id = product_category.category_id
inner join brand on brand.id = product.brand_id
inner join color on color.id = product.color_id
inner join size on size.id = product.size_id
where color.name = 'black' and size.name = 'EU38' and brand.name like 'SweetPants' and category.name = 'pants'
group by customer.id; -- För att inte visa dubletter av kunder som beställt fler än en, men tillåta kunder med samma namn


select category.name as 'Category', sum(product.quantity_in_stock) as 'Amount in stock'
from product
inner join product_category on product_category.product_id = product.id
inner join category on category.id = product_category.category_id
group by category.name;


select customer.name as 'Customer name', sum(product.price * product_orders.product_quantity) as 'Sum of all orders'
from customer
inner join orders on orders.customer_id = customer.id
inner join product_orders on product_orders.orders_id = orders.id
inner join product on product.id = product_orders.product_id
group by customer.id;


select customer.county as 'County', sum(product.price * product_orders.product_quantity) as 'Total amount'
from customer
inner join orders on orders.customer_id = customer.id
inner join product_orders on product_orders.orders_id = orders.id
inner join product on product.id = product_orders.product_id
group by customer.county
having sum(product.price) > 1000
order by sum(product.price) desc;


select category.name as 'Category', color.name 'Color', brand.name 'Brand', sum(product_orders.product_quantity) 'Amount sold'
from product_orders
inner join product on product.id = product_orders.product_id
inner join product_category on product_category.product_id = product.id
inner join category on category.id = product_category.category_id 
inner join color on color.id = product.color_id
inner join brand on brand.id = product.brand_id
group by category.name, color.name, brand.name
order by sum(product_orders.product_quantity) desc
limit 5;
