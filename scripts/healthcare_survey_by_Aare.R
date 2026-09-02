# I selected healthcare survey dataset to work with.


# calling libraries
library(tidyverse)
library(ggplot2)

# data import.
health_data <- read_csv("data/healthcare_survey.csv")

# Inspect the raw structure
str(health_data)
head(health_data)
dim(health_data)
names(health_data)
glimpse(health_data)

# Convert categorical variables to factors.

health_data$urban <- factor(health_data$urban, levels = c("Rural", "Urban"))
health_data$income_factor <- factor(health_data$income_level,
                                   levels = 1:5,
                                   ordered = TRUE)


# summary of factors and numeric variables
summary(health_data)
table(health_data$urban)
table(health_data$income_factor)


num_vars <- health_data[c("income_level", "household_size", "health_visits")]


# Healthcare visits by income level
income_summary <- aggregate(
  health_visits ~ income_level,
  data = health_data,
  FUN = function(x) c(n = length(x), mean = mean(x),
                      sd = sd(x), median = median(x))
)
print(income_summary)

# Healthcare visits by household size
size_summary <- aggregate(health_visits ~ household_size,
                          data = health_data,
                          FUN = mean)
print(size_summary)



# PLOT 1: Distribution of healthcare visits
plot_1 <- ggplot(health_data, aes(x = health_visits)) +
  geom_histogram(binwidth = 2, boundary = 0, closed = "left",
                 color = "white") +
  labs(title = "Distribution of healthcare visits",
       x = "Number of healthcare visits",
       y = "Number of households") +
  theme_minimal(base_size = 12)
print(plot_1)
ggsave("visual-images/Aare1_histogram.png", plot_1,
       width = 7, height = 5, dpi = 300)

# PLOT 2: Healthcare visits across income levels
plot_2 <- ggplot(health_data, aes(x = income_factor, y = health_visits)) +
  geom_boxplot(outlier.shape = NA) +
  geom_jitter(width = 0.12, height = 0, alpha = 0.75) +
  labs(title = "Healthcare visits increase with income level",
       x = "Income level",
       y = "Healthcare visits") +
  theme_minimal(base_size = 12)
print(plot_2)
ggsave("visual-images/Aare2_visits_by_income_boxplot.png", plot_2,
       width = 7, height = 5, dpi = 300)

# PLOT 3: Income-healthcare relationship, separated by residence
# Jitter is used because income takes only five integer values.
plot_3 <- ggplot(health_data, aes(x = income_level, y = health_visits,
                      shape = urban, linetype = urban)) +
  geom_jitter(width = 0.08, height = 0, size = 2, alpha = 0.8) +
  geom_smooth(method = "lm", se = TRUE) +
  scale_x_continuous(breaks = 1:5) +
  labs(title = "Income level and healthcare visits by residence",
       x = "Income level",
       y = "Healthcare visits",
       shape = "Residence",
       linetype = "Residence") +
  theme_minimal(base_size = 12)
print(plot_3)
ggsave("visual-images/Aare3_income_visits_by_urban_smooth.png", plot_3,
       width = 7.5, height = 5.5, dpi = 300)


# PLOT 4: Household size versus healthcare visits
plot_4 <- ggplot(health_data, aes(x = household_size, y = health_visits)) +
  geom_jitter(width = 0.10, height = 0, alpha = 0.8) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(title = "Household size has little relationship with healthcare visits",
       x = "Household size",
       y = "Healthcare visits") +
  theme_minimal(base_size = 12)
print(plot_4)
ggsave("visual-images/Aare4_household_size_visits.png", plot_4,
       width = 7, height = 5, dpi = 300)

