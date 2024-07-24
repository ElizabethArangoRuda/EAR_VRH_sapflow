# EAR_VRH_sapflow

This repository contains several scripts associated with the paper "Evaluating Hysteresis Patterns in Sap Flow of a Red Pine Forest Subjected to Different Variable Retention Harvesting Treatments"

## Scripts Overview

### Script `1_jgr.R`
- Reads meteorological and sap flow data.
- Computes K values using the Garnier empirical formula and sap flow velocity values in cm per second.

### Script `2_jgr.R`
- Reads daily values of meteorological and sap flow data (`dly_SV_Met.csv`).
- Creates Figure 2 for the manuscript. Figure 2. Meteorological and soil moisture conditions. Daily averages of photosynthetic active radiation (PAR), air temperature (Tair), vapor pressure deficit (VPD), relative extractable water (REW) and daily total values of precipitation (P).

### Script `3_jgr.R`
- Reads half-hourly meteorological and sap flow velocity values (`SV_Met_VDT.csv`).
- Computes the diurnal cycle of these values per season.
- Creates Figure 3 for the manuscript.
- Figure 3. Diurnal patterns of sap flow velocity (SV) for different Variable Retention Harvesting (VRH) treatments. (a-e) Mean diurnal pattern of SV for all treatments for spring, summer, and fall of 2023; (f-j) Mean diurnal pattern of SV per month per VRH treatment for the growing season (April-November) of 2023. 

### Script `4_jgr.R`
- Reads data with the diurnal cycle of sap flow and meteorological data averaged by seasons (`SV_Met_VDT_Szn.csv`).
- Creates Figure 4 for the manuscript.
- Figure 4. Hysteresis responses of sap flow velocity (SV) to environmental controls in each Variable Retention Harvesting (VRH) treatment and control plot. (a-e) photosynthetic active radiation (PAR); (f-j) air temperature (Tair); and (k-o) vapor pressure deficit (VPD). Data points are hourly values averaged per season including fall (yellow lines), spring (magenta lines), and summer (red lines). The solid blue arrows indicate the direction of the response in the morning and the yellow one indicates the direction of response in the afternoon. The area enclosed by the SV trajectories indicates the strength of the hysteresis loop. 

### Script `5_jgr.R`
- Reads data with the diurnal cycle of sap flow and meteorological data averaged by month (`SV_Met_VDT_mth.csv`).
- Creates Figure 5 for the manuscript.
- Figure 5. Hysteresis response of sap flow velocity (SV) to environmental controls over the growing season from April to November in each Variable Retention Harvesting (VRH) treatment and control plot. (a-e) photosynthetic active radiation (PAR); (f-j) air temperature (Tair); and (k-o) vapor pressure deficit (VPD). Data points are hourly values averaged per season. The solid blue arrows indicate the direction of the response in the morning and the yellow one indicates the direction of response in the afternoon. The area enclosed by the SV trajectories indicates the strength of the hysteresis loop.

### Script `6_jgr.R`
- Creates regression and principal component analysis plots.
- Produces Figure 6 for the manuscript.
- Figure 6. Response of sap flow velocity (SV) to meteorological variables and soil water stress. (a) Principal Component Analysis (PCA) applied to daily SV values in 2023. The first two principal components, PC1 and PC2, accounted for 79.3% and 8.1% of the total variance, respectively. Correlations between bin-average SV values and (b) photosynthetic active radiation, PAR (bin of 60 umol m-2 h-1); (c) air temperature, Tair (bin of 0.5 °C); (d) vapor pressure deficit. VPD (bin of 0.05 kPa); and (e) relative extractable water, REW (bin of 0.02) for each Variable Retention Harvesting (VRH) treatments (i.e. 33A, 33D, 55A, 55D) and the control plot, CN. 

### Script `7_jgr.R`
- Calculates multiple linear regression for half-hourly and daily sap flow and meteorological values.

