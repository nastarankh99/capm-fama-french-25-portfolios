# capm-fama-french-25-portfolios
This is a small R project where I test the CAPM using the classic Fama–French 25 size × value portfolios (monthly, 1926–2019).

I:
1. plot the market excess return (Mkt–RF) and compute its Sharpe ratio
3. estimate 25 time-series betas (each portfolio regressed on Mkt–RF)
4. run a cross-sectional regression of average portfolio returns on those betas (the CAPM pricing step)
5. make a few simple plots/tables

# packages 
install.packages(c(
  "tidyverse", "readr", "dplyr", "ggplot2", 
  "broom", "lubridate", "scales"

# how to run 
Using the csv files in the data folder, run the R code script.

# results
<img width="1344" height="960" alt="image" src="https://github.com/user-attachments/assets/34cd8a54-e5b6-4e9c-baba-d012d4e5a1aa" />

Highest & Lowest average return:
SMALL HiBM is shown to have the Maximum avg return: 1.57716525198939
SMALL LoBM is shown to have the Minimum avg return: 0.860613351016799

Beta estimates:
 [1] 1.6136542 1.3990347 1.3634427 1.2630780 1.3694661 1.2634247 1.2239634
 [8] 1.1941243 1.2060977 1.3785976 1.2437458 1.1229048 1.1166630 1.1622666
[15] 1.3722223 1.0879264 1.0782072 1.1099642 1.1576959 1.4090596 0.9529740
[22] 0.9443749 0.9662222 1.1007852 1.3037361

<img width="1344" height="960" alt="image" src="https://github.com/user-attachments/assets/f89797a7-caa5-4c8f-a74e-dc402d564191" />




