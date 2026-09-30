/*
Insights to Management in Consumer goods domain

CODE BASICS RESUME PROJECT CHALLENGE #4

ATLIQ HARDWARE'S MANAGEMENT WANTS TO GET SOME INSIGHTS IN THE SALES OF ITS PRODUCTS. 
AS A DATA ANALYST MY TASK IS TO RESPOND TO 10 AD-HOC QUERIES ASSIGNED TO ME.

Use Dataset gdb023
*/


/* 1. Provide the list of markets in which customer "Atliq Exclusive" operates its
business in the APAC region.
*/

select distinct(market), customer, region
from dim_customer 
where customer = "Atliq Exclusive" and region = "APAC";

/*2. What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg
*/

with up1 as(
select count(distinct product_code) as unique_products_2020
from fact_sales_monthly
where fiscal_year = 2020
), 
up2 as(
select count(distinct product_code) as unique_products_2021
from fact_sales_monthly
where fiscal_year = 2021
)

# Note - we can take fact_gross_price table as it has also same product_code column 

select *, (unique_products_2021 - unique_products_2020)/unique_products_2020*100 as percentage_chg
from up1
join up2;


/*
3. Provide a report with all the unique product counts for each segment and
sort them in descending order of product counts. The final output contains
2 fields,
segment
product_count
*/

select segment, count(distinct Product_code) as product_count
from dim_product 
group by segment
order by product_count desc;


/*
4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference
*/

with up1 as(
select segment, count(distinct product) as product_count_2020
from dim_product p join fact_sales_monthly s 
on p.product_code = s.product_code
where fiscal_year = 2020
group by segment
),
up2 as(
select segment, count(distinct product) as product_count_2021
from dim_product p join fact_sales_monthly s 
on p.product_code = s.product_code
where fiscal_year = 2021
group by segment
)

# Note - we can take fact_gross_price table as it has also same product_code column 

select up1.*, up2.product_count_2021,
(product_count_2021 - product_count_2020) as difference
from up1 join up2 
on up1.segment = up2.segment
order by difference desc;

/* Note- In the above query we will take count(distinct product) not product_code because in Product table product is same
but variant is different due to this product_code is unique while we are counting unique product that's why we took product column
and we can use p.product or only product because this column exist only in dim_product table so there will be no ambiguity.
*/




/*
5. Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost
*/

select 
p.product_code, 
p.product, 
m.manufacturing_cost
from dim_product p join fact_manufacturing_cost m
on p.product_code = m.product_code 
where manufacturing_cost in ( 
	select max(manufacturing_cost) from fact_manufacturing_cost
	union
    select min(manufacturing_cost) from fact_manufacturing_cost)
order by manufacturing_cost desc;

/*
Note- If we want to give labels the we can use below condition in select statement after m.manufacturing_cost
    CASE 
        WHEN m.manufacturing_cost = (SELECT MAX(manufacturing_cost) FROM fact_manufacturing_cost) THEN 'Highest Cost'
        WHEN m.manufacturing_cost = (SELECT MIN(manufacturing_cost) FROM fact_manufacturing_cost) THEN 'Lowest Cost'
    END AS cost_label
*/



/*
6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage
*/

with avg_pid as (
select customer_code, avg(pre_invoice_discount_pct) as A
from fact_pre_invoice_deductions
where fiscal_year = 2021
group by customer_code
),
dim_c as (
select customer_code, customer
from dim_customer
where market = 'India'
)

select avg_pid.customer_code, dim_c.customer, round(avg_pid.A, 2) as average_discount_percentage
from dim_c join avg_pid
on dim_c.customer_code = avg_pid.customer_code
order by average_discount_percentage desc
limit 5;



/*
7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount
*/

select monthname(s.date) as month, s.fiscal_year, 
round(sum(s.sold_quantity*g.gross_price),2) as Gross_sales_Amount
from fact_sales_monthly s join fact_gross_price g
on s.product_code = g.product_code
join dim_customer d
on s.customer_code = d.customer_code
where customer = 'Atliq Exclusive'
group by month, s.fiscal_year
order by s.fiscal_year;


/*
Note - The startegy is start from fact_sales_monthly table because we want month and year and join with fact_gross_price table
as both have product_code column but we will take fiscal year from fact_sales_monthly not from fact_gross_price table as this table
doesn't contain month column and we want month and year both. After that we will join dim_customer and the filter condition will be
applied where customer = 'Atliq Exclusive' and then select statement will execute and then it will group by month, s.fiscal_year.

---Steps to understand the above query---

select monthname(s.date) as month, s.fiscal_year, 
s.customer_code, c.customer, p.gross_price, s.sold_quantity
	  -- round(sum(p.gross_price*s.sold_quantity),2) as gross_sales_amount
from fact_sales_monthly s
join fact_gross_price p
on s.product_code= p.product_code
join dim_customer c
on c.customer_code= s.customer_code;
-- where customer= 'atliq exclusive'
-- GROUP BY  Month, s.fiscal_year 
-- ORDER BY s.fiscal_year;
*/



