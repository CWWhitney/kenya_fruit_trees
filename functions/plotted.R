# Overall plot
# Load libraries ####
library(dplyr)
library(ggcharts)
library(ggplot2)
library(patchwork)
library(magrittr)
library(scales)

# function to plot overall  ####
plotted <- function(data, name, title){
  dat <- data %>% dplyr::select(starts_with(name))
  ggplot(stack(dat), 
         aes(x = ind, 
             y = values)) +
    geom_jitter(alpha = I(1/4), aes(color = ind)) +
    geom_boxplot(alpha = I(1/4)) +
    geom_hline(aes(yintercept=0), 
               lty = "dotted", 
               colour= "dark grey",
               size=1) +
     # geom_boxplot() + 
    scale_y_continuous(labels = scales::label_comma()) + # change ticks
    theme_minimal() + # remove background
    scale_color_manual(values = c("#56B4E9", "#E69F00")) + # choose colors
    theme(legend.position = "none") + # no legend
    theme(axis.title.y = element_blank()) + # remove y-axis title
    theme(plot.margin = grid::unit(c(0,0,0,0), "mm")) + #remove margins
    ggtitle(title) + # unique titles
    theme(plot.title = element_text(hjust = 1)) } # right align
# coord_flip() } # flip 
