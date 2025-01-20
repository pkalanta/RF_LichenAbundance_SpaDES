# Here’s a simplified example of modeling lichen abundance using Random Forest in R, 
# structured to align with the SpaDES framework principles. The example assumes you have spatial data 
# (e.g., raster layers of environmental predictors) and point observations of lichen abundance.
# Parvin Kalantari - January 2nd, 2025 -PFC, Victoria, BC
repos <- c("https://predictiveecology.r-universe.dev", getOption("repos"))
if (!require("SpaDES.project")) {
  install.packages("SpaDES.project", repos = repos)
}

out <- SpaDES.project::setupProject(
  paths = list(modulePath = "m", projectPath = "RF_LichenAbundance_SpaDES"),
  modules = c(
    #"pkalanta/LichenDataPreperationeModule@main",
    "pkalanta/LichenAbundanceWithEliot@main",
    "pkalanta/Lichen_dataPrep@main"
    #"LichenPresenceAbsenceBIOMOD2",  #"Caribou", 
    # "PredictiveEcology/Biomass_core@development", 
    # "PredictiveEcology/Biomass_borealDataPrep@development",
    # "PredictiveEcology/Biomass_speciesParameters@development",
    # "PredictiveEcology/scfm@development",
  ),
  useGit = TRUE,
  params = list(),
  options = options(reproducible.showSimilar = TRUE)
)

sim <- SpaDES.core::simInitAndSpades2(out)


