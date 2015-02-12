---
title       : FRED-HEAD
subtitle    : A Simple Dashboard for St. Louis Federal Reserve Data
author      : James Lamb
job         : 
framework   : io2012  # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap]            # {mathjax, quiz}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
--- 

{bg: Lavender}

## What is FRED-HEAD?

- Basic Idea
    - An interactive dashboard for data from the St. Louis Federal Reserve's FRED &#174; database
    
<img src="http://raw.githubusercontent.com/JayLamb20/FREDHEAD/gh-pages/pitch_slides/assets/img/screencap1.PNG" height="500" width="900">

---

## How Does it Work?

- Step 1: Fetch data from FRED &#174; databse
    - This step uses the *getSymbols()* function in the ```quantmod``` package
- Step 2: Create "long" dataset, date in POSIXct*1000 ([HighCharts from rCharts expects this](http://bl.ocks.org/ramnathv/9301903)), and two factors (CONCEPT for graphing, MAINCONCEPT for subsetting)


```
##             Lev         DATE                 CONCEPT MAINCONCEPT
## 1990-03-01 5.23 636267600000 Headline CPI (CPIAUCSL)   Inflation
## 1990-06-01 4.58 644212800000 Headline CPI (CPIAUCSL)   Inflation
## 1990-09-01 5.56 652161600000 Headline CPI (CPIAUCSL)   Inflation
## 1990-12-01 6.28 660027600000 Headline CPI (CPIAUCSL)   Inflation
## 1991-03-01 5.26 667803600000 Headline CPI (CPIAUCSL)   Inflation
```
- Step 3: Take user-defined input for "MAINCONCEPT" from a UI drop-down
- Step 4: Plot a Highcharts time-series line graph of all the series belonging to that main concept.
    - Note that the plot is reactive to the use input, and has nice hover-over data display.

--- 

## Why Should I Care?

- FRED-HEAD offers a simple solution for viewing the most recent macroeconomic indicators from the St. Louis Federal Reserve's [FRED database](http://research.stlouisfed.org/)
- FRED's built-in [visualization tools](http://research.stlouisfed.org/fred2/graph/?utm_source=research&utm_medium=website&utm_campaign=data-tools) are great, but setting up your own multiseries graphs on their site takes a bit of effort
- This application offers easy, interactive access to the newest FRED data.
- Current FRED-HEAD offering:
    - Inflation
    - Unemployment
    - Interest Rates (Federal Debt)
    - Home Prices
    - Industrial Production

---

## Future Developments

- I would very much like to continue developing this app even after the Developing Data Products course ends. A few potential ideas for improvement:
    - Add a "download data" page with reactive table output and ability to download datasets in csv format
    - Create a page with streaming Federal Reserve content (Twitter, videos of governor speeches, relevant news)
    - Add a page for FRED's state-level data using some of the more interesting features in rCharts and googleVis, like mapping and motion charts
- Have additional suggestions? Questions?
    - LinkedIn: www.linkedin.com/in/jameslamb1
    - email: jaylamb20@gmail.com
    - GitHub: https://github.com/JayLamb20/FREDHEAD
