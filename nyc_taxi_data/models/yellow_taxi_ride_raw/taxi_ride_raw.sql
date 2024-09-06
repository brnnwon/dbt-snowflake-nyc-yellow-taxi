{{ config(materialized='view') }}

{% set months = range(1, 7) %}  {# Loop through all 12 months #}
{% set file_path_base = 'E:/dbt-snowflake-proj/data/yellow_tripdata_2024-' %}

WITH yellow_taxi_data AS (
    {% for month in months %}
        {% set padded_month = "{:02}".format(month) %}  {# Add leading zero for single-digit months #}
        SELECT *
        FROM read_parquet('{{ file_path_base }}{{ padded_month }}.parquet')

        {% if not loop.last %}
            UNION ALL
        {% endif %}
    {% endfor %}
)
SELECT *
FROM yellow_taxi_data