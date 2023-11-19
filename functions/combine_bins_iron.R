# combine_bins_iron
library(dplyr)

# function to combine the high and low value bins for the BNs
# from the csv output of AgenaRisk
combine_bins_iron <- function(df){
  df_new_top <- df %>%
    slice_head(n = 3) %>%
    summarise(
      Lower.Bound = min(Lower.Bound),
      Upper.Bound = max(Upper.Bound),
      Value = sum(Value)
    )
  
  # keep the bottom 9 
  df <- df %>%
    slice_tail(n = 9)
  
  df_new_bottom <- df %>%
    slice_tail(n = 3) %>%
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
  
  return(df)
} 
