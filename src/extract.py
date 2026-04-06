import pandas as pd

def load_data():
    sales = pd.read_csv("data/sales.csv", parse_dates=["date"])
    inventory = pd.read_csv("data/inventory.csv")
    return sales, inventory