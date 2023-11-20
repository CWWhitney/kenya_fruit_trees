# bar_plot_bins
# function to create bar plots from the AgenaRisk outputs
bar_plot_bins <- function(data_trees, data_no_trees, title) {
  
#   # labels for the datasets
   label_treesyes <- "Trees"
   label_treesno <- "No trees"

  # Combine the data frames with labels
  df_combined <- bind_rows(
    mutate(data_trees, Dataset = label_treesyes),
    mutate(data_no_trees, Dataset = label_treesno)
  )
  
  #  df_combined is our data frame
  df_combined$Bin <- factor(df_combined$Bin, levels = rev(levels(df_combined$Bin)))
  
  ggplot(df_combined, aes(x = Bin, y = Value, fill = Dataset)) +
    geom_bar(stat = "identity", position = "dodge", alpha = I(2/3)) +
    theme_minimal() +
    scale_y_continuous(labels = scales::label_percent(), limits = c(0, 1)) +
    coord_flip() +
    theme(legend.position = "bottom") + # place the legend at the bottom
    theme(axis.title.y = element_blank()) + # remove y-axis title
    theme(axis.title.x = element_blank()) + # remove x-axis title
    ggtitle(title) + # unique titles
    # Rotate x-axis labels by 45 degrees 
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    theme(plot.title = element_text(hjust = 0)) +
    scale_fill_manual(values = c("grey", "#E69F00")) +
    labs(fill = NULL)  # remove legend title
}
