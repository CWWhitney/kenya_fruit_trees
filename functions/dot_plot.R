# Overall plot
# Load libraries ####
library(dplyr)
library(ggcharts)
library(ggplot2)
library(patchwork)
library(magrittr)
library(scales)

# define a color pallette
subdued_palette <- c("#4E79A7", "#F28E2B", "#E15759", "#76B7B2")

# Plot for the summary statistics

# Create a dot plot with labels
# Create a dot plot with labels
# Create a dot plot with labels
# Create a dot plot with colored points and a legend
dot_plot <- function(data, name, title){
  dat <- data %>% dplyr::select(measure, starts_with(name))
  dat_long <- tidyr::gather(dat, key = "ind", value = "values", -measure)
  ggplot(dat_long, 
         aes(x = ind, 
             y = values, 
             color = measure)) + # use color for different measures
    geom_point(size = 3) +
    geom_hline(aes(yintercept=0), 
               lty = "dotted", color= "dark grey", size=1) +
    scale_y_continuous(trans = "reverse", labels = scales::label_comma()) + # change ticks
    scale_color_manual(values = subdued_palette) + 
    theme_minimal() + # remove background
    theme(legend.position = "bottom") + # place the legend at the bottom
    theme(axis.title.y = element_blank()) + # remove y-axis title
    # Rotate x-axis labels by 45 degrees 
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    theme(plot.margin = grid::unit(c(0,0,10,0), "mm")) + # adjust bottom margin for the legend
    ggtitle(title) + # unique titles
    theme(plot.title = element_text(hjust = 0)) +
    labs(color = "") # add a legend title
}

