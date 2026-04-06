import pandas as pd

def merge_inventory(df, inventory):
    return df.merge(inventory, on="product_id", how="left")


def compute_inventory_metrics(df):
    df = df.copy()

    df["daily_demand"] = df["predicted_sales"]

    df["demand_during_lead_time"] = df["daily_demand"] * df["lead_time_days"]

    # Safety stock based on variability
    df["safety_stock"] = df["daily_demand"].std() * df["lead_time_days"]

    df["reorder_point"] = df["demand_during_lead_time"] + df["safety_stock"]

    df["reorder_flag"] = df["stock_quantity"] < df["reorder_point"]

    return df