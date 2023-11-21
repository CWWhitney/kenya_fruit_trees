# combine_bins_iron
library(dplyr)

# function to combine the high and low value bins for the BNs
# from the csv output of AgenaRisk
combine_bins_iron <- function(df){
  #add up the top 
  df_new_top <- df %>%
    slice_head(n = 4) %>%
    summarise(
      Lower.Bound = min(Lower.Bound),
      Upper.Bound = max(Upper.Bound),
      Value = sum(Value)
    )
  #(removed 4 of 12 rows)
  # keep the bottom 7 
  df <- df %>%
    slice_tail(n = 8)
  
  df_new_bottom <- df %>%
    slice_tail(n = 3) %>%
    summarise(
      Lower.Bound = min(Lower.Bound),
      Upper.Bound = max(Upper.Bound),
      Value = sum(Value)
    )
  
  # keep the top 6 
  df <- df %>%
    slice_head(n = 5)
  
  # Concatenate the new row at the head and tail
  df <- bind_rows(df_new_top, df)
  df <- bind_rows(df, df_new_bottom)
  
  df <- df %>%
    arrange(Upper.Bound)
  
  # Iron categories ####
  
  # based on various types of household members -- 
  # See tables from Trumbo et al. 2500 to 6500 roughly
  
  # Excess: Iron levels above the recommended range.
  # Adequate: Iron levels within the recommended range.
  # Mild Deficiency: Slightly below the recommended range, but not critically low.
  # Moderate Deficiency: Deficient in iron but not severely so.
  # Severe Deficiency: A significant iron deficit.
  # Critical Deficiency: Severely lacking in iron, potentially harmful.
  # Extreme Deficiency: Extremely low levels, indicating a serious lack of dietary iron.
  # 
  
  # Add labels for iron
  label_names <-  c("Excess", "Adequate", "Mild Deficiency", "Moderate Deficiency", "Severe Deficiency", "Critical Deficiency", "Extreme Deficiency")
  
  label_values <- factor(1:length(label_names), labels = label_names)
  
  data <- mutate(df, Bin = label_values)
  
  return(data)
} 
