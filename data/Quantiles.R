
### Work with Quantiles ####
# Source qualtiles data from AgenaRisk
source(file = "data/bn_data_quant.R")

# Unsatisfying result of the quantiles 
ggplot(stack(bn_data_quant),
       aes(x = ind, y = values)) +
  # geom_jitter() +
  geom_boxplot(alpha = I(1/4), aes(color = ind)) + 
  scale_y_continuous(labels = scales::label_comma()) + 
  theme_minimal() +
  theme(legend.position = "none") +
  theme(axis.title.y=element_blank()) + 
  ggtitle("Overall plot")
