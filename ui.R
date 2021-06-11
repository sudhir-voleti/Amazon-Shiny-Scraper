
shinyUI(fluidPage(
  
  title = "Amazon Reviews Scraper",
  titlePanel(title=div(img(src="logo.png",align='right'),"Amazon Reviews Scraper")),
  sidebarPanel(
    conditionalPanel(condition="input.tabselected==1",
                     textInput("base_url","Enter Base URL"),
                     # selectInput("sel_base",
                     #             "Select website",
                     #             choices = list("Amazon.com"="az_com",
                     #                            "Amazon.in"="az_in")),
                     numericInput("n_pgs","No of pages to scrape",
                                  min = 1,
                                  max=10,
                                  value = 1),
                     actionButton("scrape","Scrape")
    )
    
  ),
  mainPanel(
    # recommend review the syntax for tabsetPanel() & tabPanel() for better understanding
    # id argument is important in the tabsetPanel()
    # value argument is important in the tabPanle()
    tabsetPanel(
      tabPanel("Overview", value=1, 
               includeMarkdown("overview.md")
      ),
      tabPanel("Scraped Data", value=1,
               h5("Scraped Data Summary"),
               verbatimTextOutput("sc_sum"),
               hr(),
               h5("Download"),
               downloadButton("dwnld"),
               hr(),
               h5("Sample Scraped Data"),
               DT::dataTableOutput("ssd")
               
      ),
      id = "tabselected"
    )
  )
))