/*
8. In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity
*/

with cte1 as(
select *, 
	CASE
		WHEN month(date) in (9,10,11) THEN 'Q1'
		WHEN month(date) in (12,1,2) THEN 'Q2'
		WHEN month(date) in (3,4,5) THEN 'Q3'
        ELSE 'Q4'
	END AS Quarter
from fact_sales_monthly
Where fiscal_year = 2020
)
select Quarter, sum(sold_quantity) as total_sold_quantity
from cte1
group by Quarter
order by total_sold_quantity desc;

# Note - In USA, Canada, Europe and many countries Quarter starts from september means for fiscal year 2020 first quarter will start
# from september 2019 - November 2019 and so on till fourth quarter june 2020 - August 2020

/* Another way to do this query 
SELECT 
CASE
    WHEN date BETWEEN '2019-09-01' AND '2019-11-30' then 'Q1'  
    WHEN date BETWEEN '2019-12-01' AND '2020-02-29' then 'Q2'
    WHEN date BETWEEN '2020-03-01' AND '2020-05-31' then 'Q3'
    WHEN date BETWEEN '2020-06-01' AND '2020-08-31' then 'Q4'
    END AS Quarters,
    SUM(sold_quantity) AS total_sold_quantity
FROM fact_sales_monthly
WHERE fiscal_year = 2020
GROUP BY Quarters
ORDER BY total_sold_quantity DESC;
*/




/*
9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage
*/

with cte1 as (
select d.channel,
concat(round(sum(s.sold_quantity*g.gross_price)/1000000, 2), 'M') as gross_sales_mln
from fact_sales_monthly s 
join fact_gross_price g using(product_code)
join dim_customer d using (customer_code)
where s.fiscal_year = 2021
group by d.channel
)
select channel, gross_sales_mln, Round(gross_sales_mln*100/sum(gross_sales_mln) over(), 2) as percentage
from cte1
order by percentage desc;

# Note - Over is mandatory as we are calculating percentage over all rows that means over all channels
# And the best practice is use CTE's as we can reuse them in another query 


/*
10. Get the Top 3 products in each division that have a high total_sold_quantity
in the fiscal_year 2021? The final output contains these fields,
division
product_code
product
total_sold_quantity
rank_order
*/

with cte1 as(
select p.division, p.product_code, p.product, sum(sold_quantity) as total_sold_quantity,
rank() over(partition by division order by sum(sold_quantity) desc) as rank_order
from dim_product p 
join fact_sales_monthly s using(product_code)
where s.fiscal_year = 2021
group by p.division, p.product_code, p.product
)
select * from cte1
where rank_order in (1,2,3);


# Note - we will use order by in rank() function as this mandatory while row_number doesn't require this 

/* Consumer Goods Ad_Hoc Insights
Question -1 
Generate a yearly report for 'croma' customer where the output contains these fields:
fiscal_year
yearly_gross_sales
make sure that yearly_gross_sales are in millions (divide the total by 1000000)
*/

with cte1 as (
select s.fiscal_year,
concat(round(sum(s.sold_quantity*g.gross_price)/1000000, 2), 'M') as gross_sales_mln
from fact_sales_monthly s 
join fact_gross_price g using(product_code, fiscal_year)
join dim_customer d using (customer_code)
where d.customer = 'Croma'
group by s.fiscal_year
order by s.fiscal_year
)
select * from cte1;

# Note - we have to join by two columns product_code, fiscal_year otherwise result will be wrong


/*
Question -2
Generate a report which contains the fiscal year and also the number of 
unique products sold in that year. This helps Atliq Hardware’s regarding 
the development of new products and its growth year on year.
*/

SELECT 
    fiscal_year,
    COUNT(DISTINCT product_code) AS unique_products_sold
FROM fact_sales_monthly
GROUP BY fiscal_year
ORDER BY fiscal_year;

# "FY2021 grew product variety by 36.33% — but FY2022 only grew by 19.76%."

WITH yearly_products AS (
    SELECT fiscal_year, COUNT(DISTINCT product_code) AS unique_products_sold
    FROM fact_sales_monthly
    GROUP BY fiscal_year
),
with_lag AS (
    SELECT 
        fiscal_year,
        unique_products_sold,
        LAG(unique_products_sold) OVER (ORDER BY fiscal_year) AS prev_year_count
    FROM yearly_products
)
SELECT 
    fiscal_year,
    unique_products_sold,
    prev_year_count,
    ROUND((unique_products_sold - prev_year_count) * 100.0 / prev_year_count, 2) AS yoy_growth_pct
FROM with_lag
ORDER BY fiscal_year;








