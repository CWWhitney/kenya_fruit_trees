# Load libraries ####
library(dplyr)
library(ggcharts)
library(ggplot2)
library(patchwork)
library(magrittr)
library(scales)

# Results

# Read the CSV files of AgenaRisk results ####
# with trees - we filter our analysis to the scenarios 
# that align with the decision node setting 
# to concentrate on the information that is most 
# pertinent to our current investigation
# energy with trees in a scenario where trees were introduced
energy_df_treesnode_yes_treesyes <- read.csv("data/energy_scenario_trees_treesnode_yes.csv", skip = 12)
# energy with no trees in a scenario where trees were introduced
energy_df_treesnode_yes_treesno  <- read.csv("data/energy_scenario_notrees_treesnode_yes.csv", skip = 12)

# iron with trees in a scenario where trees were introduced
iron_df_treesnode_yes_treesyes <- read.csv("data/iron_scenario_trees_treesnode_yes.csv", skip = 12)
# iron with no trees in a scenario where trees were introduced
iron_df_treesnode_yes_treesno  <- read.csv("data/iron_scenario_notrees_treesnode_yes.csv", skip = 12)

# vitA with trees in a scenario where trees were introduced
vitA_df_treesnode_yes_treesyes <- read.csv("data/vitA_scenario_trees_treesnode_yes.csv", skip = 12)
# vitA with no trees in a scenario where trees were introduced
vitA_df_treesnode_yes_treesno  <- read.csv("data/vitA_scenario_notrees_treesnode_yes.csv", skip = 12)

# zinc with trees in a scenario where trees were introduced
zinc_df_treesnode_yes_treesyes <- read.csv("data/zinc_scenario_trees_treesnode_yes.csv", skip = 12)
# zinc with no trees in a scenario where trees were introduced
zinc_df_treesnode_yes_treesno  <- read.csv("data/zinc_scenario_notrees_treesnode_yes.csv", skip = 12)

# density estimates for comparison
source(file = "functions/combine_bins_energy.R")
energy_trees <- combine_bins_energy(energy_df_treesnode_yes_treesyes)
energy_notrees <- combine_bins_energy(energy_df_treesnode_yes_treesno)
source(file = "functions/combine_bins_iron.R")
iron_trees <- combine_bins_iron(iron_df_treesnode_yes_treesyes)
iron_notrees <- combine_bins_iron(iron_df_treesnode_yes_treesno)
source(file = "functions/combine_bins_vitA.R")
vitA_trees <- combine_bins_vitA(vitA_df_treesnode_yes_treesyes)
vitA_notrees <- combine_bins_vitA(vitA_df_treesnode_yes_treesno)
source(file = "functions/combine_bins_zinc.R")
zinc_trees <- combine_bins_zinc(zinc_df_treesnode_yes_treesyes)
zinc_notrees <- combine_bins_zinc(zinc_df_treesnode_yes_treesno)

histogram_trees
# overall density plots ####
source(file = "functions/histogram_trees.R")

energy_overall <- histogram_trees(data_trees = energy_trees, 
                                data_notrees = energy_notrees,
                          title = "Dietary energy (kcal/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) 

iron_overall <- histogram_trees(data_trees = iron_trees, 
                                data_notrees = iron_notrees,
                        title = "Dietary iron (mg/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())

vit_a_overall <- histogram_trees(data_trees = vitA_trees, 
                                 data_notrees = vitA_notrees,
                         title = "Dietary vitamin A (RAE/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())

zinc_overall <- histogram_trees(data_trees = zinc_trees, 
                                data_notrees = zinc_notrees,
                        title = "Dietary zinc (mg/yr)") + 
  theme(axis.text.x = element_text())

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
