import sqlite3
import pandas as pd

# 1. Connect to the database (it creates it if it doesn't exist)
conn = sqlite3.connect('healthcare.db')
cursor = conn.cursor()

# 2. Load the CSV file into a Pandas DataFrame
# Make sure the CSV filename matches EXACTLY what is in your folder
try:
    df = pd.read_csv('data/KaggleV2-May-2016.csv')
    
    # 3. Clean column names (remove spaces/dashes for SQL compatibility)
    df.columns = df.columns.str.replace('-', '_').str.replace(' ', '_')
    
    # 4. Write the data to SQL
    # 'replace' means it will drop the old empty table and make a fresh one
    df.to_sql('appointments', conn, if_exists='replace', index=False)
    
    print(f"Success! Imported {len(df)} rows into 'appointments' table.")

except Exception as e:
    print(f"Error: {e}")

# 5. Close connection
conn.close()