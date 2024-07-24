# Script for multiple linear regression 

library("car")
library("gridExtra")
library("ggpmisc")
library("tidyverse")
library("xlsx")
 
library(hms) 
library(tidyverse)
library(gridExtra)  
library(patchwork) # To display 2 charts together
library(grid)   

library(ggplot2)
library(gtable)
library(grid)
library(gridExtra)      
library(car)
library(MASS)
library(relaimpo) 

SV_Met_VDT <- read_csv("SV_Met_VDT.csv")
View(SV_Met_VDT)

SV_Met_VDT_MVS <- SV_Met_VDT%>%
  dplyr::select(V_CN, V_33D, V_55A, V_33A, V_55D, vpd, dnPAR, SM20, REW20cm, Tair)

## Multivariate regression analysis  

# Standardization 

SV_Met_std_VDT <- data.frame(scale(SV_Met_VDT_MVS[, c("V_CN", "V_33D", "V_55A", "V_33A", "V_55D", "vpd", "dnPAR", "SM20", "REW20cm", "Tair")]))

# CN

mod_std_CN = lm(V_CN  ~ Tair+dnPAR+REW20cm+vpd, data=SV_Met_std_VDT)
vif(mod_std_CN)
summary(mod_std_CN) 
stepAIC(mod_std_CN, direction="both")   

calc.relimp(mod_std_CN, rela=TRUE)
 
# 33D

mod_std_33D = lm(V_33D  ~ Tair+dnPAR+REW20cm+vpd, data=SV_Met_std_VDT)
vif(mod_std_33D)
summary(mod_std_33D) 
stepAIC(mod_std_33D, direction="both")

calc.relimp(mod_std_33D, rela=TRUE)

# 55A

mod_std_55A = lm(V_55A  ~ Tair+dnPAR+REW20cm+vpd, data=SV_Met_std_VDT)
vif(mod_std_55A)
summary(mod_std_55A) 
stepAIC(mod_std_55A, direction="both")

calc.relimp(mod_std_55A, rela=TRUE)

# 33A

mod_std_33A = lm(V_33A  ~ Tair+dnPAR+REW20cm+vpd, data=SV_Met_std_VDT)
vif(mod_std_33A)
summary(mod_std_33A) 
stepAIC(mod_std_33A, direction="both")

calc.relimp(mod_std_33A, rela=TRUE)

# 55D

mod_std_55D = lm(V_55D  ~ Tair+dnPAR+REW20cm+vpd, data=SV_Met_std_VDT)
vif(mod_std_55D)
summary(mod_std_55D) 
stepAIC(mod_std_55D, direction="both")  

calc.relimp(mod_std_55D, rela=TRUE)

# dly_SV_Met

dly_SV_Met <- read_csv("C:/Users/user/OneDrive - McMaster University/Documents/phd/Papers/Paper_IV/Manuscript/M4_V3_20240626/Data/dly_SV_Met.csv")

dly_SV_Met_VDT_MVS <- dly_SV_Met%>%
  dplyr::select(V_CN, V_33D, V_55A, V_33A, V_55D, vpdmean, dnPAR, SM20, REW20cm, Tairmean)

## Multivariate regression analysis  

# Standardization 

dly_SV_Met_std_VDT <- data.frame(scale(dly_SV_Met_VDT_MVS[, c("V_CN", "V_33D", "V_55A", "V_33A", "V_55D", "vpdmean", "dnPAR", "SM20", "REW20cm", "Tairmean")]))

# CN 

dly_mod_std_CN = lm(V_CN  ~ Tairmean+dnPAR+REW20cm+vpdmean, data=dly_SV_Met_std_VDT)
vif(dly_mod_std_CN)
summary(dly_mod_std_CN) 
stepAIC(dly_mod_std_CN, direction="both")

calc.relimp(dly_mod_std_CN, rela=TRUE)

# 33D

dly_mod_std_33D = lm(V_33D  ~ Tairmean+dnPAR+REW20cm+vpdmean, data=dly_SV_Met_std_VDT)
vif(dly_mod_std_33D)
summary(dly_mod_std_33D) 
stepAIC(dly_mod_std_33D, direction="both")

calc.relimp(dly_mod_std_33D, rela=TRUE)

# 55A

dly_mod_std_55A = lm(V_55A  ~ Tairmean+dnPAR+REW20cm+vpdmean, data=dly_SV_Met_std_VDT)
vif(dly_mod_std_55A)
summary(dly_mod_std_55A) 
stepAIC(dly_mod_std_55A, direction="both")

calc.relimp(dly_mod_std_55A, rela=TRUE)

# 33A

dly_mod_std_33A = lm(V_33A  ~ Tairmean+dnPAR+REW20cm+vpdmean, data=dly_SV_Met_std_VDT)
vif(dly_mod_std_33A)
summary(dly_mod_std_33A) 
stepAIC(dly_mod_std_33A, direction="both")

calc.relimp(dly_mod_std_33A, rela=TRUE)

# 55D

dly_mod_std_55D = lm(V_55D  ~ Tairmean+dnPAR+REW20cm+vpdmean, data=dly_SV_Met_std_VDT)
vif(dly_mod_std_55D)
summary(dly_mod_std_55D) 
stepAIC(dly_mod_std_55D, direction="both")  

calc.relimp(dly_mod_std_55D, rela=TRUE)

SV_Met_VDT_dly <- SV_Met_VDT %>%
  dplyr::group_by(Year, Month, Day)%>%
  dplyr::summarise(
    # Environmental controls
    Tair  = mean(Tair, na.rm=T), 
    vpd   = mean(vpd, na.rm=T), 
    dnPAR = mean(dnPAR, na.rm=T),
    # Environmental controls
    V_CN = mean(V_CN, na.rm=T), 
    V_33D = mean(V_33D, na.rm=T), 
    V_55A = mean(V_55A, na.rm=T),
    V_33A = mean(V_33A, na.rm=T), 
    V_55D = mean(V_55D, na.rm=T))%>% # Average daily total sap flow from the sample trees
  mutate(Date = make_date(Year, Month, Day))

SV_Met_long_dly <- gather(SV_Met_VDT_dly, condition, measurement, V_CN:V_55D, factor_key=TRUE)
View(SV_Met_long_dly)







