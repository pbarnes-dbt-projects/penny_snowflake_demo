WITH input_model_1 AS (
  SELECT
    *
  FROM {{ ref('fct_orders') }}
), simple_aggregation AS (
  SELECT
    CLERK_NAME,
    COUNT(ORDER_KEY) AS TOTAL_ORDERS,
    SUM(NET_ITEM_SALES_AMOUNT) AS SUM_SALES,
    AVG(NET_ITEM_SALES_AMOUNT) AS AVG_SALES
  FROM input_model_1
  GROUP BY
    CLERK_NAME
), clerk_agg_sql AS (
  SELECT
    *
  FROM simple_aggregation
)
SELECT
  *
FROM clerk_agg_sql