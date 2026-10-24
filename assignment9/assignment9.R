# Load dataset
data("Affairs", package = "AER")
head(Affairs)

# 1. Base R graphics
# Scatter plot
plot(Affairs$age, Affairs$rating,
     main = "Base: age vs. rating",
     xlab = "age",
     ylab = "rating")

# Histogram
hist(Affairs$yearsmarried,
     main = "Base: Distribution of yearsmarried",
     xlab = "yearsmarried")

# 2. Lattice Graphics
library(lattice)

# Conditional scatter plot (small multiples)
xyplot(rating ~ age | gender,
       data = Affairs,
       main = "Lattice: rating vs. age by gender")

# Box-and-whisker plot
bwplot(yearsmarried ~ gender,
       data = Affairs,
       main = "Lattice: yearsmarried by gender")

# 3. ggplot2
library(ggplot2)

# Scatter plot with smoothing
ggplot(Affairs, aes(x = age, y = rating, color = gender)) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(title = "ggplot2: rating vs. age with trend by gender")

# Faceted histogram
ggplot(Affairs, aes(yearsmarried)) +
  geom_histogram(binwidth = 1) +
  facet_wrap(~ gender) +
  labs(title = "ggplot2: yearsmarried distribution by gender")