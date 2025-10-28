
# Omniretail Sales Performance Analysis  
**SQL • Excel Power Query • Power BI Case Study**  

[![Live Power BI Dashboard](https://img.shields.io/badge/Power_BI-Live_Demo-blue?logo=powerbi)](https://app.powerbi.com/view?r=eyJrIjoiYzM5ZGE1MTEtOTZlNy00NDRiLWExNmEtNTE2MDgzNmE3ZDUxIiwidCI6IjIwYjliYTY2LWExMWQtNDkzOC1iNzk0LWYyZTg1YjEzODgxOCIsImMiOjEwfQ%3D%3D)  

---

## Project Overview  
**Omniretail Pvt. Ltd.** is a multi-region retail chain operating in **North, South, East, and West** with product categories: **Electronics, Grocery, Clothing, Home, Toys**.  

This project analyzes **sales performance, return patterns, customer behavior, and store efficiency** using:  
- **Excel Power Query** → Data cleaning  
- **MySQL** → 10+ business & ad-hoc queries  
- **Power BI** → Interactive dashboard  

**Assignment Deadline:** 20 June 2025  
**Status:** **Completed & Submitted**

---

## Business Challenges  
| Challenge | Impact |
|--------|--------|
| Regional revenue imbalance | Lost growth opportunities |
| High return rates in Electronics | Profit leakage |
| Inconsistent payment adoption | Missed digital revenue |
| Store vs category profitability gaps | Resource misallocation |

---

## Data Cleaning (Excel Power Query)  

**Raw Data Issues:**  
- `Sale_Date` stored as text (`6/15/2025`)  
- Transposed rows, inconsistent headers  
- Duplicates & nulls  

**Power Query Transformation Steps:**  
1. **Transpose** → Corrected structure  
2. **Promote Headers** → Standardized columns  
3. **Change Type** → `Sale_Date` → Date  
4. **Remove Duplicates & Nulls**  
5. **Export** → `sales_cleaned.csv`  

**SQL Backup Date Fix:**  
```sql
ALTER TABLE Sales ADD COLUMN Sale_Date_New DATE;
UPDATE Sales SET Sale_Date_New = STR_TO_DATE(Sale_Date, '%c/%e/%Y');
ALTER TABLE Sales DROP COLUMN Sale_Date;
ALTER TABLE Sales RENAME COLUMN Sale_Date_New TO Sale_Date;
```

---

## Core SQL Solutions (10 Business Questions)  

| # | Question | Key Insight |
|---|---------|-------------|
| 1 | Highest revenue region? | **West** → `$0.14M` |
| 2 | Highest avg revenue per sale? | **Grocery** → `$1,064.36` |
| 3 | Return rate per category? | **Electronics** → `15.63%` |
| 4 | Top 5 products by quantity? | `P0040` (113 units) |
| 5 | Lowest revenue, highest sales count? | Solved with **CTE + RANK()** |
| 6 | Payment method revenue impact? | **Credit Card** → `25.96%` |
| 7 | Top 10 customers by spend? | `C0001` → `$8,023.60` |
| 8 | Peak sales quarter? | **Q2** → `$0.14M` |
| 9 | Avg unit price per category? | **Electronics** → `$200.59` |
| 10| Highest return % category? | **Electronics** → `15.63%` |

[View SQL File](Assignment_Ques_Query.sql)

---

## Ad-hoc Analysis (Bonus Insights)  

| Insight | Finding |
|-------|--------|
| **AOV by Region** | South → **$1,063.78** |
| **Return Trend** | Peaks in **June (7), December (7)** |
| **Payment Preference** | Credit Card dominates West |
| **Store Efficiency** | `S008` → **$1,148/sale** |
| **Top 5 by AOV** | `C0191` → `$1,805.31` |

[View Ad-hoc SQL](SQL_Queries/Adhoc_Analysis.sql)

---

## Interactive Power BI Dashboard  

**Live View:** [Open Dashboard](https://app.powerbi.com/view?r=eyJrIjoiYzM5ZGE1MTEtOTZlNy00NDRiLWExNmEtNTE2MDgzNmE3ZDUxIiwidCI6IjIwYjliYTY2LWExMWQtNDkzOC1iNzk0LWYyZTg1YjEzODgxOCIsImMiOjEwfQ%3D%3D)  

**Features:**  
- **Slicers:** Region, Quarter, Category, Store  
- **Drill-down:** Revenue → Category → Product  
- **KPIs:** Total Revenue, AOV, Return Rate  
- **Visuals:** Heatmaps, Donuts, Trends, Tables  
 
---

## Key Insights  

| Insight | Implication |
|-------|-------------|
| **West = $0.14M revenue** | Scale store & marketing model |
| **Electronics = 15.6% returns** | Quality control needed |
| **Q2-Q3 = Peak sales** | Boost mid-year promotions |
| **Top 10 customers = 25%+ revenue** | Loyalty program critical |
| **Credit Card = High returns** | Monitor refund policies |

---

## Recommendations  

1. **Replicate West region strategies** in East & North  
2. **Electronics Quality Taskforce** → Reduce 15.6% returns  
3. **Q2-Q3 Flash Sales** in Grocery & Clothing  
4. **5% Cashback on Credit Card/UPI**  
5. **Platinum Tier** for top 50 customers  

---

## Project Structure  

Omniretail-Sales-Analysis/
│
├── SQL_Queries/
│   ├── Business_Questions.sql
│   ├── Adhoc_Analysis.sql
│   └── Data_Cleaning.sql
│
├── PowerBI/
│   └── Omniretail_Dashboard.pbix
│
├── Data/
│   ├── raw_data.xlsx
│   └── sales_cleaned.csv
│
├── Screenshots/
│   └── *.jpg
│
├── Presentation/
│   ├── voice_script.txt
│   └── slides.pptx
│
└── README.md



## Tech Stack  
| Tool | Purpose |
|------|--------|
| **Excel Power Query** | Data cleaning & ETL |
| **MySQL** | Complex queries (CTEs, window functions) |
| **Power BI** | Interactive visualization & storytelling |



> **"Turning raw retail data into revenue-growing decisions — one query at a time."**  

