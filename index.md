# Visualizing Bitcoin Price Trends with Pandas and Matplotlib
 
**Introduction:**<br><br>
What is the problem? Why it matters?<br>
Bitcoin prices change a lot from day to day. These frequent fluctuations make it difficult to know if a movement is an indicator of a trend or just market noise. <br>
In addition to that, CSVs from finance sites often come with inconsistent formatting, missing values, or even unnecessary columns.
Without statistic tools to standardize, clean, and visualize the data, it's hard to separate long-term market trends from random fluctuations.
Solving this problem allows for more meaningful analysis and gives clear insights into Bitcoin's behavior. <br><br>
**Steps:**<br><br>
Step 1: Load the Data<br>
We'll start by loading a CSV of Bitcoin prices. You can use Yahoo Finance, if you have an account, investing.com, or any other site with historical Bicoin data. 
You can select the time window that you want the data for. I did 5 years, but you can choose exact dates as well. Save it as Bitcoin.csv. 
Make sure to import pandas for this step and matplotlib (we will be using matplotlib later, but it is a good idea to do all imports at the top of your file).<br>
You can download your data [here](https://www.investing.com/crypto/bitcoin/historical-data)
```python
import pandas as pd
import matplotlib.pyplot as plt

# Load Bitcoin csv with date parsing
data = pd.read_csv("bitcoin.csv", parse_dates=["Date"])
data.head()
```
<br>Step 2: Clean and Prepare<br>
It is common for raw data to have missing values or noise.
In this step we will drop missing values, remove commas in the pricing dollar amount, and convert the numbers into floats so they are not read as strings.<br>
Then, we will add a 90-day moving average column to be able to establish a more clear trend. <br>
You could choose a different time window for the moving average, depending on what you are trying to showcase: 30 days to represent months or 180 days to represent half a year. The shorter the time window, the more detail the line will show, the longer the time window, the less detail the line will show, but the better bigger-picture.<br>
For this dataset I found 90 days will give a more clear picture of trends while ignoring small fluctuations.
```python
# Keep only necessary columns
data = data[["Date", "Price"]]

# Remove commas and convert Price to float
data["Price"] = data["Price"].str.replace(",", "").astype(float)

# Drop missing values
data = data.dropna()

# Add a 90 day moving average
data["MovingAverage"] = data["Price"].rolling(window=90).mean()
```
<br>Step 3: Plot the Closing Price<br>
Now that the data is cleaned, we will visualize the raw daily Bitcoin prices at market close over time(5 years for this dataset).
This is where we will be using matplotlib that we imported earlier.<br>
```python
plt.figure(figsize=(12, 6))
plt.plot(data["Date"], data["Price"], label="Price", color="blue")
plt.title("Bitcoin Price Over Time")
plt.xlabel("Date")
plt.ylabel("Price (USD)")
plt.legend()
plt.show()
```
![Daily Bitcoin Prices](https://github.com/user-attachments/assets/6ad92975-f8a6-4b64-9e4e-855ab141d210 "Daily Bitcoin Prices")

This plot shows daily closing price of Bitcoin. With how frequent the price changes, there are a lot of sharp changes in the graph. This indicates that although Bitcoin has an overall increase throughout the 5 years, it is volatile.
Although we are able to see the overall trend, it is more difficult to tell what is happening in the big picture.. <br><br>
<br>Step 4: Plot the 90-day moving average<br>
In order to make the trends easier to see, we will overlay the 90-day moving average we found earlier. This smooths the noise in the short-term movements.<br>
```python
plt.figure(figsize=(12, 6))
plt.plot(data["Date"], data["Price"], label="Price", color="blue")
plt.plot(data["Date"], data["MovingAverage"], label="90-day Moving Average", color="red")
plt.title("Bitcoin Price with 90-day Moving Average")
plt.xlabel("Date")
plt.ylabel("Price (USD)")
plt.legend()
plt.show()
```
![Bitcoin Price with 90-day Moving Average](https://github.com/user-attachments/assets/3412352d-ad68-4e95-8cb2-2e0d79f61554 "Bitcoin Price with 90-day Moving Average")

You can now compare the smooth 90-day average(red) to the daily closing price(blue) to see more clearly what is going on.







