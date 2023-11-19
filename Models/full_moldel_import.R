# AgenaRisk models
library(agena.ai)

# different scenarios representing various interventions 
# (trees introduced or not) and different decisions 
# (yes or no) for the decision node

# Full model
energy_full_model <- agena.ai::from_cmpx(modelPath = "Models/BN_Model_Energy_170613.cmpx")
iron_full_model <- agena.ai::from_cmpx(modelPath = "Models/BN_Model_Iron_170613.cmpx")
vita_full_model <- agena.ai::from_cmpx(modelPath = "Models/BN_Model_Vit_A_170613.cmpx")
zinc_full_model <- agena.ai::from_cmpx(modelPath = "Models/BN_Model_Zinc_170415.cmpx")

