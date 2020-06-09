# An analysis using LiDAR data to detect moose browsing effects, with ground truthing

# Get compiled dataset (see compile.R)

library(readr)
dat <- read_csv("data/compiledDataset.csv")

# A quick data check
table(dat$Treatment)
table(dat$Clear.cut)
table(dat$Year.initiated)
table(dat$LiDAR.data.from.year)
table(dat$plot_density_m2)
table(dat$resolution_m)
table(dat$region, dat$Treatment)
table(dat$Treatment, dat$YrsSinceExclosure)
table(dat$YrsSinceExclosure, dat$plot_density_m2)
# Looks good


