server <- shinyServer(function(input, output,session) {
  
  
scraped_df <- eventReactive(input$scrape,{
  
  # create empty object to write data into
  reviews_all <- data.frame()
  pages <- input$n_pgs
  # loop over pages
  for(page_num in 1:pages){
    #url <- paste0(base_url,"/product-reviews/",prod_code,"/?pageNumber=", page_num)
    url <- paste0(input$base_url,"&pageNumber=",page_num)
    reviews <- scrape_amazon(url, throttle = 3)
    # reviews_all <- rbind(reviews_all, cbind(prod, reviews))
    reviews_all <- rbind(reviews_all, reviews)
  }
  
  reviews_all
})
  
  output$sc_sum <- renderPrint({
    paste0("Total ",dim(scraped_df())[1], " reviews scraped")
  })
  
  output$ssd <- DT::renderDataTable({
    scraped_df()
  })
  
  output$dwnld <- downloadHandler(
    filename = function() { "scraped_reviews.csv" },
    content = function(file) {
      write.csv(scraped_df(), file,row.names = FALSE)
    }
  )
  
})