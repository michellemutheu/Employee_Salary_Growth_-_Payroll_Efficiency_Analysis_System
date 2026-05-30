SELECT
employee_id,
salary_amount,
effective_date,
LAG(salary_amount) OVER (
    PARTITION BY employee_id 
    ORDER BY effective_date
    ) AS previous_salary,

salary_amount - LAG(salary_amount) OVER (
    PARTITION BY employee_id 
    ORDER BY effective_date
    ) AS salary_difference,

SUM(salary_amount) OVER (
    PARTITION BY employee_id 
    ORDER BY effective_date
    ) AS running_total_salary,

AVG(salary_amount) OVER (
    PARTITION BY employee_id
     ORDER BY effective_date
     ) AS moving_average_salary 
     
FROM salary_history;