#! /usr/bin/env python3
import duckdb

# Connect to the DuckDB database file
con = duckdb.connect('E:/dbt-snowflake-proj/nyc_taxi_data/dbt.duckdb', read_only=True)

# Run a SQL query to fetch all rows from the model and check the total number of recprds
    
# Query to get the toal number of records
result = con.execute('SELECT COUNT(*) AS total_rows FROM taxi_ride_raw').fetchall()
    
# Get the total of rows from the result
total_rows = result[0][0]
    
# Print the total number of rows
print(f"Total number of rows in the model: {total_rows}")

# Close the DuckDB connection
con.close()