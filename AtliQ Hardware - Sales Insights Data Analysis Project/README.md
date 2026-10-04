<img width="1024" height="768" alt="Presented by - Hayder Ali" src="https://github.com/user-attachments/assets/7a71eae4-73ee-4fd9-9ec9-f8c904fc8c79" />

# Project Overview #
This project presents a comprehensive Power BI dashboard solution developed for AtliQ Hardware, a computer hardware and peripheral supplier operating across India. The company faces challenges in tracking sales performance across its dynamic market, with regional managers providing verbal reports that often mask underlying issues. This data analysis project transforms raw sales data into actionable insights, enabling data-driven decision-making.

# Problem Statement #

AtliQ Hardware, led by Sales Director Bhavin Patel, struggles with:
- Dynamic Market Growth: Difficulty tracking sales in an evolving market landscape
- Inconsistent Reporting: Regional managers provide verbal quarterly reports that may not reflect true performance
- Hidden Issues: Underlying problems like regional declines aren't properly identified
- Reactive Decision Making: Inability to proactively implement promotional offers or customer engagement strategies
- Solution: Develop an interactive Power BI dashboard providing real-time sales insights for informed decision-making.

# Technical Implementation Steps #

**1. Data Discovery**
Analyzed existing sales data structure from multiple Excel files
Identified key data sources: sales transactions, customers, products, markets
Mapped data relationships and business requirements

<img width="1920" height="1014" alt="Sales_Insight_Data_Import" src="https://github.com/user-attachments/assets/6b1b7126-28c2-456e-bf81-54fd759a168c" />

**2. Data Analysis Using SQL**
Performed exploratory data analysis (EDA)
Extracted and validated key metrics (revenue, sales quantity, profit margins)
Identified data quality issues and missing values

<img width="795" height="230" alt="231545034-7f6cc437-5683-44f1-92df-a671540ccae9" src="https://github.com/user-attachments/assets/1973fdba-e242-4de2-b921-ca17905c97f5" />

**3. Data Cleaning/Wrangling/Munging & ETL**
Removed duplicates and handled missing values
Standardized data formats and naming conventions
Transformed raw data into structured format for analysis
Implemented ETL processes for data loading

**4. Data Modeling (Star Schema)**
Designed dimensional model with fact and dimension tables
Fact Table: Sales Transactions
Dimension Tables: Customers, Products, Markets, Date
Established relationships for optimal query performance

<img width="1532" height="801" alt="Sales_Insight_Data_Model" src="https://github.com/user-attachments/assets/b7b256af-4849-47ed-a9a0-c0ef9bed952e" />

**5. DAX Operations & Analysis**

**--Key Insights Analysis KPI Measures:**
- Total Revenue, Sales Quantity
- Revenue by Market (Stacked Bar Chart)
- Sales Quantity by Market (Stacked Bar Chart)
- Revenue Trend Over Time (Line Chart)
- Top 5 Customers by Revenue
- Top 5 Products by Revenue
- Year & Month Slicers for dynamic filtering
  
<img width="925" height="505" alt="Sales_Insight_PBI_Key Insight" src="https://github.com/user-attachments/assets/dc72e1b2-0de9-4a6f-80ac-a0875b5a742f" />

**--Profit Analysis KPI Measures:**
- Revenue, Sales Qty, Total Profit Margin
- Revenue Contribution % by Market (Stacked Bar Chart)
- Profit Contribution % by Market (Stacked Bar Chart)
- Profit % by Market (Stacked Bar Chart)
- Customer Revenue & Profit Analysis Table
- Revenue Trend Analysis

<img width="913" height="499" alt="Sales_Insight_PBI_Profit Analysis" src="https://github.com/user-attachments/assets/be66b4d1-124f-4c05-85d2-e5d7b596fbb0" />

**--Performance Insights Granular Analysis:**
- Zone, Market Name, Customer Name, Product Code
- Year-over-Year Revenue Comparison (Line & Clustered Column Chart)
- Profit % Trend Analysis
- Profit Target Slicer for dynamic goal tracking

<img width="919" height="505" alt="Sales_Insight_PBI_Performance Insight" src="https://github.com/user-attachments/assets/793ee307-d39d-4030-adad-1c2c481ad493" />

**6. Dashboard Development**
**Built interactive Power BI dashboard with:**
- **Summary Page:** Key metrics and high-level overview
- **Profit Analysis Page:** Detailed profitability insights
- **Performance Insights Page:** Granular performance metrics
- **Interactive** filters and slicers for dynamic exploration

# Key Features #

### Interactive Dashboards ###
- **Revenue Analysis:** Track revenue trends, top customers, and products
- **Profit Analysis:** Monitor profit margins, contributions, and targets
- **Performance Tracking:** Compare year-over-year performance metrics
- Dynamic Filters
- Date range selection (Year/Month)
- Market/Zone filtering
- Profit target setting
- Product and customer-level drilldown

# Business Impact #
- Real-time sales visibility across all regions
- Early identification of declining markets
- Data-driven promotional strategy development
- Enhanced customer engagement decisions

# Tools Used #
- **Power BI:** Dashboard development and visualization
- **SQL:** Data extraction and validation
- **Excel:** Data source management
- **DAX:** Advanced calculations and measures
- **Star Schema:** Data modeling approach


# Learnings & Insights #
- **Data Quality Importance:** Identified critical data gaps requiring cleaning
- **Visualization Best Practices:** Created intuitive dashboards for executive decision-making
- **Business Impact:** Transformed raw data into actionable insights
- **Technical Skills:** Enhanced Power BI, SQL, and DAX proficiency


