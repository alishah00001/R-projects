# Applied Statistics and Data Visualization Project - Key Findings

## Project Overview

This project involved a comprehensive statistical analysis and data visualization assignment, focusing on:
1.  Exploratory Data Analysis (EDA) and regression modeling of concrete compressive strength.
2.  Time series analysis of live births in England and Wales.

The analysis was conducted in R, with an emphasis on statistical techniques, visualization methods, and model interpretation.

## Key Findings from Analyses

### Part 1: Concrete Compressive Strength Analysis

**Dataset:** Concrete Compressive Strength (1030 observations, 9 variables)

#### Exploratory Data Analysis (EDA) Insights:
* Descriptive statistics were generated for all numeric variables.
* Various visualization techniques (histograms, density plots, boxplots, correlation matrix/heatmap, scatter plots with regression lines) were used to understand data distribution and relationships.

#### Correlation Analysis Findings:
* **Cement** showed the strongest positive correlation with concrete compressive strength (ρ=0.48). This indicates that higher cement content generally leads to higher strength.
* **Water** exhibited a negative correlation with strength (ρ=-0.29), suggesting that increased water content tends to decrease strength.
* **Fly ash** had a weak negative correlation (r=-0.063) with strength.
* **Pearson/Spearman correlation** was applied based on data distribution.
* **Point-biserial correlation** was used for categorical-numeric relationships.

#### Regression Modeling Outcomes:
* **Simple Linear Regression (SLR):** An initial model `Strength = 13.44 + 0.08·Cement` explained 24% of the variance (R²=0.24).
* **Multiple Linear Regression (MLR) - Stepwise Development:**
    * Adding `Superplasticizer` to the model significantly improved its explanatory power (R²=0.35).
    * The **final MLR model** was: `Strength = 97.47 + 0.075·Cement + 0.407·Superplasticizer - 0.216·Water - 0.037·FineAgg - 0.021·CoarseAgg + 0.041·Slag`. This model accounted for 44% of the variance in concrete strength (R²=0.44).
* **Model Assumption Checks (all passed):**
    * Linearity of relationships.
    * Homoscedasticity (constant variance of residuals).
    * Normality of residuals.
    * No significant multicollinearity (VIF < 5).

#### Hypothesis Testing Results:
* **Fly ash vs. concrete category:** A Chi-squared test (p=0.85) indicated **no significant association** between fly ash content and concrete category.
* **Strength across concrete categories:** A Kruskal-Wallis test (p=0.21) found **no significant difference** in compressive strength across different concrete categories.
* **Water-cement ratio vs. strength:** A Spearman correlation (ρ=-0.52, p<0.05) confirmed a **significant inverse relationship**, meaning a higher water-cement ratio is associated with lower concrete strength.

### Part 2: Time Series Analysis (UK Live Births)

**Dataset:** Annual live births in England/Wales (1900-2021)

#### Data Exploration Findings:
* Time series decomposition revealed distinct trend and irregular components.
* A Simple Moving Average (SMA) smoothing (n=25) highlighted key periods:
    * A gradual increase in live births from 1900 to 1945.
    * A prominent "baby boom" period between 1945 and 1970.
    * A noticeable decline in live births from 2000 to the present.

#### Modeling Approaches & Outcomes:

**A. Holt's Exponential Smoothing:**
* **Parameters:** α=1 (full weight to recent observations), β=0.023.
* **Forecast:** Showed a continued decline in live births.
* **Error:** Sum of Squared Errors (SSE) = 1,297,903.
* **Error Analysis:**
    * No significant autocorrelation in residuals (Ljung-Box p=0.62).
    * Residuals were normally distributed.

**B. ARIMA Modeling:**
* **Stationarity:** Achieved after **first differencing** (ADF p<0.05).
* **Model Identification (ACF/PACF):** Led to the selection of an **ARIMA(0,1,1)** model.
* **Forecast Equation:** Xₜ - μ = Zₜ - 0.0342·Zₜ₋₁ (where Zₜ represents the error term).
* **Error Analysis:**
    * Constant variance of residuals was observed.
    * Residuals followed a normal distribution.

#### Model Comparison and Recommendation:
* **Holt's Exponential Smoothing:** Simpler to implement and effective for short-term forecasts, but less suited for capturing long-term trends.
* **ARIMA Modeling:** Better at handling autocorrelation and provides more statistical rigor, but requires data stationarity.

**Recommendation:** The **ARIMA(0,1,1) model is preferred** due to its superior ability to handle the observed autocorrelation structure in the live birth time series data.
