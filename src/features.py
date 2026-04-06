import pandas as pd

def create_features(df):
    df = df.copy()

    df["day_of_week"] = df["date"].dt.dayofweek
    df["month"] = df["date"].dt.month

    df = df.sort_values(["product_id", "date"])

    df["lag_1"] = df.groupby("product_id")["total_quantity"].shift(1)
    df["rolling_mean_7"] = df.groupby("product_id")["total_quantity"].transform(
        lambda x: x.rolling(7).mean()
    )

    return df.dropna()