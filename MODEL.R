# Load the necessary libraries
library(MASS)
library(ggplot2)

# Convert the first column to a factor (if it's not already)
DTS$TIPO <- as.factor(DTS$TIPO)

pairs(x = DTS[, -1], col = c("firebrick", "green3", "blue")[DTS$TIPO],
      pch = 20)

# Perform the linear discriminant analysis
lda_model <- lda(TIPO ~ ., data = DTS)

# Get the predictions and discriminant function values
lda_values <- predict(lda_model)$x  # Discriminant functions
lda_df <- data.frame(lda_values, TIPO = DTS$TIPO)  # Create data frame with values and call types

# Plot using ggplot2
ggplot(lda_df, aes(x = LD1, y = LD2, color = TIPO)) +  # Use LD1 and LD2
  geom_point(size = 3) +  # Size of the points
  labs(title = "Linear Discriminant Analysis", x = "LD1", y = "LD2") +  # Titles
  theme_minimal() +  # Minimal theme
  scale_color_manual(values = c("red", "blue", "green")) +  # Colors for each call type
  theme(legend.title = element_blank())  # Remove legend title
