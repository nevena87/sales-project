def generate_predictions(model, df, features):
    df = df.copy()
    df["predicted_sales"] = model.predict(df[features])
    return df