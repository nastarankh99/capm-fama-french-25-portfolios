library(readr)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(rmarkdown)

factors_file_path <- "C:/Users/98910/Desktop/Econ815-PS1/Fama_French_Factors_Clean.csv"

#### Read the Fama-French factors data

Fama_Factors <- read_csv(factors_file_path)



# Plot the market excess return over time
ggplot(Fama_Factors, aes(x = 1:nrow(Fama_Factors), y = `Mkt-RF`)) +
  geom_line(color = "darkgreen") +
  labs(title = "Market Excess Return (Mkt-RF) Over Time",
       x = "Date",
       y = "Excess Return (%)")



Fama_Factors_Data <- mutate(Fama_Factors, Mkt=`Mkt-RF` + `RF`)

# Calculate the mean of market excess return (Mkt.RF)
mean_return <- mean(Fama_Factors$`Mkt-RF`, na.rm = TRUE)
market_std <- sd(Fama_Factors$`Mkt-RF`, na.rm = TRUE)
sharpe_ratio <- mean_return / market_std



ports_file_path <- "C:/Users/98910/Desktop/Econ815-PS1/Fama_French_Ports_Clean.csv"
Fama_Ports_Data <- read_csv(ports_file_path)
mean1= colMeans(Fama_Ports_Data)
mean1[2:26]
max_return <- max(mean1[2:26])
min_return <- min(mean1[2:26])





market_excess_return <- Fama_Factors_Data$`Mkt-RF`

# Initialize a vector to store beta estimates
beta_estimates <- numeric(25)
intercept_estimates <- numeric(25)

# Run 25 separate bivariate regressions and save the beta estimates
for (i in 2:26) {  # Assuming portfio returns are in columns 2 to 26
  regression_result <- lm(Fama_Ports_Data[[i]] ~ market_excess_return, na.action = na.exclude)
  beta_estimates[i - 1] <- coef(regression_result)[2]  # Save the beta coefficient (slope)
  intercept_estimates[i - 1] <- coef(regression_result)[1]  # Save the intercept coefficient
}

# Print the beta estimates
print(beta_estimates)
print(intercept_estimates)
