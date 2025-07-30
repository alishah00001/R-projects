
## Key Analyses Performed

### Part 1: Concrete Compressive Strength Analysis
**Dataset:** Concrete Compressive Strength (1030 observations, 9 variables)

#### 1. Exploratory Data Analysis (EDA)
- Descriptive statistics for all numeric variables
- Visualization techniques:
  - Histograms of all features
  - Density plots
  - Boxplots (by concrete category and fly ash content)
  - Correlation matrix and heatmap
  - Scatter plots with regression lines

#### 2. Correlation Analysis
- Pearson/Spearman correlation based on data distribution
- Point-biserial correlation for categorical-numeric relationships
- Key findings:
  - Cement shows strongest positive correlation with strength (ρ=0.48)
  - Water shows negative correlation (ρ=-0.29)
  - Fly ash has weak negative correlation (r=-0.063)

#### 3. Regression Modeling
- Stepwise model development:
  - SLR: Strength = 13.44 + 0.08·Cement (R²=0.24)
  - MLR: Added Superplasticizer (R²=0.35)
  - Final MLR: 
    Strength = 97.47 + 0.075·Cement + 0.407·Superplasticizer - 0.216·Water - 0.037·FineAgg - 0.021·CoarseAgg + 0.041·Slag (R²=0.44)
- Assumption checking:
  - Linearity ✅ 
  - Homoscedasticity ✅ 
  - Normality of residuals ✅ 
  - No multicollinearity (VIF<5) ✅

#### 4. Hypothesis Testing
1. Fly ash vs. concrete category (χ² test: p=0.85 → No association)
2. Strength across categories (Kruskal-Wallis: p=0.21 → No significant difference)
3. Water-cement ratio vs. strength (Spearman: ρ=-0.52, p<0.05 → Significant inverse relationship)

---

### Part 2: Time Series Analysis (UK Live Births)
**Dataset:** Annual live births in England/Wales (1900-2021)

#### 1. Data Exploration
- Time series decomposition (trend + irregular components)
- SMA smoothing (n=25) revealed:
  - Gradual increase (1900-1945)
  - Baby boom (1945-1970)
  - Decline (2000-present)

#### 2. Modeling Approaches
**A. Holt's Exponential Smoothing**
- Parameters: α=1 (full weight to recent obs), β=0.023
- Forecast showed continued decline
- SSE = 1,297,903
- Error analysis: 
  - No autocorrelation (Ljung-Box p=0.62)
  - Normally distributed residuals

**B. ARIMA Modeling**
- Stationarity achieved with 1st differencing (ADF p<0.05)
- ACF/PACF analysis → ARIMA(0,1,1)
- Forecast equation: Xₜ - μ = Zₜ - 0.0342·Zₜ₋₁
- Error analysis showed:
  - Constant variance ✅
  - Normal distribution ✅

#### 3. Model Comparison
| Model | Advantages | Limitations |
|-------|------------|-------------|
| **Holt's** | Simpler implementation, Good for short-term forecasts | Less suited for long-term trends |
| **ARIMA** | Better handles autocorrelation, More statistical rigor | Requires stationary data |

**Recommendation:** ARIMA (0,1,1) is preferred due to better handling of the observed autocorrelation structure.

