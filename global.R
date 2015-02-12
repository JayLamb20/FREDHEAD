## This is the code to download and clean the data

## set of list of series to pull
## Inflation 
##  -> CPIAUCSL = Headline CPI
##  -> CPIFESL = Core CPI
##  -> PCEPI = Headline PCE
##  -> PCEPILFE = Core PCE
##  -> UNRATE = Headline Unemployment
##  -> U6RATE = Unemployed & Underemployed
##  -> U4RATE = Unemployed & Discouraged
##  -> DFF = Fed Funds
##  -> GS10 = 10Y Treasury
##  -> DFII10 = 10Y TIPS

## Package Loadings
library(quantmod)

## set up fetch list
fetchlist <- c('CPIAUCSL', 'CPILFESL', 'PCEPI', 'PCEPILFE', 
               'UNRATE', 'U6RATE', 'U4RATE',
               'DFF', 'GS10', 'SPCS10RNSA', 'SPCS20RNSA',
               'IPNCONGD', 'IPFUELS', 'IPMINE','IPCONGD',
               'IPMAT', 'IPUTIL', 'IPDCONGD', 'IPBUSEQ',
               'TB3MS', 'TB1YR')

## Pull in Newest Data
for(i in 1:length(fetchlist)){getSymbols(fetchlist[i], src='FRED')}


## Make each concept a quarterly dataframe with date as a column

## Inflation

    df1 <- apply.quarterly(CPIAUCSL,mean)
        df1$CPIAUCSL <- round(100*((df1$CPIAUCSL/lag(df1$CPIAUCSL, k=4))-1),2) ## growth rates
            df1 <- data.frame(df1)
        df1$DATE <- as.numeric(strptime(row.names(df1), format = "%Y-%m-%d"))*1000
        df1$Concept <- "Headline CPI (CPIAUCSL)"; names(df1) <- c("Lev","DATE", "CONCEPT")
    
    df2 <- apply.quarterly(CPILFESL,mean)
        df2$CPILFESL <- round(100*((df2$CPILFESL/lag(df2$CPILFESL, k=4))-1),2) ## growth rates
            df2 <- data.frame(df2)
        df2$DATE <- as.numeric(strptime(row.names(df2), format = "%Y-%m-%d"))*1000
        df2$Concept <- "Core CPI (CPILFESL)"; names(df2) <- c("Lev","DATE", "CONCEPT")
    
    df3 <- apply.quarterly(PCEPI,mean)
        df3$PCEPI <- round(100*((df3$PCEPI/lag(df3$PCEPI, k=4))-1),2) ## growth rates
            df3 <- data.frame(df3)
        df3$DATE <- as.numeric(strptime(row.names(df3), format = "%Y-%m-%d"))*1000
        df3$Concept <- "Headline PCE (PCEPI)"; names(df3) <- c("Lev","DATE", "CONCEPT")
    
    df4 <- apply.quarterly(PCEPILFE,mean)
        df4$PCEPILFE <- round(100*((df4$PCEPILFE/lag(df4$PCEPILFE, k=4))-1),2) ## growth rates
            df4 <- data.frame(df4)
        df4$DATE <- as.numeric(strptime(row.names(df4), format = "%Y-%m-%d"))*1000
        df4$Concept <- "Core PCE (PCEPILFE)"; names(df4) <- c("Lev","DATE", "CONCEPT")
    
    INFLATION <- rbind(df1, df2, df3, df4)
        INFLATION$CONCEPT <- as.factor(INFLATION$CONCEPT)
        INFLATION$MAINCONCEPT <- "Inflation"

    rm(df1);rm(df2);rm(df3);rm(df4);

