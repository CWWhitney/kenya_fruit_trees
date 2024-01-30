# combine_bins_energy
# function to combine the high and low value bins for the BNs
# from the csv output of AgenaRisk
combine_bins_energy <- function(df){
  df_new_top <- df %>%
    slice_head(n = 5) %>% 
    summarise(
      Lower.Bound = min(Lower.Bound),
      Upper.Bound = max(Upper.Bound),
      Value = sum(Value)
    )
  
  # keep the bottom  
  df <- df %>%
    slice_tail(n = 5) 
  
  df_new_bottom <- df %>%
    slice_tail(n = 2) %>%
    summarise(
      Lower.Bound = min(Lower.Bound),
      Upper.Bound = max(Upper.Bound),
      Value = sum(Value)
    )
  
  # keep the top 
  df <- df %>%
    slice_head(n = 3)
  
  # Concatenate the new row at the head and tail
  df <- bind_rows(df_new_top, df)
  df <- bind_rows(df, df_new_bottom)
  
  
  df <- df %>%
    arrange(Upper.Bound)
  
  # energy categories ####
  # based on various types of household members -- 
  # See tables from Trumbo et al.
  # Balanced: Energy balance, neither surplus nor deficit.
  # Insufficient: Slightly below the ideal, but not critically low.
  # Deficient: Lacking in energy but not severely so.
  # Highly Deficient: A significant energy deficit.
  # Critical Deficiency: Severely lacking in energy, potentially harmful.
  
  # Add labels for energy
  label_names <- c("Balanced", "Insufficient", "Deficient", "Highly Deficient", "Critical Deficiency")
  
  label_values <- factor(1:length(label_names), labels = label_names)
  
  data <- mutate(df, Bin = label_values)
  
  return(data)
} 
