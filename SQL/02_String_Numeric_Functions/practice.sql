-- Q1. Create uppercase full name and 3-character city code.
SELECT customer_id,
       CONCAT(UPPER(first_name),' ',UPPER(last_name)) AS full_name,
       LEFT(city,3) AS city_code
FROM customers
ORDER BY full_name;

-- Q2. Create lowercase city and last 2 characters as a code.
SELECT customer_id,
       LOWER(city) AS city,
       RIGHT(city,2) AS city_code
FROM customers;

-- Q3. Show completed payments and the difference between CEIL(amount)
-- and amount.
SELECT payment_id,customer,amount,
       ABS(ROUND(CEIL(amount)-amount,2)) AS difference
FROM payments
WHERE status='Completed'
ORDER BY difference DESC;

-- Q4. Show floor and ceiling versions of package weight.
SELECT shipment_id,package_weight,
       FLOOR(package_weight) AS floor_weight,
       CEIL(package_weight) AS billed_weight
FROM shipments;

-- Q5. Find shipments where shipping fee is divisible by 100.
SELECT shipment_id,package_weight,shipping_fee
FROM shipments
WHERE MOD(shipping_fee,100)=0
ORDER BY shipping_fee DESC;

-- Q6. Calculate profit per product.
SELECT product_id,category,
       price-cost AS profit
FROM products
ORDER BY profit DESC;

-- Q7. Average profit by category, rounded to 2 decimals.
SELECT category,
       ROUND(AVG(price-cost),2) AS average_profit
FROM products
GROUP BY category
ORDER BY average_profit DESC;

-- Q8. Categories whose average profit exceeds 5,000.
SELECT category,
       ROUND(AVG(price-cost),2) AS average_profit
FROM products
GROUP BY category
HAVING AVG(price-cost)>5000
ORDER BY average_profit DESC;

-- Q9. Create a formatted customer label using CONCAT and UPPER.
SELECT CONCAT(UPPER(first_name),' - ',UPPER(city)) AS customer_label
FROM customers
ORDER BY customer_label;

-- Q10. Calculate a 10% price increase without modifying the table.
SELECT category,price,
       ROUND(price*1.10,2) AS price_after_increase
FROM products
ORDER BY price_after_increase DESC;

-- Q11. Calculate rounded net payment after a fixed 50-unit fee.
SELECT payment_id,amount,
       ROUND(amount-50,2) AS net_amount
FROM payments
WHERE status='Completed';

-- Q12. Interview: completed payments above 1,500, display customer
-- uppercase and round amount to nearest whole number.
SELECT UPPER(customer) AS customer,
       ROUND(amount,0) AS rounded_amount
FROM payments
WHERE status='Completed'
  AND amount>1500
ORDER BY rounded_amount DESC;
