# EAR_VRH_sapflow

This repository contains several scripts associated with the paper "Evaluating Hysteresis Patterns in Sap Flow of a Red Pine Forest Subjected to Different Variable Retention Harvesting Treatments"

## Scripts Overview

### Script `1_jgr.R`
- Reads meteorological and sap flow data (`Met_VDT.csv`, `K_VDT.csv`, `K_VDT_9.csv`, `K_VDT_avg.csv`, `SV_VDT_DC_Avg.csv`, `Met_VDT_DC.csv`, `SV_Met_VDT.csv`, `dly_SV_Met.csv`, `mth_SV_Met.csv`)
- Calculates K values using the Granier empirical formula and computes sap flow velocity in centimetres per second.

### Script `2_jgr.R`
- Reads daily values of meteorological and sap flow data (`dly_SV_Met.csv`).
- Creates Figure 2 for the manuscript. Figure 2. Meteorological and soil moisture conditions. Daily averages of photosynthetic active radiation (PAR), air temperature (Tair), vapor pressure deficit (VPD), relative extractable water (REW) and daily total values of precipitation (P).

### Script `3_jgr.R`
- Reads half-hourly meteorological and sap flow velocity data, along with additional related files (`SV_Met_VDT.csv`, `SV_Met_VDT_Szn.csv`, `SV_Met_VDT_mth.csv`).
- Computes the diurnal cycle of these values per season.
- Creates Figure 3 for the manuscript.
- Figure 3. Diurnal patterns of sap flow velocity (SV) for different Variable Retention Harvesting (VRH) treatments. (a-e) Mean diurnal pattern of SV for all treatments for spring, summer, and fall of 2023; (f-j) Mean diurnal pattern of SV per month per VRH treatment for the growing season (April-November) of 2023. 

### Script `4_jgr.R`
- Reads seasonal diurnal cycle data for sap flow and meteorological variables (`SV_Met_VDT_Szn.csv`).
- Creates Figure 4 for the manuscript.
Figure 4. Hysteresis responses of sap flow velocity (SV) to environmental controls in each Variable Retention Harvesting (VRH) treatment and control plot. (a-e) photosynthetic active radiation (PAR); (f-j) air temperature (Tair); and (k-o) vapor pressure deficit (VPD). Data points are hourly values averaged per season including fall (yellow lines), spring (magenta lines), and summer (red lines). The solid blue arrows indicate the direction of the response in the morning and the yellow one indicates the direction of response in the afternoon. The area enclosed by the SV trajectories indicates the strength of the hysteresis loop.

### Script `5_jgr.R`
- Reads monthly-averaged diurnal cycle data for sap flow and meteorological variables (`SV_Met_VDT_mth.csv`).
- Creates Figure 5 for the manuscript.
Figure 5. Hysteresis response of sap flow velocity (SV) to environmental controls over the growing season from April to November in each Variable Retention Harvesting (VRH) treatment and control plot. (a-e) photosynthetic active radiation (PAR); (f-j) air temperature (Tair); and (k-o) vapor pressure deficit (VPD). Data points are hourly values averaged per season. The solid blue arrows indicate the direction of the response in the morning and the yellow one indicates the direction of response in the afternoon. The area enclosed by the SV trajectories indicates the strength of the hysteresis loop.

### Script `6_jgr.R`
- Reads half-hourly and daily meteorological and sap flow velocity values (`SV_Met_VDT.csv`, `dly_SV_Met.csv`)
- Creates regression and principal component analysis plots.
- Produces Figure 6 for the manuscript.
Figure 6. Response of sap flow velocity (SV) to meteorological variables and soil water stress. (a) Principal Component Analysis (PCA) applied to daily SV values in 2023. The first two principal components, PC1 and PC2, accounted for 79.3% and 8.1% of the total variance, respectively. Correlations between bin-average SV values and (b) photosynthetic active radiation, PAR (bin of 60 umol m-2 h-1); (c) air temperature, Tair (bin of 0.5 °C); (d) vapor pressure deficit. VPD (bin of 0.05 kPa); and (e) relative extractable water, REW (bin of 0.02) for each Variable Retention Harvesting (VRH) treatments (i.e. 33A, 33D, 55A, 55D) and the control plot, CN.

### Script `7_jgr.R`
- Reads half-hourly and daily meteorological data and sap flow velocity values (`SV_Met_VDT.csv`, `dly_SV_Met.csv`)
- Calculates multiple linear regression for half-hourly and daily sap flow and meteorological values.

### Script `S1_jgr.R`
- Reads half-hourly meteorological and sap flow velocity data (`SV_Met_VDT.csv`)
- Plots the diurnal cycle of sap flow velocity across VRH treatments and environmental variables for days with contrasting climatic conditions.
Figure S1. Diurnal cycles half-hourly values of sap flow velocity (SV) and environmental variables. (a-c) SV, (d-f) photosynthetic active radiation (PAR) and air temperature (Tair) and (g-i) vapor pressure deficit (VPD) and relative extractable water (REW) on August 29th, September 7th and September 9th in 2023. Dashed vertical lines indicate noon time.

### Script `S2_jgr.R`
- Reads half-hourly meteorological and sap flow velocity data (`SV_Met_VDT.csv`)
- Plots the hysteresis patterns of sap flow velocity across VRH treatments in relation to environmental variables for days with contrasting climatic conditions.
Figure S2. Hysteresis responses of sap flow velocity (SV) against environmental variables including (a-c) photosynthetic active radiation (PAR), (d-f) air temperature (Tair) and (g-i) vapor pressure deficit (VPD) on August 29th, September 7th and September 9th in 2023.

## CSV file descriptions
`Met_VDT.csv`: Contains half-hourly values of meteorological variables.
`K_VDT.csv`: Includes dimensionless K variables and raw differential voltage values for all sensors.
`K_VDT_9.csv`: Provides K values and differential voltage values for all sensors.
`K_VDT_avg.csv`: Displays average K values by VRH treatment.
`SV_VDT_DC_Avg.csv`: Shows the diurnal cycle of K values and sap flow velocity (SV) averaged by treatment.
`Met_VDT_DC.csv`: Provides the diurnal cycle for environmental variables.
`mth_SV_Met.csv`: Contains monthly values of transpiration, environmental variables, and sap flow velocity.
`SV_Met_VDT.csv`: Includes half-hourly values of sap flow velocity and environmental variables.
`SV_Met_VDT_Szn.csv`: Presents the diurnal cycle of sap flow velocity and environmental variables by season.
`SV_Met_VDT_mth.csv`: Provides the diurnal cycle of sap flow velocity and environmental variables per month.
`dly_SV_Met.csv`: Contains daily values of transpiration, environmental variables, dimensionless K variables, and sap flow velocity.
