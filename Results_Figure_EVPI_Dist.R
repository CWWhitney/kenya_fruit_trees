# Load libraries ####
library(dplyr)
library(ggcharts)
library(ggplot2)
library(patchwork)
library(magrittr)
library(scales)


# source bn_data from AgenaRisk
source(file = "data/bn_data.R")

# plotted function for overall plots
source(file = "functions/plotted.R")

# overall plots ####
energy_overall <- plotted(data = bn_data, name = "energy", 
                          title = "Dietary energy (kcal/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) 

iron_overall <- plotted(data = bn_data, name = "iron", 
                        title = "Dietary iron (mg/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())

vit_a_overall <- plotted(data = bn_data, name = "vitA", 
                         title = "Dietary vitamin A (RAE/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())

zinc_overall <- plotted(data = bn_data, name = "zinc", 
                        title = "Dietary zinc (mg/yr)") +  
  scale_x_discrete(labels=c("zinc_trees" = "With Trees", 
                            "zinc_no_trees" = "Without Trees")) + 
  theme(axis.text.x = element_text(size=14)) +
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
  plot_layout(ncol = 2, guides = "collect") + 
  plot_layout(widths = c(4, 1))

# Save image as figure ####

ggsave("Figures/results.png", width=10, height=9)

