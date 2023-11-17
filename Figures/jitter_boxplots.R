# # overall jitter_box_plot plots ####
# here an attempt to reconstruct the data behind the AgenaRisk

# source bn_data from AgenaRisk
source(file = "data/bn_data.R")

# jitter_box_plot function for overall plots
source(file = "functions/jitter_box_plot.R")

energy_overall <- jitter_box_plot(data = bn_data, name = "energy", 
                                  title = "Dietary energy (kcal/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank()) 

iron_overall <- jitter_box_plot(data = bn_data, name = "iron", 
                                title = "Dietary iron (mg/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())

vit_a_overall <- jitter_box_plot(data = bn_data, name = "vitA", 
                                 title = "Dietary vitamin A (RAE/yr)") + 
  theme(axis.title.x=element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.x = element_blank())

zinc_overall <- jitter_box_plot(data = bn_data, name = "zinc", 
                                title = "Dietary zinc (mg/yr)") +  
  scale_x_discrete(labels=c("zinc_trees" = "With Trees", 
                            "zinc_no_trees" = "Without Trees")) + 
  theme(axis.text.x = element_text(size=14)) +
  theme(axis.title.x=element_blank())
