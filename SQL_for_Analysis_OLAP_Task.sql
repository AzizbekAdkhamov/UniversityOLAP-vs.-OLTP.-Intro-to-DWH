
SELECT
    p.prod_category,
    SUM(s.amount_sold) AS total_sales
FROM
    sh.sales AS s
    INNER JOIN sh.products AS p
    ON s.prod_id = p.prod_id 
    INNER JOIN sh.times AS t
    ON s.time_id = t.time_id 
WHERE
    EXTRACT(YEAR FROM t.time_id) = 1998 
GROUP BY
    p.prod_category; 


SELECT
    c.country_region, 
    COUNT(s.quantity_sold) AS avg_sales_qty 
FROM
    sh.sales AS s
    INNER JOIN sh.products AS p
    ON s.prod_id = p.prod_id 
    INNER JOIN sh.customers AS cu
    ON s.cust_id = cu.cust_id 
    INNER JOIN sh.countries AS c
    ON cu.country_id = c.country_id 
WHERE
    p.prod_id = 13 
GROUP BY
    c.country_region; 


SELECT
    c.cust_id,
    c.cust_first_name,
    c.cust_last_name,
    SUM(s.amount_sold) AS total_sales_amount
FROM
    sh.sales AS s
    INNER JOIN sh.customers AS c
    ON s.cust_id = c.cust_id 
GROUP BY
    c.cust_id, c.cust_first_name, c.cust_last_name 
ORDER BY
    total_sales_amount DESC 
LIMIT 5; 
