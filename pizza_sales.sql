
-- 1 Total Revenue : the sum of the total price of all pizza orders
select sum(total_price) Total_Revenue from sales;


-- 2 Average Order Value: the average amount spent per order, calculation by dividing the total revenue by the total number of orders.
select sum(total_price)/count(distinct order_id) as Avg_Order_Value from sales;


-- 3 Total Pizzas Sold: the sum of the quantities of all pizzas sold
select sum(quantity) as Total_Pizza_Sold from sales;


-- 4 Total Orders: the total numbers of orders placed.
select count(distinct order_id) as Total_Orders from sales;


-- 5 Average Pizzas Per Order: the average number of pizzas sold per order,calculated by dividing the total number of pizzas sold by the total number of orders.

select round(sum(quantity) / count(distinct order_id),2) as Avg_Pizzas_Per_Order from sales;

-- insides and understand key trends:

-- Daily Trend For Total Orders:
select date_format(order_date,"%W") as order_day,count(distinct order_id) as Total_orders from sales group by order_day;

 
-- Monthly Trend For Total Orders:
select date_format(order_date,"%M") as Month_Name,count(distinct order_id) as Total_orders from sales 
group by Month_Name order by Total_orders desc;
 
 
-- Percentage Of Sales by pizza category:
select pizza_category,sum(total_price)*100/(select sum(total_price) from sales) as per_of_total from sales group by pizza_category;


-- Percentage Of Sales by pizza Size:
select pizza_size,round(sum(total_price)*100/(select sum(total_price) from sales),2) as per_of_total from sales 
group by pizza_size order by per_of_total desc;


-- Total pizzas sold by pizza category:
select pizza_category,sum(quantity) as Total_quantity_sold from sales
group by pizza_category order by Total_quantity_sold desc;


-- Top 5 Best sellers by revenue, total quantity and total orders:
select pizza_name,sum(total_price) as Total_revenue from sales 
group by pizza_name order by Total_revenue desc limit 5;


-- Buttom 5 best sellers by revenue, total quantity and total orders:
select pizza_name,sum(total_price) as Total_revenue from sales 
group by pizza_name order by Total_revenue asc limit 5;

