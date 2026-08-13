DROP TABLE IF EXISTS employee_sales;
CREATE TABLE employee_sales(
 sale_id INT PRIMARY KEY,
 department VARCHAR(30),
 employee_id INT,
 units INT,
 price NUMERIC(10,2),
 commission NUMERIC(10,2)
);
INSERT INTO employee_sales VALUES
(1,'Data',101,10,3000,1500),(2,'Data',102,8,2500,1200),
(3,'Data',101,5,4000,1000),(4,'Finance',103,12,2200,900),
(5,'Finance',104,10,3000,1200),(6,'Finance',103,7,2800,800),
(7,'Marketing',105,15,1800,700),(8,'Marketing',106,8,1500,500),
(9,'HR',107,5,2000,300),(10,'HR',108,4,1800,250);
