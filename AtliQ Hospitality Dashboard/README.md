# Project Overview #
This project presents a comprehensive Power BI dashboard solution developed for AtliQ Grands owns multiple five-star hotels across India 

# Problem Statement #
AtliQ Grands owns multiple five-star hotels across India. They have been in the hospitality industry for the past 20 years. Due to strategic moves from other competitors and ineffective decision-making in management, AtliQ Grands are losing its market share and revenue in the luxury/business hotels category. As a strategic move, the managing director of AtliQ Grands wanted to incorporate “Business and Data Intelligence” to regain their market share and revenue. However, they do not have an in-house data analytics team to provide them with these insights.

Their revenue management team had decided to hire a 3rd party service provider to provide them with insights from their historical data.

# Technical Implementation Steps #

**1. Data Discovery**
Analyzed existing hotel data structure from multiple Excel files
Identified key data sources: dim_date, dim_hotels, dim_rooms, fact_aggregated_bookings, and fact_bookings
Mapped data relationships and business requirements

**2. Data Cleaning/Wrangling/Munging & ETL**
Removed day_type column
Standardized data formats and naming conventions
Transformed raw data into structured format for analysis
Implemented ETL processes for data loading

**3. Data Modeling (Star Schema)**
Designed dimensional model with fact and dimension tables
Fact Table: fact_aggregated_bookings, and fact_bookings
Dimension Tables: dim_date, dim_hotels, dim_rooms
Established relationships for optimal query performance

<img width="1259" height="513" alt="Hospitality_Screenshot_2" src="https://github.com/user-attachments/assets/4b9d0f2f-58af-4f54-a4da-365783b449d0" />


# Interactive Dashboards #

**Key Insights Analysis KPI Measures:**
- KPI's - Revenue, RevPAR, DSRN, Ocuupancy%, ADR, Realisation% (Card Visual)
- Filter by Room, CIty, Month and week no (Slicer)
- Revenue share with hotel category (Donut Chart)
- KPI trends over week (Line Chart)
- comparisons of KPIs(RevPAR, Occupancy%, ADR, Realisation%) between weekdays and weekends (Table Visual)
- Realisation % and ADR with booking platforms (Line and stacked column chart)
- KPI performance across different properties (Table Visual)

<img width="885" height="483" alt="Hospitality_Screenshot_1" src="https://github.com/user-attachments/assets/3c2ac56c-e9d8-4af3-8868-b5da5d50ee4d" />

<img width="905" height="489" alt="Hospitality_Screenshot_3" src="https://github.com/user-attachments/assets/95c5a1c3-fd8c-47e9-b66f-c5e897598393" />


# Business Impact #
- Real-time sales visibility across all regions
- Early identification of declining markets
- Data-driven promotional strategy development
- Enhanced customer engagement decisions

# Tools Used #
- **Power BI:** Dashboard development and visualization
- **Power Query:** Data cleaning and transformation 
- **Excel:** Data source management
- **DAX:** Advanced calculations and measures
- **Star Schema:** Data modeling approach

# Learnings & Insights #
- **Data Quality Importance:** Identified critical data gaps requiring cleaning
- **Visualization Best Practices:** Created intuitive dashboards for executive decision-making
- **Business Impact:** Transformed raw data into actionable insights
- **Technical Skills:** Enhanced Power BI, SQL, and DAX proficiency

### Special thanks to [Mr. Dhaval Patel](https://www.linkedin.com/in/dhavalsays/) and [Mr. Hemanand Vadivel](https://www.linkedin.com/in/hemvad/) for their tremendous effort through their [guided project](https://www.youtube.com/watch?v=tT4V7zguCnc&list=WL&index=79). ###
