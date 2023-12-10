# Analyzing Tokopaedi Trend With Advanced SQL

Introduction:

In the dynamic landscape of Tokopaedi's database querying, the strategic utilization of aggregate functions serves as a linchpin for extracting valuable insights. These functions stand as pillars of data analysis, offering the ability to distill meaningful information from the vast sea of raw data. Before delving into the intricacies of these functions and their application, let's embark on a journey to understand the quintessence of each aggregate function: count, sum, avg, min, and max.

1. **Count:**
   - **Purpose:** Count provides a numerical tally, revealing the quantity of rows in a specified dataset.
   - **Example:**
     ```sql
     -- Counting the total number of products in the inventory
     SELECT COUNT(*) AS total_products
     FROM products;
     ```

2. **Sum:**
   - **Purpose:** Summation aggregates numeric values, offering insights into cumulative totals.
   - **Example:**
     ```sql
     -- Calculating the total sales revenue for a specific period
     SELECT SUM(sales_amount) AS total_revenue
     FROM sales
     WHERE sale_date BETWEEN '2023-01-01' AND '2023-12-31';
     ```

3. **Avg (Average):**
   - **Purpose:** Average computes the arithmetic mean, providing a central tendency measure for numeric data.
   - **Example:**
     ```sql
     -- Calculating the average rating of products based on customer reviews
     SELECT AVG(product_rating) AS average_rating
     FROM product_reviews;
     ```

4. **Min (Minimum):**
   - **Purpose:** Min identifies the smallest value in a dataset, aiding in the discovery of the lowest data point.
   - **Example:**
     ```sql
     -- Finding the minimum price of products in the catalog
     SELECT MIN(product_price) AS minimum_price
     FROM products;
     ```

5. **Max (Maximum):**
   - **Purpose:** Max unveils the largest value in a dataset, facilitating the identification of the highest data point.
   - **Example:**
     ```sql
     -- Identifying the maximum quantity of a particular product in stock
     SELECT MAX(stock_quantity) AS maximum_quantity
     FROM inventory
     WHERE product_id = 'your_product_id';
     ```

These aggregate functions, when judiciously employed, become indispensable tools in crafting potent queries to extract meaningful patterns and statistics from the Tokopaedi database. Now, let's delve into each function's nuances and explore their practical applications for robust data analysis. Here are 5 insights needed by applying existing advanced clauses to SQL queries:
1. What products are the best selling (based on the quantity sold)?
   - Screenshot
     ![Alt Text](https://github.com/LYRA0794/Analyzing-Tokopaedi-Trend-With-Advanced-SQL/blob/main/Outputs/1.png)
   - Analysis: Based on the results of the query that has been carried out, it is found that the product that best selling is Staples.
2. You want to give a promo to 100 individual consumers (segment = 'Consumer') with the highest order value. Make a list of these consumers!
   - Screenshot
     ![Alt Text](https://github.com/LYRA0794/Analyzing-Tokopaedi-Trend-With-Advanced-SQL/blob/main/Outputs/2.png)
   - Analysis: Based on the results of the query that has been carried out, it is found the list of the customers that will get promo.
3. A consumer named Joel Eaton asked for a transaction record containing what products were purchased and their quantity while he was a Tokopaedi customer. Make the data summary!
   - Screenshot
     ![Alt Text](https://github.com/LYRA0794/Analyzing-Tokopaedi-Trend-With-Advanced-SQL/blob/main/Outputs/3.png)
   - Analysis: Joel Eaton's transaction record reveals a snapshot of his purchases as a Tokopaedi customer. The summary includes details such as the products he bought and their respective quantities. This overview offers a quick glance at Joel's buying preferences and provides a clear picture of his interaction with Tokopaedi's offerings.
4. On what date did Tokopaedi receive the most orders?
   - Screenshot
     ![Alt Text](https://github.com/LYRA0794/Analyzing-Tokopaedi-Trend-With-Advanced-SQL/blob/main/Outputs/4.png)
   - Analysis: Tokopaedi experienced its peak in orders on September 5, 2016, with a remarkable total of 38 transactions. This date marks the pinnacle of order activity, showcasing a significant demand for products and services on that particular day.
5. Which product has the highest average profit per unit sold?
   - Screenshot
     ![Alt Text](https://github.com/LYRA0794/Analyzing-Tokopaedi-Trend-With-Advanced-SQL/blob/main/Outputs/5.png)
   - Analysis: The product that stands out with the highest average profit per unit sold is the Canon imageCLASS 2200 Advanced Copier. This indicates that, on average, each sale of this product contributes the most to the overall profit, making it a key performer in terms of unit profitability.
