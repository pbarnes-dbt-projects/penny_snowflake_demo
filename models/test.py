import pandas as pd
from datetime import datetime

def model(dbt, session):
    dbt.config(
        python_version="3.9",
        packages=['pandas'],
        materialized="table",
        tags="validation"
    )

    table_details = pd.DataFrame({
        'MODEL_TYPE': ['python model'],
        'MODEL_NAME': ['snowflake_connection_check'],
        'schema': ['ml_feature_space'],
        'NOTES': ['validating the python model to test the snowflake connection'],
        'OTF_CREATED_DATE_TS': [datetime.now()],  
        'OTF_CREATED_UTC_DATE_TS': [datetime.utcnow()],
    })

    return table_details