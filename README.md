# FinTrack Exchange Rate API Pipeline

A production-style ETL (Extract, Transform, Load) pipeline that retrieves real-time foreign exchange rates from the ExchangeRate API, transforms and validates the data using Pandas, and loads the cleaned dataset into PostgreSQL for analysis.

The project demonstrates modern Data Engineering practices including API integration, data validation, data transformation, environment variable management, PostgreSQL integration, and reusable pipeline development with Python.

---

## Project Overview

Financial applications rely on accurate and up-to-date foreign exchange rates for international payments, reporting, trading, and analytics.

This project automates the process of collecting exchange rate data by:

- Extracting live exchange rates from a public REST API
- Validating and transforming raw JSON data
- Converting nested API responses into an analysis-ready DataFrame
- Exporting cleaned data as CSV
- Loading the transformed data into PostgreSQL
- Verifying successful database ingestion

The pipeline follows the ETL architecture commonly used in production Data Engineering environments.

---

## Architecture

```
            ExchangeRate API
                   │
                   ▼
          Extract JSON Response
                   │
                   ▼
        Transform & Clean Data
          (Pandas DataFrame)
                   │
                   ▼
          Validate Data Quality
                   │
                   ▼
         Export Clean CSV File
                   │
                   ▼
       Load into PostgreSQL Database
                   │
                   ▼
        Verify Database Load
```

---

## Tech Stack

- Python 3.12
- Pandas
- Requests
- SQLAlchemy
- PostgreSQL
- Psycopg2
- Python Dotenv
- Jupyter Notebook
- pgAdmin 4

---

## Project Structure

```
fintrack-exchange-api-pipeline/
│
├── data/
│   ├── raw_data/
│   └── cleaned_data/
│
├── notebooks/
│   └── fintrack_api_pipeline.ipynb
│
├── screenshots/
│
├── sql/
│
├── src/
│   └── api_pipeline.py
│
├── .env
├── .gitignore
├── requirements.txt
└── README.md
```

---

## Features

- Real-time Exchange Rate API integration
- Automated JSON extraction
- Robust API error handling
- Data validation
- Missing value detection
- Duplicate detection
- Automatic timestamp generation
- Environment variable configuration
- PostgreSQL integration
- CSV export
- Reusable ETL functions
- Production-ready project structure

---

## ETL Workflow

### Phase 1 — Extract

The pipeline sends a GET request to the ExchangeRate API.

Example endpoint:

```
https://open.er-api.com/v6/latest/USD
```

The response is received as JSON.

---

### Phase 2 — Transform

The JSON response is converted into a Pandas DataFrame.

Additional columns are added:

- Base Currency
- Currency Code
- Exchange Rate
- Retrieved Timestamp

The dataset is then cleaned by:

- Removing duplicates
- Checking missing values
- Validating exchange rates
- Formatting timestamps
- Reordering columns

---

### Phase 3 — Load

The cleaned DataFrame is loaded directly into PostgreSQL using SQLAlchemy.

The pipeline verifies that:

- Database connection succeeds
- Table is created
- All rows are successfully inserted

---

## Database Schema

| Column | Data Type |
|----------|-------------------------|
| base_currency | TEXT |
| currency_code | TEXT |
| exchange_rate | DOUBLE PRECISION |
| retrieved_at | TIMESTAMP WITH TIME ZONE |

---

## Data Validation

The pipeline performs several quality checks before loading:

- Missing values
- Duplicate records
- Invalid exchange rates
- Incorrect currency codes
- Empty datasets

These validations ensure only clean data is loaded into PostgreSQL.

---

## Environment Variables

Create a `.env` file in the project root.

```env
DB_USER=postgres
DB_PASSWORD=your_password
DB_HOST=localhost
DB_PORT=5432
DB_NAME=fintrack_exchange_db
```

---

## Installation

Clone the repository.

```bash
git clone https://github.com/yourusername/fintrack-exchange-api-pipeline.git
```

Navigate into the project.

```bash
cd fintrack-exchange-api-pipeline
```

Create a virtual environment.

```bash
python -m venv venv
```

Activate the environment.

Windows

```bash
venv\Scripts\activate
```

Linux / macOS

```bash
source venv/bin/activate
```

Install dependencies.

```bash
pip install -r requirements.txt
```

---

## Running the Pipeline

Run the reusable ETL pipeline.

```bash
python src/api_pipeline.py
```

Or explore the project interactively using:

```
notebooks/fintrack_api_pipeline.ipynb
```

---

## Sample Output

```
Extracting exchange-rate data...

Saving raw JSON...

Transforming data...

Validating data...

Saving cleaned CSV...

Connecting to PostgreSQL...

Loading data...

Verifying database load...

Pipeline completed successfully.
```

---

## Example Data

| Base Currency | Currency | Exchange Rate | Retrieved At |
|---------------|----------|--------------|---------------------------|
| USD | AED | 3.6725 | 2026-07-13 00:02:31+00 |
| USD | GBP | 0.7423 | 2026-07-13 00:02:31+00 |
| USD | EUR | 0.8524 | 2026-07-13 00:02:31+00 |
| USD | JPY | 146.82 | 2026-07-13 00:02:31+00 |

---

## Skills Demonstrated

This project demonstrates proficiency in:

- Data Engineering
- ETL Pipeline Development
- REST APIs
- Data Cleaning
- Data Validation
- PostgreSQL
- SQLAlchemy
- Pandas
- Environment Variable Management
- Database Integration
- Python Automation

---

## Future Improvements

Potential enhancements include:

- Apache Airflow orchestration
- Docker containerization
- Logging with Python logging module
- Incremental data loading
- Historical exchange rate tracking
- Database indexing
- Automated unit testing
- GitHub Actions CI/CD
- Cloud deployment (AWS or GCP)
- Data visualization dashboard

---

## Learning Outcomes

Through this project I learned how to:

- Build a complete ETL pipeline
- Consume external REST APIs
- Transform nested JSON into relational datasets
- Validate data quality before loading
- Connect Python applications to PostgreSQL
- Build reusable Data Engineering workflows
- Organize production-style Python projects

---

## Author

**Ayomikun Adaramola**

Senior Data Engineer

- LinkedIn: https://linkedin.com/in/ayomikun-adaramola
- GitHub: https://github.com/Stephen-delAyo

---

## License

This project is licensed under the MIT License.