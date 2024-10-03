use pizza_project;

select * from pizza_sales;

select sum(total_price) as Total_amount from pizza_sales;

select sum(total_price)/count(distinct order_id) as avg_order_value from pizza_sales;

select sum(quantity) as total_pizza_sold from pizza_sales;

select count(distinct order_id) as total_no_of_order from pizza_sales;

select (sum(quantity)/count(distinct order_id)) as avg_no_of_pizza_per_order from pizza_sales;

alter table pizza_sales
add column new_order_date DATE;

update pizza_sales
set new_order_date=str_to_date(order_date, '%d-%m-%Y');

alter table pizza_sales
drop column order_date;

alter table pizza_sales
rename column new_order_date to order_date;

select dayname(order_date) as daywise, count(distinct order_id) as order_count
from pizza_sales
group by daywise
order by order_count desc;

select monthname(order_date) as monthwise, count(distinct order_id) as order_count
from pizza_sales
group by monthwise
order by order_count desc;

select pizza_category, count(pizza_category) as total_pizza_sold
from pizza_sales
group by pizza_category;

select pizza_category, sum(total_price)*100/(select sum(total_price) from pizza_sales) as per_sales, sum(total_price) as Total_sales
from pizza_sales
group by pizza_category;

select pizza_size, sum(total_price)*100/(select sum(total_price) from pizza_sales) as per_sales, sum(total_price) as Total_sales
from pizza_sales
group by pizza_size;

select pizza_name, CAST(sum(total_price) as decimal(10,2)) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue desc
limit 5;

select pizza_name, CAST(sum(total_price) as decimal(10,2)) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue asc
limit 5;

select pizza_name, CAST(sum(quantity) as decimal(10,2)) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity desc
limit 5;

select pizza_name, CAST(sum(quantity) as decimal(10,2)) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity asc
limit 5;

select pizza_name, CAST(count(distinct order_id) as decimal(10,2)) as total_order
from pizza_sales
group by pizza_name
order by total_order desc
limit 5;

select pizza_name, CAST(count(distinct order_id) as decimal(10,2)) as total_order
from pizza_sales
group by pizza_name
order by total_order asc
limit 5;

