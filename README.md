# SQL_EDA_project
Exploratory data analysis (EDA) project of the table cafe_sales

This is an exploratory data analysis (EDA) project of the table cafe_sales.
The cafe sales dataset contains 10,000 rows of synthetic data representing sales transactions in a cafe. 

https://www.kaggle.com/datasets/ahmedmohamed2003/cafe-sales-dirty-data-for-cleaning-training

The data has been already cleaned and the clean data is in cafe_sales_staging. I will be using the clean data for EDA.

**Questions I Was Interested In Answering:**
1. What are the key business metrics—total revenue, average transaction value, and total items sold?
2. How do sales trend daily and monthly, and which day of the week generates the highest revenue?
3. What payment methods are most popular overall, and how do preferences vary by location?
4. Which locations perform best, and what items are most popular at each location?

**Steps Taken to Create the Analysis
Data Cleaning:**
1. Renamed columns to be SQL-compliant (no spaces or special characters)
2. Removed duplicate rows to ensure data integrity
3. Standardized inconsistent data (e.g., payment method names, date formats)
4. Handled null values by filling where possible or removing where necessary
5. Dropped irrelevant columns and rows not needed for analysis

**Exploratory Analysis:**
1. Calculated basic statistics: total transactions, total revenue, average transaction value, total items sold, min/max sale
2. Aggregated sales by day and month to identify trends
3. Ranked payment methods by usage overall and by location
4. Analyzed location performance and identified popular items per location

**My Key Takeaways:**
- Total revenue and average transaction value provided a clear baseline for business performance
- Peak sales days revealed opportunities for targeted promotions and staffing optimization
- Payment method preferences varied significantly by location, suggesting tailored checkout experiences could improve customer satisfaction
- Location-based item popularity highlighted opportunities for menu localization and inventory management
