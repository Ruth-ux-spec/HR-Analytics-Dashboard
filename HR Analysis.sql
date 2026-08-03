SELECT TOP 10 *
FROM HR_DATA_CLEANED;

1--Purpose
--This query displays the first 10 rows of the HR dataset.
--It helps verify that the data was successfully imported and allows the analyst to inspect the table structure, column names, and sample employee records.


--Insight
--The dataset was successfully imported into SQL Server. The displayed records confirm that the employee information is complete and ready for analysis.

--Recommendation
--Always preview the dataset before starting any analysis to ensure that the data has been imported correctly and that all columns contain the expected values.



2--Total Number of Employees

SELECT COUNT(*) AS TotalEmployees
FROM HR_DATA_CLEANED;

---Purpose
-----This query counts the total number of employee records in the HR dataset. 
---It provides the overall workforce size and serves as the foundation for other HR metrics, such as attrition rate and employee distribution.

--Result
--Total Employees = 1,473

--Insight
--The HR dataset contains 1,473 employees. This represents the total workforce available for analysis and provides the baseline for measuring employee turnover, 
--departmental distribution, and other HR metrics.

--Recommendation
--HR management should regularly monitor the total workforce to support effective workforce planning, recruitment, budgeting, and resource allocation.
--Keeping track of the total number of employees also helps measure organizational growth over time.



3--Display Employees Who Left the Company

SELECT EmpID,
       Age,
       Gender,
       Department,
       JobRole,
       MonthlyIncome,
       YearsAtCompany,
       OverTime,
       MaritalStatus
FROM HR_DATA_CLEANED
WHERE Attrition = 1

--Purpose
--This query retrieves the key information of employees who left the company. 
--It allows HR to focus on employee characteristics such as age, department, job role, salary, years at the company, 
--overtime status, and marital status for further attrition analysis.

--Result
--The query returned 237 employees who left the organization, along with their key employment details.

--Insight
--The query provides a detailed view of employees who resigned, making it possible to identify common patterns
--and characteristics among employees who left the company. This information can be used for deeper analysis of employee turnover.

--Recommendation
--HR should analyze the characteristics of employees who left to identify trends in department, job role, salary, tenure, and overtime. 
--These insights can support targeted retention strategies and help reduce future employee attrition.



4--Employees Who left the Company

SELECT Attrition, COUNT(*) AS Total
FROM HR_DATA_CLEANED
GROUP BY Attrition

--Purpose
--This query groups employees based on their attrition status and counts the number of employees in each group.
--It provides a summary of employee retention and turnover.

--Result
--Attrition   Total Employees
--0 (Stayed)  1236
--1 (Left)    237

--Insight
--The company has a total workforce of 1,473 employees, of which 1,236 employees (about 84%) are still working, while 237 employees (about 16%) have left
--the organization. This indicates that although the majority of employees remain with the company, employee attrition is still present and should be monitored.

--Recommendation
--HR should continue implementing employee retention strategies while paying close attention to the factors contributing to the departure of the 237 employees.
--Regular monitoring of attrition trends can help reduce turnover and improve workforce stability.



5--Average Monthly Income

SELECT AVG(MonthlyIncome) AS AverageIncome
FROM HR_DATA_CLEANED

--Purpose
--This query calculates the average monthly income of all employees in the organization.
--It helps HR understand the overall salary level and provides a benchmark for compensation analysis.

--Result
--Average Monthly Income = 6,500

--Insight
--The average monthly income of employees is 6,500. This indicates the typical salary earned by employees across the organization and serves 
--as a useful benchmark when comparing salaries across departments, job roles, and employee groups.

--Recommendation
--HR should regularly review the company's average salary to ensure it remains competitive with industry standards.
--Competitive compensation can improve employee satisfaction, attract qualified candidates, and reduce employee turnover.

6--Highest Monthly Incone

SELECT MAX(MonthlyIncome) AS HighestIncome
FROM HR_DATA_CLEANED

--Purpose
--This query identifies the highest monthly income in the organization. It helps HR understand the upper salary limit and identify the highest-paid employee(s).

--Result
--Highest Monthly Income = 19,999

--Insight
--The highest monthly income in the organization is 19,998. This indicates the maximum salary paid and can be used as a benchmark when comparing compensation 
--across departments and job roles.

--Recommendation
--HR should regularly review salary structures to ensure they are fair, competitive, and aligned with employees' responsibilities, experience, and performance.




7--Lowest Monthly Income

SELECT MIN(MonthlyIncome) AS LowestIncome
FROM HR_DATA_CLEANED

--Purpose
--This query finds the lowest monthly income among all employees. It helps HR identify the minimum salary level within the organization.

--Result
--Lowest Monthly Income = 1,009

--Insight
--The lowest monthly income is 1,009, showing the minimum salary paid in the organization. This information is useful when evaluating salary fairness
--and compensation policies.

--Recommendation
--HR should review the compensation of lower-paid employees to ensure salaries remain competitive and comply with company policies and market standards.





8---Average Employee Age

SELECT AVG(Age) AS AverageAge
FROM HR_DATA_CLEANED

--Purpose
--This query calculates the average age of employees. It helps HR understand the overall age profile of the workforce.

--Result
--Average Age = 37 years

--Insight
--The average employee age is 37 years, indicating that the organization has a relatively experienced workforce. 
--This metric helps HR understand workforce demographics and supports succession planning.


--Recommendation
---HR should maintain a balanced workforce by attracting early-career professionals while continuing to retain experienced employees.
--A balanced age distribution supports knowledge transfer and long-term organizational growth.





9--Employee Distribution by Gender

