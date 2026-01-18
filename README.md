# Olist E-Commerce SQL Analysis

## Project Overview
This project explores the Olist Brazilian e-commerce dataset with the goal of understanding order pricing and delivery cost dynamics across different regions.

The analysis focuses on how logistics costs relate to order value and whether certain regions face disproportionately high delivery costs.

## Dataset
The dataset is publicly available on Kaggle:
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

It contains information about orders, customers, products, prices, and delivery costs.

## Analytical Approach
The analysis follows a structured, analyst-style workflow:

1. Data exploration to understand table structure and key fields  
2. Data quality checks to identify broken or inconsistent records  
3. Order-level metric calculation (item value, delivery cost, number of items)  
4. Regional analysis of delivery costs relative to order value  

SQL Common Table Expressions (CTEs) are used to keep the logic readable and modular.

## Key Findings
- Delivery cost ratios vary significantly across Brazilian states
- In states such as RR and MA, delivery costs account for over 25% of the average order value
- Several northern regions (e.g. RO, AM, AC) show consistently high delivery cost ratios above 22%
- The average order price in these regions is not unusually low, indicating that logistics costs, rather than pricing, drive the high ratios
- These regions may benefit from logistics optimization or region-specific pricing strategies

## Tools Used
- SQL (PostgreSQL syntax)
- Kaggle dataset
