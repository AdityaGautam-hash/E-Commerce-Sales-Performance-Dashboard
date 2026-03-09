# E-Commerce Sales Analytics

End-to-end data analytics project analyzing an e-commerce dataset using Python, SQL, and Power BI.

The project demonstrates a complete analytics workflow including data ingestion, transformation, dimensional modeling, and business intelligence visualization.

The project demonstrates a full analytics workflow from raw data ingestion to an interactive dashboard.

The SQL transformations follow a **medallion-style architecture** (staging → silver → gold)
---

## Dashboard Preview

![Dashboard](ecommerce-analytics-project/dashboard_preview/E-Commerce%20Sales%20Analytics%20Dashboard.png)

---

## Interactive Dashboard

View the live Power BI dashboard here:

https://app.powerbi.com/links/Dg3d1IjiCS?ctid=bc9cd8e7-1801-4d9b-9c0d-c39cb60a7a19&pbi_source=linkShare

---

## Tech Stack

- Python
- SQL
- MySQL
- SQLAlchemy
- Power BI
---

## Project Workflow

1. Raw CSV files are loaded into a SQL database using Python and SQLAlchemy.
2. SQL scripts transform the data and create analytical tables.
3. A star schema is built with a **fact_sales** table and dimension tables.
4. Power BI is used to create an interactive dashboard with key business insights.

---

## Key Insights

* Credit card is the most commonly used payment method.
* A few product categories generate most of the revenue.
* Revenue trends show steady growth over time.
* Most customers leave high review scores (4–5).

---

## Dataset

Brazilian E-Commerce Public Dataset by Olist

https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

---

## Repository Structure

```
ecommerce-analytics-project/
│
├── Python/                → data ingestion scripts
├── SQL/                   → data transformation queries
└── dashboard_preview/     → dashboard screenshot
```