SELECT Gender, COUNT(*) AS TotalEmployees
FROM HR_DATA_CLEANED
GROUP BY Gender

--Purpose: Counts the number of male and female employees.

--Insight: The organization has 884 male and 589 female employees, indicating a predominantly male workforce.

---Recommendation: HR should continue promoting diversity and equal employment opportunities.




10---Attrition by Gender

SELECT Gender, COUNT(*) AS TotalAttrition
FROM HR_DATA_CLEANED
WHERE Attrition = 1
GROUP BY Gender

--Purpose: Counts employees who left the company by gender.

--Insight: More male employees (150) left than female employees (87).

--Recommendation: HR should investigate the reasons for higher attrition among male employees while maintaining retention efforts across all employees.



---11 Employee Distribution by Department

SELECT Department, COUNT(*) AS TotalEmployees
FROM HR_DATA_CLEANED
GROUP BY Department

--Purpose: Counts employees in each department.

--Insight: Research & Development has the largest workforce, followed by Sales, while Human Resources has the fewest employees.

--Recommendation: HR should allocate resources and workforce planning according to department size.



12--Average Monthly Income by Department

SELECT Department, AVG(MonthlyIncome) AS AverageIncome
FROM HR_DATA_CLEANED
GROUP BY Department


--Purpose: Calculates the average salary for each department.

--Insight: Sales has the highest average monthly income.

---Recommendation: HR should regularly review salary structures across departments to ensure fairness and competitiveness.




13---Department with the Highest Attrition

SELECT Department, COUNT(*) AS TotalAttrition
FROM HR_DATA_CLEANED
WHERE Attrition = 1 
GROUP BY Department 
ORDER BY TotalAttrition DESC

---Purpose: Counts employees who left in each department.

--Insight: Research & Development records the highest number of employees leaving.

--Recommendation: HR should prioritize retention strategies in departments with the highest turnover.




14--Job Role with the Highest Attrition

SELECT JobRole, COUNT(*) AS TotalAttrition
FROM HR_DATA_CLEANED
WHERE Attrition = 1
GROUP BY JobRole
ORDER BY TotalAttrition DESC;


--Purpose: Counts employees who left in each job role.

--Insight: Sales Representatives and Laboratory Technicians are among the job roles with the highest employee turnover.

--Recommendation: Review workload, compensation, career growth, and employee engagement for these job roles.





15---Overtime and Attrition

SELECT OverTime, COUNT(*) AS TotalAttrition
FROM HR_DATA_CLEANED
WHERE Attrition = 1
GROUP BY OverTime
ORDER BY TotalAttrition DESC;

---Purpose: Counts employees who left based on overtime status.

--Insight: Employees who worked overtime recorded higher attrition.

--Recommendation: HR should monitor overtime and promote a healthier work-life balance.




16---Employee Distribution by Marital Status

SELECT MaritalStatus, COUNT(*) AS TotalEmployees
FROM HR_DATA_CLEANED
GROUP BY MaritalStatus;

--Purpose: Counts employees by marital status.

--Insight: Married employees form the largest group, followed by single and divorced employees.

---Recommendation: HR should ensure employee engagement initiatives support employees regardless of marital status.




17---Education Level Distribution

SELECT Education, COUNT(*) AS TotalEmployees
FROM HR_DATA_CLEANED
GROUP BY Education
ORDER BY Education


--Purpose: Counts employees by education level.

--Insight: The workforce consists of employees with different education levels, providing a diverse educational background.

--Recommendation: HR should tailor training and development programs to employees' educational backgrounds.




18---Average Years at Company

SELECT AVG(YearsAtCompany) AS AverageYearsAtCompany
FROM HR_DATA_CLEANED;

--Purpose: Calculates the average employee tenure.

--Insight: The average years at the company indicate the organization's overall employee retention.

--Recommendation: HR should improve career development opportunities to encourage longer employee tenure





19--Average Monthly Income by Job Role

SELECT JobRole,
       AVG(MonthlyIncome) AS AverageIncome
FROM HR_DATA_CLEANED
GROUP BY JobRole
ORDER BY AverageIncome DESC

---Purpose: Calculates average salary by job role.

--Insight: Some job roles earn significantly higher salaries than others due to differences in responsibilities and seniority.

---Recommendation: HR should regularly review compensation to maintain fairness and competitiveness.



20--Average Age by Department
SELECT Department,
       AVG(Age) AS AverageAge
FROM HR_DATA_CLEANED
GROUP BY Department
ORDER BY AverageAge DESC

--Purpose: Calculates the average age for each department.

--Insight: The average employee age varies across departments, reflecting differences in workforce demographics.

--Recommendation: HR should use this information for workforce planning, succession planning, and talent management.



21--Attrition by Business Travel
SELECT BusinessTravel,
       COUNT(*) AS TotalAttrition
FROM HR_DATA_CLEANED
WHERE Attrition = 1
GROUP BY BusinessTravel
ORDER BY TotalAttrition DESC

--Purpose: Counts employees who left based on business travel frequency.

--Insight: Employees who travel more frequently tend to experience higher attrition.

---Recommendation: HR should evaluate travel policies and provide support to employees with frequent travel responsibilities.




22--Attrition by Education Field

SELECT EducationField,
       COUNT(*) AS TotalAttrition
FROM HR_DATA_CLEANED
WHERE Attrition = 1
GROUP BY EducationField
ORDER BY TotalAttrition DESC;


--Purpose: Counts employees who left by education field.

--Insight: Some education fields have higher employee turnover than others.

--Recommendation: HR should investigate the reasons for higher attrition within these education fields and develop targeted retention strategies.