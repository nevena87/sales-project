# 📦 Sales Forecasting & Inventory Optimization System

![Python](https://img.shields.io/badge/Python-3.12-blue)
![Machine Learning](https://img.shields.io/badge/ML-XGBoost-green)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Type](https://img.shields.io/badge/Project-Data%20Science-orange)

---

## 🚀 Overview

End-to-end data science project that predicts product demand and optimizes inventory using machine learning.

The system helps businesses:

- 📉 Reduce stockouts  
- 📦 Avoid overstock  
- 📊 Improve demand forecasting  
- ⚙️ Automate inventory decisions  

---

## 🧠 Key Features

- Time-series feature engineering (lags, rolling averages)
- Machine learning model (XGBoost Regressor)
- TimeSeries cross-validation
- Inventory optimization logic (reorder point + safety stock)
- Modular, production-style architecture
- Logging and configuration management

---

## 📊 Business Problem

Retail companies often struggle with:

- Overstock → tied-up capital  
- Stockouts → lost revenue  
- Poor demand visibility  

This project addresses these issues by combining:

👉 Demand forecasting + Inventory optimization

---

## 🧱 Project Structure
```bash
project/
│
├── data/
│ ├── sales.csv
│ ├── inventory.csv
│
├── src/
│ ├── config.py
│ ├── extract.py
│ ├── transform.py
│ ├── features.py
│ ├── train.py
│ ├── predict.py
│ ├── inventory.py
│ ├── evaluate.py
│ ├── utils.py
│ └── main.py
│
└── requirements.txt
```
---

## ⚙️ Tech Stack

- Python 🐍  
- Pandas, NumPy  
- Scikit-learn  
- XGBoost  
- Time Series Modeling  

---

## 📊 Dataset

### Sales Data

| Column     | Description       |
|------------|-------------------|
| date       | Transaction date  |
| product_id | Product ID        |
| quantity   | Units sold        |

### Inventory Data

| Column           | Description              |
|------------------|--------------------------|
| product_id       | Product ID               |
| stock_quantity   | Current stock level      |
| lead_time_days   | Supplier lead time       |

---
## 🗄️ SQL Analysis (Exploratory Data Analysis)

Before building the machine learning pipeline, SQL was used for exploratory data analysis and validation of the dataset.

SQL queries helped to:
- Aggregate sales per product
- Analyze historical trends
- Identify last sale dates
- Join sales and inventory data
- Perform business-level validation

Role of SQL in the Project
- SQL was used for initial data exploration and aggregation
- Python was used for:
  - Data cleaning
  - Feature engineering
  - Model training
  - Prediction
  - Inventory optimization

---
## ▶️ How to Run

```bash
git clone https://github.com/your-username/sales-project.git
cd sales-project

pip install -r requirements.txt

python src/main.py
```
---

## 🤖 Model
- Algorithm: XGBoost Regressor
- Validation: TimeSeriesSplit
- Features:
  - day_of_week
  - month
  - lag_1
  - rolling_mean_7
---
## 📦 Inventory Optimization
The system computes:
- Predicted demand
- Demand during lead time
- Safety stock
- Reorder point

- Formula:
  - Reorder Point = Demand during lead time + Safety Stock

- Decision rule:
  - If stock_quantity < reorder_point → reorder_flag = True
---
## 📈 Output
Final dataset includes:
- predicted_sales
- stock_quantity
- lead_time_days
- reorder_point
- reorder_flag
---
## 🧩 Possible Improvements
- LSTM / Prophet models
- Hyperparameter tuning (Optuna)
- External features (holidays, promotions)
- API deployment (FastAPI)
- Dashboard (Power BI / Tableau)
- Docker containerization
- Real-time inference
---
## 🎯 Business Impact
- Improved inventory efficiency
- Reduced stockouts
- Better demand planning
- Data-driven decision making
---
## 👩‍💻 Author
### Nevena Ćulibrk
Master Software Engineering (Data Science focus)
