# combine_bins_energy
# function to combine the high and low value bins for the BNs
# from the csv output of AgenaRisk
combine_bins_energy <- function(df){
  df_new_top <- df %>%
    slice_head(n = 2) %>%
    summarise(
      Lower.Bound = min(Lower.Bound),
      Upper.Bound = max(Upper.Bound),
      Value = sum(Value)
    )
  
  # keep the bottom 8 
  df <- df %>%
    slice_tail(n = 8)
  
  df_new_bottom <- df %>%
    slice_tail(n = 2) %>%
    summarise(
      Lower.Bound = min(Lower.Bound),
      Upper.Bound = max(Upper.Bound),
      Value = sum(Value)
    )
  
  # keep the top 6 
  df <- df %>%
    slice_head(n = 6)
  
  # Concatenate the new row at the head and tail
  df <- bind_rows(df_new_top, df)
  df <- bind_rows(df, df_new_bottom)
  

  df <- df %>%
    arrange(Upper.Bound)
  
  # energy categories ####
  # Abundant: More than enough energy, a surplus.
  # Adequate: A slight surplus, meeting nutritional needs comfortably.
  # Balanced: Energy balance, neither surplus nor deficit.
  # Insufficient: Slightly below the ideal, but not critically low.
  # Deficient: Lacking in energy but not severely so.
  # Highly Deficient: A significant energy deficit.
  # Critical Deficiency: Severely lacking in energy, potentially harmful.
  # Food Insecurity: Extremely low levels, indicating a serious lack of dietary energy.
  
  # Add labels for energy
  label_names <- c("Abundant", "Adequate", "Balanced", "Insufficient", "Deficient", "Highly Deficient", "Critical Deficiency", "Food Insecurity")
  
  label_values <- factor(1:length(label_names), labels = label_names)
  
  data <- mutate(df, Bin = label_values)
  
  return(data)
} 