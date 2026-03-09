import pandas as pd
from sqlalchemy import create_engine

# MySQL connection
engine = create_engine(
    "mysql+pymysql://root:Aditya1!@localhost:3306/ecommerce_analytics"
)

# Base path where CSVs are stored
BASE_PATH = r"C:\Users\Aditya Gautam\Desktop\ecommerce-analytics-project\data\raw"

# CSV → staging table mapping
files = {
    "olist_customers_dataset.csv": "stg_customers",
    "olist_orders_dataset.csv": "stg_orders",
    "olist_order_items_dataset.csv": "stg_order_items",
    "olist_order_payments_dataset.csv": "stg_payments",
    "olist_order_reviews_dataset.csv": "stg_reviews",
    "olist_products_dataset.csv": "stg_products",
    "olist_sellers_dataset.csv": "stg_sellers",
    "product_category_name_translation.csv": "stg_category_translation",
    "olist_geolocation_dataset.csv": "stg_geolocation"
}

for file, table in files.items():
    print(f"Loading {file} → {table}")
    df = pd.read_csv(f"{BASE_PATH}\\{file}")
    df.to_sql(table, con=engine, if_exists="append", index=False)
    print(f"✅ {table} loaded ({len(df)} rows)")

print("🎉 ALL STAGING TABLES LOADED SUCCESSFULLY")