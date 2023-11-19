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

combined_energy_trees <- combine_bins(energy_df_treesnode_yes_treesyes) 
# energy with no trees in a scenario where trees were introduced
energy_df_treesnode_yes_treesno  <- read.csv("data/energy_scenario_notrees_treesnode_yes.csv", skip = 12)
combined_energy_notrees <- combine_bins(energy_df_treesnode_yes_treesno) 

# iron with trees in a scenario where trees were introduced
iron_df_treesnode_yes_treesyes <- read.csv("data/iron_scenario_trees_treesnode_yes.csv", skip = 12)
source(file = "functions/combine_bins_iron.R") # reduce bins to 8
combined_iron_trees <- combine_bins_iron(iron_df_treesnode_yes_treesyes) 
# iron with no trees in a scenario where trees were introduced
iron_df_treesnode_yes_treesno  <- read.csv("data/iron_scenario_notrees_treesnode_yes.csv", skip = 12)
combined_iron_notrees <- combine_bins_iron(iron_df_treesnode_yes_treesno) 

# vitA with trees in a scenario where trees were introduced
vitA_df_treesnode_yes_treesyes <- read.csv("data/vitA_scenario_trees_treesnode_yes.csv", skip = 12)
# vitA with no trees in a scenario where trees were introduced
vitA_df_treesnode_yes_treesno  <- read.csv("data/vitA_scenario_notrees_treesnode_yes.csv", skip = 12)

# zinc with trees in a scenario where trees were introduced
zinc_df_treesnode_yes_treesyes <- read.csv("data/zinc_scenario_trees_treesnode_yes.csv", skip = 12)
source(file = "functions/combine_bins_zinc.R")
combined_zinc_trees <- combine_bins_iron(iron_df_treesnode_yes_treesyes) 
# zinc with no trees in a scenario where trees were introduced
zinc_df_treesnode_yes_treesno  <- read.csv("data/zinc_scenario_notrees_treesnode_yes.csv", skip = 12)
combined_zinc_notrees <- combine_bins_iron(zinc_df_treesnode_yes_treesno)

source(file = "functions/bar_plot_bins.R")

# overall bins plots ####
energy_overall <- bar_plot_bins(data_trees = combined_energy_trees, 
                                data_no_trees = combined_energy_notrees, 
                          title = "Dietary energy (kcal/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) 

iron_overall <- bar_plot_bins(data_trees = combined_iron_trees, 
                              data_no_trees = combined_iron_notrees,
                        title = "Dietary iron (mg/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())

vit_a_overall <- bar_plot_bins(data_trees = vitA_df_treesnode_yes_treesyes, 
                                data_no_trees = vitA_df_treesnode_yes_treesno, 
                         title = "Dietary vitamin A (RAE/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())

zinc_overall <- bar_plot_bins(data_trees = combined_zinc_trees, 
                              data_no_trees = combined_zinc_notrees,
                        title = "Dietary zinc (mg/yr)") +  
  scale_x_discrete(labels=c("zinc_trees" = "With Trees", 
                            "zinc_no_trees" = "No Trees")) + 
  theme(axis.text.x = element_text(size=10))

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
