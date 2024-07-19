select * from PizzaDB..pizza_sales;


--Daily trend for Total Orders

select datename(DW, order_date) as order_day, COUNT(distinct order_id) as total_orders
from PizzaDB..pizza_sales
group by datename(DW, order_date);

--MONTHLY TREND OF ORDERS
select DATENAME(MONTH,order_date) as month_name, COUNT(distinct order_id) as total_orders
from PizzaDB..pizza_sales
group by DATENAME(MONTH,order_date);


--percentage of sales by Pizza category

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from PizzaDB..pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM PizzaDB..pizza_sales
GROUP BY pizza_category


--percentage of sales by Pizza size

select pizza_size, cast(SUM(total_price)*100/(select SUM(total_price)from PizzaDB..pizza_sales)AS decimal(10,2)) as Per_of_total_sales
from PizzaDB..pizza_sales
group by  pizza_size
order by Per_of_total_sales desc;

--Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM PizzaDB..pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC


--Top 5 Pizzas by Revenue
select top 5 pizza_name, sum(total_price) as total_revenue
from PizzaDB..pizza_sales
group by pizza_name
order by total_revenue desc;

--. Bottom 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM PizzaDB..pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC;

--Top 5 Pizzas by Quantity
SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM PizzaDB..pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC;


--. Bottom 5 Pizzas by Quantity
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM PizzaDB..pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC;

-- Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM PizzaDB..pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;

--Borrom 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM PizzaDB..pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;




