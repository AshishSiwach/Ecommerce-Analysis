# Ecommerce-Analysis
Ecommerce Company Data Analysis in MySQL
**Problem Statement** - The company has recently seen a decline in their sales and wants you to look into the reason for this fall in order to take appropriate steps to improve the performance. Since the company is a large one, they want to focus their time and resources on the categories that can provide them with maximum returns.
Data - The data consists of 4 dimension tables and one fact table.
## Data Dictionary
* Cust_Dimen Dataset: Customer Dataset
  Customer_Name : Name of the customer
  Province : Province of the customer
  Region : Specific region of the customer
  Customer_segment : Type of customer
  Cust_id : Unique identifier of the customer
* Orders_Dimen Dataset : Orders Dataset
  Order_ID :Order ID
  Order_Date: Date of the Order
  Order_Priority : Priority of the Order
  Ord_id : Unique Identifier of the Order
* Prod_dimen dataset : Products Dataset
  Product_Category : Category of the Product
  Product_Sub_Category : Sub Category of the Product
  Prod_id : Unique Identifier of the Product
* Shipping_dimen dataset : Shipping Dataset
  Order_ID : Order ID
  Ship_Mode : Mode of Shipping
  Ship_Date : Date when order is shipped
  Ship_id : Unique Identifier of each shipment
* Market_fact dataset : Market facts dataset
  Ord_id : Unique Identifier of the Order
  Prod_id : Unique Identifier of the Product
  Ship_id : Unique Identifier of each shipment
  Cust_id : Unique identifier of the customer
  Sales : Amount of Sales Made
  Discount : Discount Provided
  Order_Quantity ; Units of a product ordered.
  Profit : Profit on each order
  Shipping_Cost : Shipping Cost for an order
  Product_Base_Margin : Margin on each Product sold.
  
## Key Findings
1. The number of orders placed on 31-12-2011 were 5, on 31-12-2010 were 3, on 25-12-2010 were 3, on 25-12-2011 were 4. More orders were placed on both Christmas and New Year Eve in 2011 as compared to 2010.
2. Product IDs with highest average profit are are Prod_14, Prod_17 and Prod_4 in the descending order with avg profits respectively being 1923.70, 913.09 and 358.95.
3. Product IDs with least average profit are are Prod_11, Prod_10 and Prod_16 in the ascending order with avg profits respectively being -325.12, -182.32 and -54.16.
4. Regular Air and Delivery Truck are most frequent modes of shipment.
5. Highest number of customers are from the West Region while the lowest are from the NUNAVUT region.
6. Northwest Territories, Atlantic and Ontario are the regions with highest average profits with profits being 235.27, 216.35 and 194.30 respectively while Nunavut, Yukon and West are the regions with the lowest average profits with profits being 19.82, 138.04 and 144.27 respectively.
7. Cust_6, Cust_210, Cut_1584 are the customer IDs of the customers who have not made any orders.
8. There are 1137 orders with "High" Priority. Out of these 844 were shipped on the same day or the next day of the order day.
9. For the West Region, which has the highest number of customers orders with "Low" Priority is the highest whereas it is lowest for the orders with order priority "Not Specified".
10. Furniture and Technology are the product categories with highest average profit margin.
