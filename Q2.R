
install.packages("datarium")
install.packages("tidyverse")
install.packages("corrplot")
install.packages("rcompanion")
library(datarium)
library(tidyverse)
library(corrplot)
library(rcompanion)
library(readxl)
library(ggplot2)
library(dplyr)
library(corrplot)

df <- read_excel("C:/Users/Chaudhary Computer/Desktop/Applied Statistics and Data Visualisation/Assignment/Task 2 - Statistical Analysis/concrete+compressive+strength/concrete compressive strength.csv.xlsx")
# Using relative path:


head(df)
tail(df)
summary(df)
names(df)
str(df)





# Adjust layout to fit multiple histograms
par(mfrow = c(3, 3))  # 3 rows, 3 columns

# Plot histograms for each column
hist(df$`Concrete compressive strength(MPa, megapascals)`, main = "Concrete Strength", col = "lightblue", xlab = "MPa")
hist(df$`Cement (component 1)(kg in a m^3 mixture)`, main = "Cement", col = "lightgreen", xlab = "kg/m^3")
hist(df$`Blast Furnace Slag (component 2)(kg in a m^3 mixture)`, main = "Blast Furnace Slag", col = "pink", xlab = "kg/m^3")
hist(df$`Fly Ash (component 3)(kg in a m^3 mixture)`, main = "Fly Ash", col = "lightyellow", xlab = "kg/m^3")
hist(df$`Water  (component 4)(kg in a m^3 mixture)`, main = "Water", col = "cyan", xlab = "kg/m^3")
hist(df$`Superplasticizer (component 5)(kg in a m^3 mixture)`, main = "Superplasticizer", col = "purple", xlab = "kg/m^3")
hist(df$`Fine Aggregate (component 7)(kg in a m^3 mixture)`, main = "Fine Aggregate", col = "orange", xlab = "kg/m^3")
hist(df$`Age (day)`, main = "Age (days)", col = "grey", xlab = "days")

# Reset layout to default
par(mfrow = c(1, 1))


#Concrete compressive strength(MPa, megapascals
plot(density(df$`Concrete compressive strength(MPa, megapascals)`))

#Cement (component 1)(kg in a m^3 mixture)
plot(density(df$`Cement (component 1)(kg in a m^3 mixture)`))

#Blast Furnace Slag (component 2)(kg in a m^3 mixture)
plot(density(df$`Blast Furnace Slag (component 2)(kg in a m^3 mixture)`))

#Fly Ash (component 3)(kg in a m^3 mixture)
plot(density(df$`Fly Ash (component 3)(kg in a m^3 mixture)`))


#Water  (component 4)(kg in a m^3 mixture)
plot(density(df$`Water  (component 4)(kg in a m^3 mixture)`))


#Superplasticizer (component 5)(kg in a m^3 mixture)
plot(density(df$`Superplasticizer (component 5)(kg in a m^3 mixture)`))


#Fine Aggregate (component 7)(kg in a m^3 mixture)
plot(density(df$`Fine Aggregate (component 7)(kg in a m^3 mixture)`))

#Age (day)
plot(density(df$`Age (day)`))





