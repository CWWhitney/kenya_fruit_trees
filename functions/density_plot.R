source(file = "functions/density_estimate.R")

# provides a kernel density estimate for the combined data.

density_plot <- function(data_trees, data_no_trees, title){

trees <- density_estimate(data_trees)
no_trees <- density_estimate(data_no_trees)

library(ggplot2)

# Create data frames for density estimates
data_trees <- data.frame(x = trees$x, y = trees$y, Type = "Trees")
data_no_trees <- data.frame(x = no_trees$x, y = no_trees$y, Type = "No Trees")

# Combine the two data frames
combined_data <- rbind(data_trees, data_no_trees)

# Create a ggplot with two lines
# Create a ggplot with colored lines and remove legend title
ggplot(combined_data, aes(x = x, y = y, color = Type)) +
  geom_line() +
  theme_minimal() +
  scale_y_continuous(labels = label_number()) +
  scale_x_continuous(labels = scales::label_number()) +
  coord_flip() +
  theme(legend.position = "bottom",
        axis.title.y = element_blank(),
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1),
        plot.title = element_text(hjust = 0),
        legend.title = element_blank()) +  # Remove legend title
  ggtitle(title) +
  labs(fill = NULL) +
  scale_color_manual(values = c("grey", "#E69F00"))  # Customize line colors

}
