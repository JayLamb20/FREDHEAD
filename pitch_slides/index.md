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
    
<img src=".\\assets\\img\\screencap1.png" height="400" width="900">

---

## How Does it Work?

- Step 1: Fetch data from FRED &#174; databse
    - This step uses the *getSymbols()* function in the ```quantmod``` package
- Step 2: Create "long" dataset, date in POSIXct*1000 ([HighCharts from rCharts expects this](http://bl.ocks.org/ramnathv/9301903)), and two factors (CONCEPT for graphing, MAINCONCEPT for subsetting)



