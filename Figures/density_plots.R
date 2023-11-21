# overall density plots ####
source(file = "functions/density_plot.R")

energy_overall <- density_plot(data_trees = combine_bins_energy, 
                               data_no_trees = combine_bins_energy, 
                               title = "Dietary energy (kcal/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) 

iron_overall <- density_plot(data_trees = iron_df_treesnode_yes_treesyes, 
                             data_no_trees = iron_df_treesnode_yes_treesno,
                             title = "Dietary iron (mg/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())

vit_a_overall <- density_plot(data_trees = vitA_df_treesnode_yes_treesyes, 
                              data_no_trees = vitA_df_treesnode_yes_treesno, 
                              title = "Dietary vitamin A (RAE/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())

zinc_overall <- density_plot(data_trees = zinc_df_treesnode_yes_treesyes, 
                             data_no_trees = zinc_df_treesnode_yes_treesno,
                             title = "Dietary zinc (mg/yr)") + 
  theme(axis.text.x = element_text())
