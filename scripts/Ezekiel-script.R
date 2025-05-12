library(tidyverse)
library(readxl)
library(inspectdf)
library(janitor)
library(bulkreadr)

png(filename = "visual-images/Ezekiel-plot.png", width = 800, height = 600)

plot(mpg ~ disp,
  data = mtcars,
  main = "Linear Regression of MPG on Displacement",
  xlab = "Displacement (cu.in.)",
  ylab = "Miles per Gallon",
  pch = 19
)

abline(lm(mpg ~ disp,
  data = mtcars
), col = "blue", lwd = 2)

dev.off()
