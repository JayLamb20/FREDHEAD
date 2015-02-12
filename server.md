```{r}
## server.R

## Reference:
## This is a project prepared for the Developing Data Products MOOC from JHU on Coursera.
## Many thanks to Kyle Walker (http://walkerke.github.io/2014/10/russia-lex/), on whose work
## this project is based. 

## load up rCharts
library(rCharts)

## load the FRED data
load('freddata.rda')

## set chart option
options(RCHART_WIDTH = 800)
options(RCHART_HEIGHT = 600)

shinyServer(function(input,output) {
    
    conceptInput <- reactive({
        selected = input$concept})
        
    output$fredplot <-  renderChart2({
        
        fredplot <- hPlot(
            x = "DATE",
            y = "Lev",
            group = "CONCEPT",
            data = freddata[as.character(freddata$MAINCONCEPT) == conceptInput(),],
            type = "line",
            radius=0)
        
        if(input$concept == "Inflation"){
            fredplot$yAxis(title = list(enabled = TRUE, text = 'Annual % Change'))
            fredplot$colors(c("red", "blue", "green", "orange"))
            fredplot$legend(align="bottom", title=list(text="Inflation Measure")) 
            fredplot$title(text = "12-Month Growth in Alternative Inflation Measures")
        }
        if(input$concept == "Interest Rates"){
            fredplot$yAxis(title = list(enabled = TRUE, text = 'Annual % Change'))
            #fredplot$colors(c("red", "blue", "green"))
            fredplot$colors(c("red","green","#ffa500", "blue"))
            fredplot$legend(align="bottom", title=list(text="Interest Rates")) 
            fredplot$title(text = "Select U.S. Interest Rates")
        }
        if(input$concept == "Unemployment"){
            fredplot$yAxis(title = list(enabled = TRUE, text = 'Percentage Points'))
            fredplot$colors(c("red", "blue", "green"))
            fredplot$legend(align="bottom", title=list(text="Alternative Unemployment Measures")) 
            fredplot$title(text = "A Selection of Unemployment Measures")
        }
        if(input$concept == "Home Prices"){
            fredplot$yAxis(title = list(enabled = TRUE, text = 'Percentage Points'))
            fredplot$colors(c("red", "blue"))
            fredplot$legend(align="bottom", title=list(text="Price Index")) 
            fredplot$title(text = "Home Price Growth (y/y)")
        }
        if(input$concept == "Industrial Production"){
            fredplot$yAxis(title = list(enabled = TRUE, text = 'Index (2007=100)'))
            fredplot$colors(c("red", "blue","green", "orange", "gray", "brown", "chocolate", "blueviolet")) 
            fredplot$legend(align="bottom", title=list(text="Industrial Class")) 
            fredplot$title(text = "Select Measures of Industrial Production")
        }
            
        fredplot$xAxis(type = 'datetime', labels = list(format = '{value:%Y-%m-%d}'))
        fredplot$plotOptions(series = list(lineWidth = 1))
#         fredplot$plotOptions(series=list(marker=list(enabled='false')))
        
        return(fredplot)
    })
}) 
```