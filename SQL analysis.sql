SELECT *
FROM `data-analytics-project-492409.finance_data.transactions`
LIMIT 10;

#Total Number of Transactions
SELECT COUNT(*) AS total_transactions
FROM `data-analytics-project-492409.finance_data.transactions`;

#Total TransactionAmount
select sum(TransactionAmount) as total_amount
from `data-analytics-project-492409.finance_data.transactions`;

#Transactions_by Type
select count(AccountID) as Number_of_transactions, Channel as Transaction_Type from `data-analytics-project-492409.finance_data.transactions`
group by Channel
order by Number_of_transactions desc;

#Monthly_Trend
SELECT 
  EXTRACT(MONTH FROM PARSE_DATETIME('%d-%m-%Y %H.%M', TransactionDate)) AS month,
  SUM(TransactionAmount) AS total_amount
FROM `data-analytics-project-492409.finance_data.transactions`
GROUP BY month
ORDER BY month;

#Top_Customers
select AccountID, sum(TransactionAmount) as Total_amount 
from  `data-analytics-project-492409.finance_data.transactions`
group by AccountID
order by Total_amount desc
limit 10;

#Transaction_Amount_by_Age_Category
select CustomerOccupation, round(sum(TransactionAmount), 2) as Total_amount
from `data-analytics-project-492409.finance_data.transactions`
group by CustomerOccupation
order by Total_amount desc;
