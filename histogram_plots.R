# overall histogram plots ####

# combined

source(file = "functions/combine_bins_energy.R")
combined_energy_trees <- combine_bins_energy(energy_df_treesnode_yes_treesyes) 
combined_energy_notrees <- combine_bins_energy(energy_df_treesnode_yes_treesno) 
source(file = "functions/combine_bins_iron.R") # reduce bins to 8
combined_iron_trees <- combine_bins_iron(iron_df_treesnode_yes_treesyes) 
combined_iron_notrees <- combine_bins_iron(iron_df_treesnode_yes_treesno) 
source(file = "functions/combine_bins_vitA.R")
combined_vitA_trees <- combine_bins_vitA(vitA_df_treesnode_yes_treesyes)
combined_vitA_notrees <- combine_bins_vitA(vitA_df_treesnode_yes_treesno)
source(file = "functions/combine_bins_zinc.R")
combined_zinc_trees <- combine_bins_zinc(zinc_df_treesnode_yes_treesyes) 
combined_zinc_notrees <- combine_bins_zinc(zinc_df_treesnode_yes_treesno)

# plots
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
                                 width = 299998,
                                 title = "Dietary vitamin A (RAE/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())

zinc_overall <- histogram_trees(data_trees = zinc_trees, 
                                data_notrees = zinc_notrees,
                                title = "Dietary zinc (mg/yr)") 


energy_overall + iron_overall  +
  vit_a_overall  + zinc_overall  +
  patchwork::plot_layout(ncol = 2, guides = "collect") + 
  patchwork::plot_layout(widths = c(5, 5)) &
  theme(legend.position = "bottom") & 
  theme(plot.margin = unit(c(0, 0, 0, 0), "cm")) # unit(c(top, right, bottom, left), "cm")

# Save image as figure ####

ggsave("Figures/histogram_plots.png", width=6, height=9)