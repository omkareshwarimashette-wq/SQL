#MATHEMATIC FUNCTIONS

-- 1. Find sine value of an angle.
SELECT SIN(angle_in_radians) 
from dual;

-- 2. Find cosine value of an angle.
select cos(angle_in_radians)
from dual;

-- 3. Find tangent value.
select tan(angle_in_radians)
from dual;

-- 4. Convert degrees to radians.
SELECT degrees * (ACOS(-1) / 180) AS radians
FROM dual;

-- 5. Convert radians to degrees.
SELECT radians * (180 / ACOS(-1)) AS degrees
FROM dual;

-- 6. Find logarithm (base 10) of a number.
SELECT LOG(10, number) AS log_value
FROM dual;

-- 7. Find natural log of a number
SELECT LN(number) FROM table_name;

-- 8. Find square of a number
SELECT 5 * 5 AS square;

-- 9. Find cube of a number.
SELECT 5 * 5 * 5 AS cube;

-- 10. Calculate factorial of a number.
SELECT num,
       EXP(SUM(LN(LEVEL))) AS factorial
FROM numbers
CONNECT BY LEVEL <= num
GROUP BY num;

-- 11. Find greatest value among three numbers.
SELECT GREATEST(10, 25, 18) AS greatest_value
FROM dual;

 -- 12.Find least value among three numbers.
 SELECT LEAST(10, 25, 18) AS least_value
FROM dual;

-- 13. Calculate variance of sales
SELECT VARIANCE(sales_amount) AS sales_variance
FROM sales;

-- 14. Calculate standard deviation of sales
SELECT STDDEV(column_name) AS standard_deviation
FROM table_name;

-- 15. Find average deviation.
SELECT AVG(ABS(sales_amount - (SELECT AVG(sales_amount) FROM sales))) AS avg_deviation
FROM sales;

-- 16. Calculate geometric mean.
SELECT EXP(AVG(LN(sales_amount))) AS geometric_mean
FROM sales;

--  17. Calculate harmonic mean
SELECT COUNT(salary) / SUM(1 / salary) AS harmonic_mean_salary
FROM employees;

-- 18. Find sum of squares.
SELECT SUM(num * num) AS sum_of_squares
FROM numbers;

-- 19. Calculate correlation between two columns.
SELECT CORR(column1, column2) AS correlation
FROM table_name;

-- 20. Calculate regression slope.
SELECT REGR_SLOPE(y_column, x_column) AS regression_slope
FROM table_name;