#Distribution of Concrete Compressive Strength 
ggplot(df, aes(x = `Concrete compressive strength(MPa, megapascals)`)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Concrete Compressive Strength", x = "Compressive Strength (MPa)")


# Boxplot of Strength by Concrete Category
ggplot(df, aes(x = `Concrete Category`, y = `Concrete compressive strength(MPa, megapascals)`)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Compressive Strength by Concrete Category", x = "Concrete Category", y = "Compressive Strength (MPa)")


#box plot  of Strength by Contains Fly Ash
ggplot(df, aes(x = `Concrete compressive strength(MPa, megapascals)`, fill = `Contains Fly Ash`)) +
  geom_boxplot()





# Correlation Matrix for Numeric Variables
corr_matrix <- cor(numeric_cols, use = "complete.obs")
corrplot(corr_matrix, method = "circle", tl.cex = 0.5)  # Adjust value as needed


# Scatter plot of strength vs. cement
ggplot(df, aes(x = `Cement (component 1)(kg in a m^3 mixture)`, y = `Concrete compressive strength(MPa, megapascals)`)) +
  geom_point(color = "steelblue") +
  labs(title = "Strength vs. Cement", x = "Cement (kg/m^3)", y = "Compressive Strength (MPa)")
ggplot(df,aes(`Cement (component 1)(kg in a m^3 mixture)`,`Concrete compressive strength(MPa, megapascals)`))+geom_point()+geom_smooth(method = "lm")



# Scatter plot of strength vs. age
ggplot(df, aes(x = `Age (day)`, y = `Concrete compressive strength(MPa, megapascals)`)) +
  geom_point(color = "red") +
  labs(title = "Strength vs. Age", x = "Age (days)", y = "Compressive Strength (MPa)")







# Load necessary libraries
library(readxl)
library(dplyr)



# Calculate and display descriptive statistics 
for (col_name in names(df)) {
  if (is.numeric(df[[col_name]])) {
    cat("Descriptive Statistics for", col_name, ":\n")
    
    # Calculate statistics
    stats <- df %>%
      summarise(
        Mean = mean(.data[[col_name]], na.rm = TRUE),
        Median = median(.data[[col_name]], na.rm = TRUE),
        SD = sd(.data[[col_name]], na.rm = TRUE),
        Min = min(.data[[col_name]], na.rm = TRUE),
        Max = max(.data[[col_name]], na.rm = TRUE),
        Q1 = quantile(.data[[col_name]], 0.25, na.rm = TRUE),
        Q3 = quantile(.data[[col_name]], 0.75, na.rm = TRUE)
      )
    
    # Print results
    print(stats)
    cat("\n")
  }
}










install.packages("datarium")
install.packages("tidyverse")
install.packages("corrplot")
install.packages("rcompanion")
library(datarium)
library(tidyverse)
library(corrplot)
library(rcompanion)


names(df)
df
plot(df$`Concrete compressive strength(MPa, megapascals)`,df$`Cement (component 1)(kg in a m^3 mixture)`)

# Shapiro-Wilk Test
shapiro_test1 <- shapiro.test(df$`Concrete compressive strength(MPa, megapascals)`)
shapiro_test2 <- shapiro.test(df$`Cement (component 1)(kg in a m^3 mixture)`)

# Output Results
print(shapiro_test1)
print(shapiro_test2)


cor(df$`Concrete compressive strength(MPa, megapascals)`,df$`Cement (component 1)(kg in a m^3 mixture)`,method="spearman")






plot(df$`Concrete compressive strength(MPa, megapascals)`,df$`Superplasticizer (component 5)(kg in a m^3 mixture)`)


# Shapiro-Wilk Test
shapiro_test1 <- shapiro.test(df$`Concrete compressive strength(MPa, megapascals)`)
shapiro_test2 <- shapiro.test(df$`Superplasticizer (component 5)(kg in a m^3 mixture)`)

# Output Results
print(shapiro_test1)
print(shapiro_test2)


cor(df$`Concrete compressive strength(MPa, megapascals)`,df$`Superplasticizer (component 5)(kg in a m^3 mixture)`,method="spearman")



plot(df$`Concrete compressive strength(MPa, megapascals)`,df$`Water  (component 4)(kg in a m^3 mixture)`)
# Shapiro-Wilk Test
shapiro_test1 <- shapiro.test(df$`Concrete compressive strength(MPa, megapascals)`)
shapiro_test2 <- shapiro.test(df$`Water  (component 4)(kg in a m^3 mixture)`)

# Output Results
print(shapiro_test1)
print(shapiro_test2)

cor(df$`Concrete compressive strength(MPa, megapascals)`,df$`Water  (component 4)(kg in a m^3 mixture)`,method="spearman")



plot(df$`Concrete compressive strength(MPa, megapascals)`,df$`Blast Furnace Slag (component 2)(kg in a m^3 mixture)`)

# Shapiro-Wilk Test
shapiro_test1 <- shapiro.test(df$`Concrete compressive strength(MPa, megapascals)`)
shapiro_test2 <- shapiro.test(df$`Blast Furnace Slag (component 2)(kg in a m^3 mixture)`)

# Output Results
print(shapiro_test1)
print(shapiro_test2)


cor(df$`Concrete compressive strength(MPa, megapascals)`,df$`Blast Furnace Slag (component 2)(kg in a m^3 mixture)`,method="spearman")



plot(df$`Concrete compressive strength(MPa, megapascals)`,df$`Fine Aggregate (component 7)(kg in a m^3 mixture)`)

# Shapiro-Wilk Test
shapiro_test1 <- shapiro.test(df$`Concrete compressive strength(MPa, megapascals)`)
shapiro_test2 <- shapiro.test(df$`Fine Aggregate (component 7)(kg in a m^3 mixture)`)

# Output Results
print(shapiro_test1)
print(shapiro_test2)


cor(df$`Concrete compressive strength(MPa, megapascals)`,df$`Fine Aggregate (component 7)(kg in a m^3 mixture)`,method="spearman")







plot(df$`Concrete compressive strength(MPa, megapascals)`,df$`Coarse Aggregate  (component 6)(kg in a m^3 mixture)`)

# Shapiro-Wilk Test
shapiro_test1 <- shapiro.test(df$`Concrete compressive strength(MPa, megapascals)`)
shapiro_test2 <- shapiro.test(df$`Coarse Aggregate  (component 6)(kg in a m^3 mixture)`)

# Output Results
print(shapiro_test1)
print(shapiro_test2)


cor(df$`Concrete compressive strength(MPa, megapascals)`,df$`Coarse Aggregate  (component 6)(kg in a m^3 mixture)`,method="spearman")





continuose_discrete<-df %>% select(-'Concrete Category',-'Contains Fly Ash')
head(continuose_discrete)
round(cor(continuose_discrete, method = "spearman"), digit=2)
corrplot(cor(continuose_discrete),method="number",type="upper",tl.cex = 0.5)




install.packages("psych")
library(psych)  # You may need to install this package
# Convert the binary categorical variable to a factor 
df$`Contains Fly Ash` <- as.factor(df$`Contains Fly Ash`)

# Point-biserial correlation for contains fly ash

point_biserial <- cor.test(as.numeric(df$`Concrete compressive strength(MPa, megapascals)`), 
                           as.numeric(df$`Contains Fly Ash`), method = "pearson")
print(point_biserial)

plot(df$`Concrete compressive strength(MPa, megapascals)`,df$`Contains Fly Ash`)


#for concrete strenght and concrete category
# Convert the binary categorical variable to a factor 
df$`Concrete Category` <- as.factor(df$`Concrete Category`)


# Point-biserial correlation for Concrete Category

point_biserial <- cor.test(as.numeric(df$`Concrete Category`), 
                           as.numeric(df$`Concrete Category`), method = "pearson")
print(point_biserial)

plot(df$`Concrete compressive strength(MPa, megapascals)`,df$`Concrete Category`)


#--------task3------------------------------------------------------------
#SLR
#check variables and data types
str(df)



# Extract only numerical columns
numerical_data <- df %>% select_if(is.numeric)

# Compute the correlation matrix
cor_matrix <- cor(numerical_data, use = "complete.obs")  # Handles missing values if any

# Plot the correlation matrix
corrplot(cor_matrix, method = "color", type = "upper", 
         tl.cex = 0.5,           # Adjust text label size
         tl.col = "red",       # Text color for labels
         order = "hclust",       # Hierarchical clustering order
         addCoef.col = "blue",  # Show correlation coefficients on plot
         number.cex = 0.7)       # Size of correlation coefficient text

#the correlation b/w cement and compressive strenght is high
#using farward stepwise method
# SLR model: Compressive Strength ~ Cement Content
model_cement <- lm(`Concrete compressive strength(MPa, megapascals)` ~ `Cement (component 1)(kg in a m^3 mixture)`, data = df_reduced)

# Model summary
summary(model_cement)

#23% adds to the total compressive strenght

# Plot the regression line
plot(df_reduced$`Cement (component 1)(kg in a m^3 mixture)`, df_reduced$`Concrete compressive strength(MPa, megapascals)`,
     main="Compressive Strength vs Cement Content",
     xlab="Cement Content (kg)", ylab="Compressive Strength (MPa)")
abline(model_cement, col="blue")


#residual independence
plot(model_cement, 1)


#check normality of residual independence
plot(model_cement,2)


#checking Equal variances of the residuals (Homoscedasticity)
plot(model_cement,3)



#reporting the results


data <- data.frame(
  cement_component = df$`Cement (component 1)(kg in a m^3 mixture)`,
  compressive_strength = df$`Concrete compressive strength(MPa, megapascals)`
)
# Perform the simple linear regression
model <- lm(compressive_strength ~ cement_component, data = data)

# Print the summary of the model to get the results
summary(model)

# Output the coefficients
coefficients(model)


# Now applying multiple regression analyzes 
#now again plot the correlation to see which IV could be better candidate
# Plot the correlation matrix
corrplot(cor_matrix, method = "color", type = "upper", 
         tl.cex = 0.5,           # Adjust text label size
         tl.col = "red",       # Text color for labels
         order = "hclust",       # Hierarchical clustering order
         addCoef.col = "blue",  # Show correlation coefficients on plot
         number.cex = 0.7)       # Size of correlation coefficient text
#from this it seems superplaster have high correlation 



# Fit the model with the square root transformation of compressive strength
model_2 <- lm((`Concrete compressive strength(MPa, megapascals)`) ~ 
                `Cement (component 1)(kg in a m^3 mixture)` + 
                `Superplasticizer (component 5)(kg in a m^3 mixture)`, 
              data = df_reduced)

# Display the summary of the model
summary(model_2)

#Now the MLR equations is Concrete compressive strength (MPa)=3.542+0.00637×Cement+0.07657×Superplasticizer



#adding one more variable


# Fit the  model
model_3 <- lm((`Concrete compressive strength(MPa, megapascals)`) ~ 
                `Cement (component 1)(kg in a m^3 mixture)` + 
                `Superplasticizer (component 5)(kg in a m^3 mixture)` + 
                `Water  (component 4)(kg in a m^3 mixture)`, 
              data = df_reduced)

# Display the summary of the model
summary(model_3)
#MLR equation

#Concrete compressive strength (MPa)=3.1738+0.00583×Cement (component 1)+0.09539×Superplasticizer (component 5)+0.00881×Age (day)

# Fit the model
model_4 <- lm((`Concrete compressive strength(MPa, megapascals)`) ~ 
                `Cement (component 1)(kg in a m^3 mixture)` + 
                `Superplasticizer (component 5)(kg in a m^3 mixture)` + 
                `Water  (component 4)(kg in a m^3 mixture)` + 
                `Fine Aggregate (component 7)(kg in a m^3 mixture)`+
                `Coarse Aggregate  (component 6)(kg in a m^3 mixture)`+
                `Blast Furnace Slag (component 2)(kg in a m^3 mixture)`,
              data = df_reduced)

# Display the summary of the model
summary(model_4)


#Concrete compressive strength (MPa)=2.5992+0.0068283×Cement (component 1)+0.0911673×Superplasticizer (component 5)+0.0088557×Age (day)+0.0043038×Blast Furnace Slag (component 2)

names(df_reduced)

#checking normality
pairs(df_reduced[,c(1,2,5,4,6,7,9)], lower.panel = NULL, pch = 10,cex = 0.0001)

#checking residual independence
#plot(model_2,1)
#plot(model_3,1)
plot(model_4,1)



#Normality of residuals:
#plot(model_2, 2)
#plot(model_3, 2)
plot(model_4, 2)


#Equal variances of the residuals (Homoscedasticity)
#plot(model_2, 3)
#plot(model_3, 3)
plot(model_4, 3)

install.packages("car")
library(car)


#No multicollinearity
#vif(model_2)
#vif(model_3)
vif(model_4)


#report the results
# Define the values for the new data point 
new_data <- data.frame(
  Cement = 350,              #  value for Cement (kg in a m^3 mixture)
  Superplasticizer = 4.5,    #  value for Superplasticizer (kg in a m^3 mixture)
  Water = 200,               #  value for Water (kg in a m^3 mixture)
  Fine_Aggregate = 600,      #  value for Fine Aggregate (kg in a m^3 mixture)
  Coarse_Aggregate = 900,    #  value for Coarse Aggregate (kg in a m^3 mixture)
  Blast_Furnace_Slag = 150   #  value for Blast Furnace Slag (kg in a m^3 mixture)
)

# Apply the regression equation to make the prediction
predicted_compressive_strength <- 97.47 + 
  0.075 * new_data$Cement + 
  0.407 * new_data$Superplasticizer - 
  0.216 * new_data$Water - 
  0.037 * new_data$Fine_Aggregate - 
  0.021 * new_data$Coarse_Aggregate + 
  0.041 * new_data$Blast_Furnace_Slag

# Print the predicted concrete compressive strength
print(predicted_compressive_strength)



#---------------------------------------------------------------task 4--------------------
#first of all iam checking the normality of CCS

# Create the Q-Q plot using ggplot2
ggplot(data = data.frame(sample = df$`Concrete compressive strength(MPa, megapascals)`), aes(sample = sample)) +
  stat_qq(size = 2, color = "blue") +            # Q-Q points
  stat_qq_line(color = "orange") +               # Q-Q line
  xlab("Theoretical Quantiles") +                # X-axis label
  ylab("Sample Quantiles") +                     # Y-axis label
  ggtitle("`Concrete compressive strength")          # Title for the plot


#checking the q-q plot of normality for random numbers

install.packages("ggplot2")
library(ggplot2)
# Generate a random sample
random_sample <- rnorm(500, mean = 0, sd = 1)

# Create the Q-Q plot using ggplot2
ggplot(data = data.frame(sample = random_sample), aes(sample = sample)) +
  stat_qq(size = 2, color = "blue") +            # Q-Q points
  stat_qq_line(color = "orange") +               # Q-Q line
  xlab("Theoretical Quantiles") +                # X-axis label
  ylab("Sample Quantiles") +                     # Y-axis label
  ggtitle("Q-Q Plot for Random Sample")          # Title for the plot

#checking q-q plot of exponential distributions

# Load necessary package
library(ggplot2)

# Generate a random sample from an exponential distribution
random_sample2 <- rexp(500)

# Create the Q-Q plot using ggplot2
ggplot(data = data.frame(sample = random_sample2), aes(sample = sample)) +
  stat_qq(size = 2, color = "blue") +            # Q-Q points
  stat_qq_line(color = "orange") +               # Q-Q line
  xlab("Theoretical Quantiles") +                # X-axis label
  ylab("Sample Quantiles") +                     # Y-axis label
  ggtitle("Q-Q Plot for Exponential Distribution") # Title for the plot


#Now the there is deviation from tail and head lets try another test to justify whether is it normal or not

data_to_test <- na.omit(df$`Concrete compressive strength(MPa, megapascals)`)

# Apply the Shapiro-Wilk test
shapiro_test_result <- shapiro.test(data_to_test)

# Print the results
print(shapiro_test_result)


# from both test we see that data is not normal
#now apply log transformation to make it normal
# Apply log transformation
df$`Log Concrete compressive strength(MPa, megapascals)` <- log(df$`Concrete compressive strength(MPa, megapascals)`)

# Print the first few rows of the transformed dataframe to verify
head(df)

# Create the Q-Q plot using ggplot2
ggplot(data = data.frame(sample = df$`Log Concrete compressive strength(MPa, megapascals)`), aes(sample = sample)) +
  stat_qq(size = 2, color = "blue") +            # Q-Q points
  stat_qq_line(color = "orange") +               # Q-Q line
  xlab("Theoretical Quantiles") +                # X-axis label
  ylab("Sample Quantiles") +                     # Y-axis label
  ggtitle("`Concrete compressive strength")          # Title for the plot


# Apply square root transformation
df$`Square Root Concrete compressive strength(MPa, megapascals)` <- 
  sqrt(df$`Concrete compressive strength(MPa, megapascals)`)

# Print the first few rows of the transformed dataframe to verify
head(df)


# Create the Q-Q plot using ggplot2
ggplot(data = data.frame(sample = df$`Square Root Concrete compressive strength(MPa, megapascals)`), aes(sample = sample)) +
  stat_qq(size = 2, color = "blue") +            # Q-Q points
  stat_qq_line(color = "orange") +               # Q-Q line
  xlab("Theoretical Quantiles") +                # X-axis label
  ylab("Sample Quantiles") +                     # Y-axis label
  ggtitle("`Concrete compressive strength")          # Title for the plot




# Apply cube root transformation
df$cube_root <- 
  df$`Concrete compressive strength(MPa, megapascals)`^(1/3)

# Print the first few rows of the transformed dataframe to verify
head(df)

# Create the Q-Q plot using ggplot2
ggplot(data = data.frame(sample = df$cube_root), aes(sample = sample)) +
  stat_qq(size = 2, color = "blue") +            # Q-Q points
  stat_qq_line(color = "orange") +               # Q-Q line
  xlab("Theoretical Quantiles") +                # X-axis label
  ylab("Sample Quantiles") +                     # Y-axis label
  ggtitle("`Concrete compressive strength")          # Title for the plot
                                     



#now iam going to implement the chi-square method
#null hyposthesis is that there is no connection between concrete category and contain fly ashes
#alternative hyposthesis is that there is connection between concrete category and contain fly ashes

set.seed(42)
Contigency_table<-table(df$`Concrete Category`,df$`Contains Fly Ash`)
print(Contigency_table)

install.packages("ggplot2")
library(ggplot2)

# Create a bar plot using ggplot2
ggplot(df, aes(x = `Concrete Category`, fill = `Contains Fly Ash`)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Concrete Category vs Contains Fly Ash",
    x = "Concrete Category",
    y = "Count",
    fill = "Contains Fly Ash"
  ) +
  theme_minimal()

#now apply chi-square test of independence
Contigency_table<-table(df$`Concrete Category`,df$`Contains Fly Ash`)
print(Contigency_table)
chisq.test(Contigency_table)





#hypothesis 2
#Null Hypothesis (H₀): There is no significant difference in the mean Compressive Strength between the different Concrete Categories
#Alternative Hypothesis (H₁): There is a significant difference in the mean Compressive Strength between at least one pair of Concrete Categories

# kruskal_test (Concrete Category vs. Compressive Strength)
kruskal_test_result <- kruskal.test(`Concrete compressive strength(MPa, megapascals)` ~ `Concrete Category`, data = df)
print(kruskal_test_result)


#hypothesis 3
#Null Hypothesis (H₀): There is no significant relationship between the water-cement ratio and the compressive strength of concrete.
#Alternative Hypothesis (H₁): There is a significant inverse relationship between the water-cement ratio and the compressive strength of concrete.

# Calculate water-cement ratio (Water / Cement)
df$water_cement_ratio <- df$`Water  (component 4)(kg in a m^3 mixture)` / df$`Cement (component 1)(kg in a m^3 mixture)`

# Perform Spearman's rank correlation test between Water-Cement Ratio and Concrete Compressive Strength
cor_test_water_cement <- cor.test(df$water_cement_ratio, df$`Concrete compressive strength(MPa, megapascals)`, method = "spearman")

# Print the result
print(cor_test_water_cement)
