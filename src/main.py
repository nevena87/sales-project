from extract import load_data
from transform import clean_data, aggregate_daily
from features import create_features
from train import train_model
from predict import generate_predictions
from inventory import merge_inventory, compute_inventory_metrics
from evaluate import evaluate
from config import CONFIG
from utils import setup_logging

def main():
    logger = setup_logging()

    logger.info("Loading data...")
    sales, inventory = load_data()

    logger.info("Cleaning data...")
    sales = clean_data(sales)

    logger.info("Aggregating data...")
    df = aggregate_daily(sales)

    logger.info("Feature engineering...")
    df = create_features(df)

    logger.info("Training model...")
    model = train_model(df, CONFIG["features"])

    logger.info("Generating predictions...")
    df = generate_predictions(model, df, CONFIG["features"])

    logger.info("Merging inventory...")
    df = merge_inventory(df, inventory)

    logger.info("Computing inventory metrics...")
    df = compute_inventory_metrics(df)

    logger.info("Sample results:")
    print(df.head(50))

if __name__ == "__main__":
    main()