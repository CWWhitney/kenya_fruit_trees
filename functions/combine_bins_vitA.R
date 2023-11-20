# combine_bins_vitA
library(dplyr)

# # VitA categories####
#     # Deficient: Vitamin A levels significantly below the recommended range.
#     # Insufficient: Vitamin A levels slightly below the recommended range but not critically low.
#     # Adequate: Vitamin A levels within the recommended range.
#     # Optimal: Vitamin A levels above the recommended range.


# function to combine the high and low value bins for the BNs
# from the csv output of AgenaRisk
combine_bins_vitA <- function(df){
  
  label_names <-  c("Slight surplus", "Balanced", "Slightly lacking", "Lacking")
  
  label_values <- factor(1:length(label_names), labels = label_names)
  
  data <- mutate(df, Bin = label_values)
  
  return(data)
} 
