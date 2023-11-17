# Load libraries ####
library(dplyr)
library(ggcharts)
library(ggplot2)
library(patchwork)
library(magrittr)
library(scales)

source(file = "data/dot_data.R")

source(file = "functions/dot_plot.R")

# overall jitter_box_plot plots ####
energy_overall <- dot_plot(data = dot_data, 
                           name = "energy", 
                          title = "Dietary energy (kcal/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) 

iron_overall <- dot_plot(data = dot_data, 
                         name = "iron", 
                        title = "Dietary iron (mg/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())

vit_a_overall <- dot_plot(data = dot_data,  
                         name = "vitA", 
                         title = "Dietary vitamin A (RAE/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())

zinc_overall <- dot_plot(data = dot_data, 
                        name = "zinc", 
                        title = "Dietary zinc (mg/yr)") +  
  scale_x_discrete(labels=c("zinc_trees" = "With Trees", 
                            "zinc_no_trees" = "No Trees")) + 
  theme(axis.text.x = element_text(size=10)) +
  theme(axis.title.x=element_blank())

# Energy evpi data (top 10)   ####
source(file = "data/energy_evpi.R")

# Iron evpi  ####
source(file = "data/iron_evpi.R")

# vit a evpi data (top 10) ####
source(file = "data/vit_A_evpi.R")

# zinc evpi data top 10 ####
source(file = "data/zinc_evpi.R")

#source evpi plot function
source(file = "functions/evpi_chart.R")

# plot evpi charts 
energy_evpi_chart <- evpi_chart(energy_evpi) + 
  ggtitle("EVPI")
iron_evpi_chart <- evpi_chart(iron_evpi)
vit_A_evpi_chart <- evpi_chart(vit_A_evpi)
zinc_evpi_chart <- evpi_chart(zinc_evpi)

# plot all together ####

energy_overall + energy_evpi_chart +
iron_overall + iron_evpi_chart +
vit_a_overall + vit_A_evpi_chart +
zinc_overall + zinc_evpi_chart +
  patchwork::plot_layout(ncol = 2, guides = "collect") + 
  patchwork::plot_layout(widths = c(6, 4)) &
theme(legend.position = "bottom") & 
  theme(plot.margin = unit(c(0, 0, 0, 0), "cm")) # unit(c(top, right, bottom, left), "cm")

# Save image as figure ####

ggsave("Figures/results.png", width=6, height=9)
