# combine_bins
# function to combine the high and low value bins for the BNs
# from the csv output of AgenaRisk
combine_bins <- function(df){
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
  
} 