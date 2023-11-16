# bn_data_quant

# generate rough rebuild of AgenaRisk data 
# outputs from AgenaRisk except upper and lower most
# these are AgenaRisk quantiles *0.25
bn_data_quant <- data.frame(
  energy_trees = quantile(x = c(-63118.75,-50495,-584610,341070,712510,890637.5)),
  energy_no_trees = quantile(x = c(-21932.5,-17546,-460170,364270,727770,909712.5)),
  iron_trees = quantile(x = c(-3701.625,-2961.3,-845.19,-332.15,2005.7,2507.125)),
  iron_no_trees = quantile(x = c(-2634.75,-2107.8,263.88,759.39,3557.6,4447)),
  vitA_trees = quantile(x = c(-63281.25,-50625,-1331200,58871,425800,532250)),
  vitA_no_trees = quantile(x = c(40720,32576,60582,204060,602030,752537.5)),
  zinc_trees = quantile(x = c(279.3375,223.47,1169,1423.7,2572.5,3215.625)),
  zinc_no_trees = quantile(x = c(1579.625,1263.7,2218,2299,3207.8,4009.75))
)
