import pandas as pd

def clean_data(df):
    df = df.drop_duplicates()
    df = df.dropna()
    return df


def aggregate_daily(df):
    return df.groupby(["date", "product_id"]).agg(
        total_quantity=("quantity", "sum")
    ).reset_index()