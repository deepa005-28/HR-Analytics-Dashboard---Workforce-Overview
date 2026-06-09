Create DATABASE hr_analytics;
Use hr_analytics;

-- Showing all dataset present in table
SELECT * FROM `hr-analytics-dataset`;

-- Renaming the name of imported table 
RENAME TABLE `hr-analytics-dataset` TO hr_analytics_dataset;

-- Creating Total employees for KPI 
SELECT COUNT(*) AS TotalEmployees FROM hr_analytics_dataset;

-- Showing Attrition rate
SELECT ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS AttritionRate
FROM hr_analytics_dataset;

-- Showing Department-wise Attrition
SELECT Department, COUNT(*) AS Employees, SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) 
AS AttritionCount FROM hr_analytics_dataset GROUP BY Department;

-- Showing Average Salary by department
SELECT Department, AVG(MonthlyIncome) AS AvgSalary FROM hr_analytics_dataset GROUP BY Department;

-- Showing Overtime Impact
SELECT OverTime, COUNT(*) AS Employees, SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) 
AS Attrition FROM hr_analytics_dataset GROUP BY OverTime;
