# combine_bins_zinc

library(dplyr)

# # zinc ####
#     # Surplus: Zinc levels significantly above the recommended range.
#     # Adequate: Zinc levels within the recommended range.
#     # Slightly Lacking: Slightly below the ideal, but not critically low.
#     # Mildly Lacking: Deficient in zinc but not severely so.
#     # Moderately Lacking: A significant zinc deficit.
#     # Severely Lacking: Severely lacking in zinc, potentially harmful.
#     # Extremely Lacking: Extremely low levels, indicating a serious lack of dietary zinc.
#     # Seriously Food Insecure: A critical deficiency in zinc, posing severe health risks.
#     # 

# combine_bins
# function to combine the high and low value bins for the BNs
# from the csv output of AgenaRisk
combine_bins_zinc <- function(df){
  df_new_top <- df %>%
    slice_head(n = 7) %>%
    summarise(
      Lower.Bound = min(Lower.Bound),
      Upper.Bound = max(Upper.Bound),
      Value = sum(Value)
    )
  
  # keep the bottom 
  df <- df %>%
    slice_tail(n = 9)
  
  df_new_bottom <- df %>%
    slice_tail(n = 4) %>%
    summarise(
      Lower.Bound = min(Lower.Bound),
      Upper.Bound = max(Upper.Bound),
      Value = sum(Value)
    )
  
  # keep the top 
  df <- df %>%
    slice_head(n = 5)
  
  # Concatenate the new row at the head and tail
  df <- bind_rows(df_new_top, df)
  df <- bind_rows(df, df_new_bottom)
  
  df <- df %>%
    arrange(Upper.Bound)
  
  # Add labels
  
  # based on various types of household members -- 
  # See tables from Trumbo et al. 3 to 4 thousand roughly
  
  # Excess: Iron levels above the recommended range.
  # Adequate: Iron levels within the recommended range.
  # Mild Deficiency: Slightly below the recommended range, but not critically low.
  # Moderate Deficiency: Deficient in iron but not severely so.
  # Severe Deficiency: A significant iron deficit.
  # Critical Deficiency: Severely lacking in iron, potentially harmful.
  # Extreme Deficiency: Extremely low levels, indicating a serious lack of dietary iron.
  # 
  
  label_names <- c("Surplus", "Adequate", "Slightly Lacking", "Mildly Lacking", "Moderately Lacking", "Severely Lacking", "Extremely Lacking")
       
  label_values <- factor(1:length(label_names), labels = label_names)
  
  data <- mutate(df, Bin = label_values)
  
  return(data)
} 
