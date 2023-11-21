

# overall dot_box_plot plots ####

source(file = "data/dot_data.R")

source(file = "functions/dot_plot.R")

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

energy_overall + iron_overall  +
  vit_a_overall  + zinc_overall  +
  patchwork::plot_layout(ncol = 2, guides = "collect") + 
  patchwork::plot_layout(widths = c(5, 5)) &
  theme(legend.position = "bottom") & 
  theme(plot.margin = unit(c(0, 0, 0, 0), "cm")) # unit(c(top, right, bottom, left), "cm")

# Save image as figure ####

ggsave("Figures/dot_plots_stats.png", width=6, height=9)