## Unemployment

    df1 <- apply.quarterly(UNRATE,mean) 
            df1 <- data.frame(df1)
        df1$UNRATE <- round(df1$UNRATE,2)
        df1$DATE <- as.numeric(strptime(row.names(df1), format = "%Y-%m-%d"))*1000
        df1$Concept <- "Headline Unemployment Rate (UNRATE)"; names(df1) <- c("Lev","DATE", "CONCEPT")
    
    df2 <- apply.quarterly(U4RATE,mean)
            df2 <- data.frame(df2)
        df2$U4RATE <- round(df2$U4RATE,2)
        df2$DATE <- as.numeric(strptime(row.names(df2), format = "%Y-%m-%d"))*1000        
        df2$Concept <- "Unemployed & Discouraged (U4RATE)"; names(df2) <- c("Lev","DATE", "CONCEPT")
    
    df3 <- apply.quarterly(U6RATE,mean)
            df3 <- data.frame(df3)
        df3$U6RATE <- round(df3$U6RATE,2)
        df3$DATE <- as.numeric(strptime(row.names(df3), format = "%Y-%m-%d"))*1000        
        df3$Concept <- "Unemployed & Underemployed (U6RATE)"; names(df3) <- c("Lev","DATE", "CONCEPT")

    UNEMP <- rbind(df1, df2, df3)
        UNEMP$CONCEPT <- as.factor(UNEMP$CONCEPT)
        UNEMP$MAINCONCEPT <- "Unemployment"

    rm(df1);rm(df2);rm(df3);

## Interest Rates

    df1 <- apply.quarterly(DFF,mean)
            df1 <- data.frame(df1)
        df1$DFF <- round(df1$DFF,2)
        df1$DATE <- as.numeric(strptime(row.names(df1), format = "%Y-%m-%d"))*1000
        df1$Concept <- "Effective Fed Funds (DFF)"; names(df1) <- c("Lev","DATE", "CONCEPT")
    
    df2 <- apply.quarterly(GS10,mean)
            df2 <- data.frame(df2)
        df2$GS10 <- round(df2$GS10,2)
        df2$DATE <- as.numeric(strptime(row.names(df2), format = "%Y-%m-%d"))*1000
        df2$Concept <- "10Y Treasury (GS10)"; names(df2) <- c("Lev","DATE", "CONCEPT")

    df3 <- apply.quarterly(TB1YR,mean)
        df3 <- data.frame(df3)
    df3$TB1YR <- round(df3$TB1YR,2)
    df3$DATE <- as.numeric(strptime(row.names(df3), format = "%Y-%m-%d"))*1000
    df3$Concept <- "1-Year Treasury (TB1YR)"; names(df3) <- c("Lev","DATE", "CONCEPT")
    
    
    df4 <- apply.quarterly(TB3MS,mean)
        df4 <- data.frame(df4)
    df4$TB3MS <- round(df4$TB3MS,2)
    df4$DATE <- as.numeric(strptime(row.names(df4), format = "%Y-%m-%d"))*1000
    df4$Concept <- "3-Month Treasury (TB3MS)"; names(df4) <- c("Lev","DATE", "CONCEPT")

    ## find a third interest rate
    
    INTRATES <- rbind(df1, df2, df3, df4)
        INTRATES$CONCEPT <- as.factor(INTRATES$CONCEPT)
        INTRATES$MAINCONCEPT <- "Interest Rates"

    rm(df1); rm(df2);

## Home Prices

    df1 <- apply.quarterly(SPCS10RNSA,mean)
        df1$SPCS10RNSA <- round(100*((df1$SPCS10RNSA/lag(df1$SPCS10RNSA, k=4))-1),2) ## growth rates
        df1 <- data.frame(df1)
        df1$DATE <- as.numeric(strptime(row.names(df1), format = "%Y-%m-%d"))*1000
        df1$Concept <- "Case-Shiller Price Index (10-City)"; names(df1) <- c("Lev","DATE", "CONCEPT")

    df2 <- apply.quarterly(SPCS20RNSA,mean)
        df2$SPCS20RNSA <- round(100*((df2$SPCS20RNSA/lag(df2$SPCS20RNSA, k=4))-1),2) ## growth rates
            df2 <- data.frame(df2)
        df2$DATE <- as.numeric(strptime(row.names(df2), format = "%Y-%m-%d"))*1000
        df2$Concept <- "Case-Shiller Price Index (20-City)"; names(df2) <- c("Lev","DATE", "CONCEPT")

    HOMEPRICE <- rbind(df1, df2)
        HOMEPRICE$CONCEPT <- as.factor(HOMEPRICE$CONCEPT)
        HOMEPRICE$MAINCONCEPT <- "Home Prices"

    rm(df1);rm(df2);

