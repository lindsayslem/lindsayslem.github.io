---
title: "Does Brighton or Snowbird get more snow?"
format:
  html:
    toc: true
    theme: cosmo
---

## Introduction

Living in Utah means that having something to do in the winter is essential. For many people, that activity is skiing or snowboarding, but it could be difficult to decide which resort you are going to get the most snow at. For this post, I wanted to discover which resort would be better to get a season pass to, based solely on the amount of snow they get. 
**Over the last ten seasons, did Brighton or Snowbird have better snow?**

To answer this, I extracted historical weather data from Open-Meteo's Historical Weather API
for both resorts (making sure to pick two resorts in different canyons) and narrowed down the data to winter months from 2015-2025.

I determined that this was ethical data usage because the source encourages use and citation of their API to encourage collaboration in the scientific community.

## Data Acquisition

I used Open-Meteo archive endpoint. With this endpoint you are able to request daily and hourly weather variables from a specific latitude and longitude. 

For each resort I converted hourly snow_depth to daily max snow depth (hourly snow depth was the only option for snow depth), I merged that with the daily dates, then I filtered to winter months, and labeled each row with the resort name. 

I defined season as the year of November-April so November 2015 - April 2016 is the 2015 season.

Then, I looked at days with 6 or more inches of snow and defined them as powder days. Since the API provides snowfall in inches, it was pretty straightforward.
Snowfall per season was next where I took the sum of the seasons' snowfalls.
Finally I looked at monthly snowfall averages between the two resorts.

The full Python code used to aquire and clean the data is here:

https://github.com/lindsayslem/Snow-comparison

## EDA

![Total Powder Days](total_powder_days.png)

From this, we can see that Brighton has had more total powder days in the last 10 years.

![Total Snowfall per Season](total_snowfall_per_season.png)

This graph depicts that over the last 10 years, Brighton has had more total seasonal snowfall than Snowbird.

![Average Monthly Snowfall](average_monthly_snowfall.png)

Once again the graph shows that Brighton also has a higher average monthly snowfall.

I found it interesting that Brighton was higher than Snowbird in all categories. 

## Conclusion

Based on the 10 winters of historical weather data, Brighton consistently ourperformed Snowbird in all categories. Although Snowbird is known for steeper terrain and spring riding, Brighton objectively gets more snow on average, making it the better choise if snowfal is the deciding factor for a season pass.


## Links

https://open-meteo.com/en/docs/historical-weather-api?latitude=40.5984&longitude=-111.5838&timezone=America%2FDenver&start_date=2015-11-07&hourly=snow_depth&daily=temperature_2m_mean,snowfall_sum,precipitation_sum,wind_speed_10m_max&temperature_unit=fahrenheit&wind_speed_unit=mph&precipitation_unit=inch

https://github.com/lindsayslem/Snow-comparison
