# Amazon-SPS-Seller-Analytics
SQL database and analysis for tracking Amazon selling partner performance and resolution latency.
This project, Amazon-SPS-Seller-Analytics, is a comprehensive SQL-based case study designed to analyze retail performance and customer behavior within an e-commerce environment. By utilizing advanced SQL techniques, it transforms raw sales data into actionable business intelligence.

Core Objectives
The project aims to answer critical business questions regarding revenue, product performance, and customer demographics to optimize operational efficiency.

Key Analytical Areas
The analysis_queries.sql file contains structured queries to address the following:

Sales Performance:

Revenue Tracking: Calculates monthly revenue trends and identifies the cities with the highest sales volume.

Product Analysis: Ranks product lines by sales quantity and identifies the top-performing categories by revenue.

Operational Efficiency: Breaks down sales by time of day (Morning, Afternoon, Evening) and weekdays to identify peak traffic periods.

Customer Insights:

Demographics: Analyzes the distribution of genders across different branches and identifies the predominant customer types.

Segmentation: Uses conditional logic (CASE statements) to categorize product performance as "Good" or "Bad" based on average sales benchmarks.

Behavioral Trends: Determines which payment methods (e.g., E-wallet, Cash, Credit Card) are most frequently used.

Financial Metrics:

VAT Analysis: Identifies which customer types and cities contribute the highest Value Added Tax (VAT) payments.

Profitability: Calculates average ratings and purchase frequencies to gauge customer satisfaction and loyalty.

Technical Implementation
The project showcases proficiency in Advanced SQL, utilizing several key features:

Window Functions & CTEs: Used for complex rankings and temporary result sets (e.g., finding the most frequent product line by gender).

Aggregations & Joins: Essential for summarizing totals, averages, and counts across multiple dimensions like branches and cities.

Subqueries: Leveraged to calculate dynamic averages for comparative performance analysis (e.g., identifying branches that exceeded the average product sales).
