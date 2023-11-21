# density_estimate

density_estimate <-function(data){
  # Combine Lower.Bound and Upper.Bound from both datasets
  all_bounds <- c(data$Lower.Bound, data$Upper.Bound)
  notrees_bounds <- c(data$Lower.Bound, data$Upper.Bound)
  
  # Combine Values from both datasets
  all_values <- c(data$Value) 
  #, iron_df_treesnode_yes_treesno$Value)
  
  # Create a data frame with combined bounds and values
  combined_data <- data.frame(Bounds = rep(all_bounds, each = 2), 
                              Value = rep(all_values, each = 2))
  
  # Use density estimation to create a kernel density estimate
  density_estimate <- density(combined_data$Bounds, 
                              weights = combined_data$Value)
  
  density_estimate
}