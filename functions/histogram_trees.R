histogram_trees <- function(data_trees, data_notrees, title, width = "default"){
  
  library(ggplot2)
  
  
  # Combine the two datasets
  combined_data <- rbind(
    transform(data_trees, Scenario = "Trees_Yes"),
    transform(data_notrees, Scenario = "Trees_No")
  )
  
  # Calculate the width based on the range of Lower.Bound and Upper.Bound
  if (width == "default") {
    bin_width <- mean(diff(c(combined_data$Lower.Bound, combined_data$Upper.Bound)))
  } else {
    bin_width <- width
  }
  

  # Create a ggplot with overlaid histograms
  ggplot(combined_data, aes(x = (Lower.Bound + Upper.Bound) / 2, y = Value, fill = Scenario)) +
    geom_bar(stat = "identity", 
             alpha = 0.5, position = "identity", 
             width = bin_width) +  # Adjust the width parameter
    theme_minimal() + 
    scale_y_continuous(labels = label_number()) +
    # scale_x_continuous(labels = scales::label_number()) +
    scale_x_reverse(labels = scales::label_number()) +
    coord_flip() +
    theme(legend.position = "bottom",
          axis.title.y = element_blank(),
          axis.title.x = element_blank(),
          axis.text.x = element_text(angle = 45, hjust = 1),
          plot.title = element_text(hjust = 0),
          legend.title = element_blank()) +  # Remove legend title
    ggtitle(title) +
    labs(fill = NULL) +
    scale_fill_manual(values = c("grey", "#E69F00"))+
    ylab("Probability") 
  
  
}