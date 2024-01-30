source(file = "functions/density_estimate.R")

# provides a kernel density estimate for the combined data.

density_plot <- function(data_trees, data_no_trees, sufficient, title){

trees <- density_estimate(data_trees)
no_trees <- density_estimate(data_no_trees)

library(ggplot2)

# Create data frames for density estimates
data_trees <- data.frame(x = trees$x, y = trees$y, Type = "Trees")
data_no_trees <- data.frame(x = no_trees$x, y = no_trees$y, Type = "No Trees")

# Combine the two data frames
combined_data <- rbind(data_trees, data_no_trees)


# Create a ggplot with two lines
ggplot(combined_data, aes(x = x, y = y, color = Type)) +
  geom_line() +
  geom_point(data = data.frame(x = sufficient, y = 0), 
             color = "black", size = 2) +  # Add grey point
  theme_minimal() +
  theme(legend.position = "bottom",  
        axis.ticks.y = element_blank(),  
       # axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        plot.title = element_text(hjust = 0),
        legend.title = element_blank()) +  
  labs(y = title) +
  scale_color_manual(values = c("grey", "#E69F00"))  # Customize line colors

}
