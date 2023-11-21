# combined

source(file = "functions/combine_bins_energy.R")
combined_energy_trees <- combine_bins(energy_df_treesnode_yes_treesyes) 
combined_energy_notrees <- combine_bins(energy_df_treesnode_yes_treesno) 
source(file = "functions/combine_bins_iron.R") # reduce bins to 8
combined_iron_trees <- combine_bins_iron(iron_df_treesnode_yes_treesyes) 
combined_iron_notrees <- combine_bins_iron(iron_df_treesnode_yes_treesno) 
source(file = "functions/combine_bins_vitA.R")
combined_vitA_trees <- combine_bins_vitA(vitA_df_treesnode_yes_treesyes)
combined_vitA_notrees <- combine_bins_vitA(vitA_df_treesnode_yes_treesno)
source(file = "functions/combine_bins_zinc.R")
combined_zinc_trees <- combine_bins_zinc(zinc_df_treesnode_yes_treesyes) 
combined_zinc_notrees <- combine_bins_zinc(zinc_df_treesnode_yes_treesno)

source(file = "functions/bar_plot_bins.R")

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

vit_a_overall <- bar_plot_bins(data_trees = combined_vitA_trees, 
                               data_no_trees = combined_vitA_notrees, 
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


energy_overall + iron_overall  +
  vit_a_overall  + zinc_overall  +
  patchwork::plot_layout(ncol = 2, guides = "collect") + 
  patchwork::plot_layout(widths = c(5, 5)) &
  theme(legend.position = "bottom") & 
  theme(plot.margin = unit(c(0, 0, 0, 0), "cm")) # unit(c(top, right, bottom, left), "cm")

# Save image as figure ####

ggsave("Figures/bar_plots.png", width=6, height=9)