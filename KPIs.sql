select * from PizzaDB..pizza_sales;

--total revenue
select sum(total_price) as Total_Revenue from PizzaDB..pizza_sales;

--Avg Total number of Orders
select (Sum(total_price)/count(distinct order_id)) as Avg_Order_Value
from PizzaDB..pizza_sales;

--Total pizzas Sold
select (SUM(quantity)) as Total_pizza_sold from PizzaDB..pizza_sales;

--Total Orders Placed
select COUNT(distinct order_id) as total_orders_placed from PizzaDB..pizza_sales;

--Avg Pizas Per Order
select cast(cast(SUM(quantity) AS decimal(10,2))/ cast(COUNT(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizzas_Per_order
from PizzaDB..pizza_sales;