## Industrial Production

    df1 <- apply.quarterly(IPNCONGD,mean)
        df1 <- data.frame(df1)
    df1$IPNCONGD <- round(df1$IPNCONGD,2)
    df1$DATE <- as.numeric(strptime(row.names(df1), format = "%Y-%m-%d"))*1000
    df1$Concept <- "Nondurable Consumer Goods (IPNCONGD)"; names(df1) <- c("Lev","DATE", "CONCEPT")

    df2 <- apply.quarterly(IPFUELS,mean)
        df2 <- data.frame(df2)
    df2$IPFUELS <- round(df2$IPFUELS,2)
    df2$DATE <- as.numeric(strptime(row.names(df2), format = "%Y-%m-%d"))*1000
    df2$Concept <- "Fuels (IPFUELS)"; names(df2) <- c("Lev","DATE", "CONCEPT")
    
    df3 <- apply.quarterly(IPMINE,mean)
        df3 <- data.frame(df3)
    df3$IPMINE <- round(df3$IPMINE,2)
    df3$DATE <- as.numeric(strptime(row.names(df3), format = "%Y-%m-%d"))*1000
    df3$Concept <- "Mining (IPMINE)"; names(df3) <- c("Lev","DATE", "CONCEPT")
    
    df4 <- apply.quarterly(IPCONGD,mean)
        df4 <- data.frame(df4)
    df4$IPCONGD <- round(df4$IPCONGD,2)
    df4$DATE <- as.numeric(strptime(row.names(df4), format = "%Y-%m-%d"))*1000
    df4$Concept <- "Consumer Goods (IPCONGD)"; names(df4) <- c("Lev","DATE", "CONCEPT")
    
    df5 <- apply.quarterly(IPMAT,mean)
        df5 <- data.frame(df5)
    df5$IPMAT <- round(df5$IPMAT,2)
    df5$DATE <- as.numeric(strptime(row.names(df5), format = "%Y-%m-%d"))*1000
    df5$Concept <- "Materials (IPMAT)"; names(df5) <- c("Lev","DATE", "CONCEPT")
    
    df6 <- apply.quarterly(IPUTIL,mean)
        df6 <- data.frame(df6)
    df6$IPUTIL <- round(df6$IPUTIL,2)
    df6$DATE <- as.numeric(strptime(row.names(df6), format = "%Y-%m-%d"))*1000
    df6$Concept <- "Electric and Gas Utilities (IPUTIL)"; names(df6) <- c("Lev","DATE", "CONCEPT")
    
    df7 <- apply.quarterly(IPDCONGD,mean)
        df7 <- data.frame(df7)
    df7$IPDCONGD <- round(df7$IPDCONGD,2)
    df7$DATE <- as.numeric(strptime(row.names(df7), format = "%Y-%m-%d"))*1000
    df7$Concept <- "Durable Consumer Goods (IPDCONGD)"; names(df7) <- c("Lev","DATE", "CONCEPT")
    
    df8 <- apply.quarterly(IPBUSEQ,mean)
        df8 <- data.frame(df8)
    df8$IPBUSEQ <- round(df8$IPBUSEQ,2)
    df8$DATE <- as.numeric(strptime(row.names(df8), format = "%Y-%m-%d"))*1000
    df8$Concept <- "Business Equipment (IPBUSEQ)"; names(df8) <- c("Lev","DATE", "CONCEPT")

    INDPROD <- rbind(df1, df2,df3,df4,df5,df6,df7,df8)
        INDPROD$CONCEPT <- as.factor(INDPROD$CONCEPT)
        INDPROD$MAINCONCEPT <- "Industrial Production"

    rm(df1);rm(df2);rm(df3);rm(df4);rm(df5);rm(df6);rm(df7);rm(df8);

## Final data set
freddata <- rbind(INFLATION, UNEMP, INTRATES, HOMEPRICE, INDPROD)

    cutoff <- "1990-01-01"
    freddata <- freddata[freddata$DATE >= (as.numeric(strptime(cutoff, format = "%Y-%m-%d"))*1000),]
    freddata$MAINCONCEPT <- as.factor(freddata$MAINCONCEPT)
    freddata$Lev <- as.numeric(freddata$Lev)

## write out to rda
save(freddata, file="freddata.rda")