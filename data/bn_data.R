# overall data using mean and sd from AgenaRisk ####
#with 2000 points with the same mean and sd as the AgenaRisk results

set.seed(4242) # reproducible

bn_data <- data.frame(
  energy_trees = rnorm(n = 2000, mean = -584610, sd = 2845100),
  energy_no_trees = rnorm(n = 2000, mean = -460170, sd = 2749200),
  iron_trees = rnorm(n = 2000, mean = -845, sd = 4637),
  iron_no_trees = rnorm(n = 2000, mean = 264, sd = 5274),
  vitA_trees = rnorm(n = 2000, mean = -1331200, sd = 4320400),
  vitA_no_trees = rnorm(n = 2000, mean = 60582, sd = 1379300),
  zinc_trees = rnorm(n = 2000, mean = 1169, sd = 2173),
  zinc_no_trees = rnorm(n = 2000, mean = 2218, sd = 1265)
)
