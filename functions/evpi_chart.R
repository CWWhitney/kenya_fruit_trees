# function for evpi chart ####

evpi_chart <- function(evpi_data){
  evpi_data %>%
    ggcharts::bar_chart(evpi_term, evpi_value, bar_color = "#E69F00", 
                        alpha = I(2/3),) +
    geom_text(aes(label = scales::comma(evpi_value)), size = 3, hjust = 1)  + #scales::label_comma()
    theme_minimal() + 
    theme(plot.margin=grid::unit(c(0,0,0,0), "mm")) +
    theme(axis.title.y=element_blank()) + 
    theme(axis.title.x=element_blank(),
          axis.ticks.x = element_blank(),
          axis.text.x = element_blank()) }
