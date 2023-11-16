library(dplyr)
library(ggcharts)
library(ggplot2)
library(patchwork)
library(magrittr)
library(scales)

# Source qualtiles data from AgenaRisk
source(file = "data/bn_data_quant.R")

ggplot(stack(bn_data_quant),
       aes(x = ind, y = values)) +
  # geom_jitter() +
  geom_boxplot(alpha = I(1/4), aes(color = ind)) + 
  scale_y_continuous(labels = scales::label_comma()) + 
  theme_minimal() +
  theme(legend.position = "none") +
  theme(axis.title.y=element_blank()) + 
  ggtitle("Overall plot")

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

energy_evpi <- tibble::tribble(
  ~evpi_term, ~evpi_value,
  "Energy needs per person (kcal/yr) ", 287424,
  "Energy intake (kcal/yr)", 283080,
  "Household composition (nutrient demand groups) ", 277416,
  "Fruit produced per person (kg/yr) ", 265247,
  "Fruit production area per person (ha) ", 265247,
  "Fruit production area (%) ", 265247,
  "Fruit available per person (kg/yr) ", 265247,
  "Fruit consumed per person (kg/yr) ", 265247,
  "Energy from fruits per person (kcal/yr) ", 265247,
  "Non fruit yield per person (kg/yr) ", 264776
)

# Iron evpi  ####

iron_evpi <- tibble::tribble(
  ~evpi_term, ~evpi_value,
  "None", 0
)

# vit a evpi data (top 10) ####

vit_A_evpi <- tibble::tribble(
  ~evpi_term, ~evpi_value,
  "Vitamin A intake (RAE/yr)", 90265,
  "Vitamin A from fruits per person (RAE/yr) ", 69313,
  "Fruit consumed per person (kg/yr) ", 69264,
  "Fruit produced per person (kg/yr) ", 69262,
  "Fruit production area per person (ha) ", 69262,
  "Fruit available per person (kg/yr) ", 69262,
  "Fruit production area (%) ", 69262,
  "Vitamin A needs per person (RAE/yr) ", 38803,
  "Vitamin A from off farm (RAE/yr) ", 33638,
  "Off farm product consumed per person (kg/yr) ", 32555
)

# zinc evpi data top 10 ####

zinc_evpi <- tibble::tribble(
  ~evpi_term, ~evpi_value,
  "Zinc intake (mg/yr) ", 1777,
  "Zinc from fruits per person (mg/yr) ", 1760,
  "Fruit consumed per person (kg/yr) ", 1755,
  "Fruit available per person (kg/yr) ", 1755,
  "Fruit produced per person (kg/yr) ", 1755,
  "Fruit production area per person (ha) ", 1755,
  "Fruit production area (%) ", 1755,
  "Zinc from off farm (mg/yr) ", 1289,
  "Off farm product consumed per person (kg/yr) ", 1283,
  "Zinc needs per person (mg/yr) ", 1282
)

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

