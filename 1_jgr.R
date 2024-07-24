# Read meteorological and sap flow data

library(hms)
library(tidyverse)
library(data.table)

# SV_Met_VDT <- read_csv("~/phd/Papers/Paper_IV/Manuscript/Files/SV_Met_VDT_Avg.csv")

# Read met data

getwd()
Met_VDT <- read_csv("Met_VDT.csv")

# Met_VDT <- data.frame(
#   Day = rep(NA, 17520),    # NA represents missing values (empty)
#   Month = rep(NA, 17520),
#   Year = rep(NA, 17520)
# )
#  
# Met_VDT$Tair      <- TP39_Met_23_2$Tair
# Met_VDT$RH        <- TP39_Met_23_2$RH
# Met_VDT$dnPAR     <- TP39_Met_23_2$dnPAR
# Met_VDT$upPAR     <- TP39_Met_23_2$upPAR
# Met_VDT$Rain      <- TP39_Met_23_2$Rain
# Met_VDT$SM20B     <- TP39_Met_23_2$SM20B
# Met_VDT$SM50B     <- TP39_Met_23_2$SM50B
# Met_VDT$REW20cm   <- TP39_Met_23_2$REW20cm
# Met_VDT$REW50cm   <- TP39_Met_23_2$REW50cm
# Met_VDT$vpd       <- TP39_Met_23_2$vpd
# Met_VDT$Day       <- TP39_Met_23_2$Day
# Met_VDT$Month     <- TP39_Met_23_2$Month
# Met_VDT$Year      <- TP39_Met_23_2$Year 
# Met_VDT$Doy       <- TP39_Met_23_2$Doy
# Met_VDT$Hour      <- TP39_Met_23_2$Hour

# Read sap flow data

K_VDT <- read_csv("K_VDT.csv")

## Dimensionless variable K   

# K_VDT <- data.frame(
#   Day = rep(NA, 8465),    # NA represents missing values (empty)
#   Month = rep(NA, 8465),
#   Year = rep(NA, 8465)
# )

# Sap flow

# K_VDT$Time      <- SF_VDT_23$Time
# K_VDT$B1_CN_23  <-  SF_VDT_23$B1_CN_23
# K_VDT$B1_33D_23 <-  SF_VDT_23$B1_33D_23
# K_VDT$B1_55A_23 <-  SF_VDT_23$B1_55A_23
# K_VDT$B2_33A_23 <-  SF_VDT_23$B2_33A_23
# K_VDT$B2_33D_23 <-  SF_VDT_23$B2_33D_23
# K_VDT$B2_55A_23 <-  SF_VDT_23$B2_55A_23
# K_VDT$B3_33A_23 <-  SF_VDT_23$B3_33A_23
# K_VDT$B3_55D_23 <-  SF_VDT_23$B3_55D_23
# K_VDT$B3_CN_23  <-  SF_VDT_23$B3_CN_23

# View(SF_VDT_23)
# 
# # Convert 'time_stamp' column to POSIXct objects
# K_VDT$Time <- as.POSIXct(K_VDT$Time)
# 
# # Shift time stamps one hour backward
# K_VDT$Time <-K_VDT$Time - dhours(1)
# 
# K_VDT$Doy <- format(K_VDT$Time, "%j")
# K_VDT$Day     <- day(K_VDT$Time)
# K_VDT$Month   <- month(K_VDT$Time)
# K_VDT$Year    <- year(K_VDT$Time)
# K_VDT$Hour    <- hour(K_VDT$Time)
# 
# View(K_VDT)
# 
# K_VDT <- K_VDT[-1, ]
# 
# # Calculate max conditions
# 
# VDT_B1_CN_23max <- aggregate(B1_CN_23 ~ Doy, 
#                              data = K_VDT, 
#                              FUN = max,
#                              subset = Hour >= 0 & Hour <= 10)
# 
# VDT_B1_CN_23max$B1_CNmax <- VDT_B1_CN_23max$B1_CN_23
# VDT_B1_CN_23max$B1_CN_23 <- c()
# length(VDT_B1_CN_23max$B1_CNmax) # 274
# 
# # B1_33D_23
# 
# VDT_B1_33D_23max <- aggregate(B1_33D_23 ~ Doy, 
#                               data = K_VDT, 
#                               FUN = max,
#                               subset = Hour >= 0 & Hour <= 10)
# 
# VDT_B1_33D_23max$B1_33Dmax <- VDT_B1_33D_23max$B1_33D_23
# VDT_B1_33D_23max$B1_33D_23 <- c()
# length(VDT_B1_33D_23max$B1_33Dmax) # 154
#  
# # B1_55A_23
# 
# VDT_B1_55A_23max <- aggregate(B1_55A_23 ~ Doy, 
#                               data = K_VDT, 
#                               FUN = max,
#                               subset = Hour >= 0 & Hour <= 10)
# 
# VDT_B1_55A_23max$B1_55Amax <- VDT_B1_55A_23max$B1_55A_23
# VDT_B1_55A_23max$B1_55A_23 <- c()
# length(VDT_B1_55A_23max$B1_55Amax) # 274
# 
# # B2_33A_23
# 
# VDT_B2_33A_23max <- aggregate(B2_33A_23 ~ Doy, 
#                               data = K_VDT, 
#                               FUN = max,
#                               subset = Hour >= 0 & Hour <= 10)
# 
# VDT_B2_33A_23max$B2_33Amax <- VDT_B2_33A_23max$B2_33A_23
# VDT_B2_33A_23max$B2_33A_23 <- c()
# length(VDT_B2_33A_23max$B2_33Amax) # 357
# 
# # B2_33D_23
# 
# VDT_B2_33D_23max <- aggregate(B2_33D_23 ~ Doy, 
#                               data = K_VDT, 
#                               FUN = max,
#                               subset = Hour >= 0 & Hour <= 10)
# 
# VDT_B2_33D_23max$B2_33Dmax <- VDT_B2_33D_23max$B2_33D_23
# VDT_B2_33D_23max$B2_33D_23 <- c()
# length(VDT_B2_33D_23max$B2_33Dmax) # 357
# 
# # B2_55A_23
# 
# VDT_B2_55A_23max <- aggregate(B2_55A_23 ~ Doy, 
#                               data = K_VDT, 
#                               FUN = max,
#                               subset = Hour >= 0 & Hour <= 10)
# 
# VDT_B2_55A_23max$B2_55Amax <- VDT_B2_55A_23max$B2_55A_23
# VDT_B2_55A_23max$B2_55A_23 <- c()
# length(VDT_B2_55A_23max$B2_55Amax) # 310
# 
# # B3_33A_23
# 
# VDT_B3_33A_23max <- aggregate(B3_33A_23 ~ Doy, 
#                               data = K_VDT, 
#                               FUN = max,
#                               subset = Hour >= 0 & Hour <= 10)
# 
# VDT_B3_33A_23max$B3_33Amax <- VDT_B3_33A_23max$B3_33A_23
# VDT_B3_33A_23max$B3_33A_23 <- c()
# length(VDT_B3_33A_23max$B3_33Amax) # 323
# 
# # B3_55D_23
# 
# VDT_B3_55D_23max <- aggregate(B3_55D_23 ~ Doy, 
#                               data  = K_VDT, 
#                               FUN = max,
#                               subset = Hour >= 0 & Hour <= 10)
# 
# VDT_B3_55D_23max$B3_55Dmax <- VDT_B3_55D_23max$B3_55D_23
# VDT_B3_55D_23max$B3_55D_23 <- c()
# length(VDT_B3_55D_23max$B3_55Dmax) # 323
# 
# # B3_CN_23
# 
# VDT_B3_CN_23max <- aggregate(B3_CN_23 ~ Doy, 
#                              data = K_VDT, 
#                              FUN = max,
#                              subset = Hour >= 0 & Hour <= 10)
# 
# VDT_B3_CN_23max$B3_CNmax <- VDT_B3_CN_23max$B3_CN_23
# VDT_B3_CN_23max$B3_CN_23 <- c()
# length(VDT_B3_CN_23max$B3_CNmax) # 323
# 
# # Merge dTM values to the original dataset
# K_VDT_1 <- merge(K_VDT, VDT_B1_CN_23max, by = 'Doy', all.x=TRUE)
# K_VDT_2 <- merge(K_VDT_1, VDT_B1_33D_23max, by = 'Doy', all.x=TRUE)
# K_VDT_3 <- merge(K_VDT_2, VDT_B1_55A_23max, by = 'Doy', all.x=TRUE)
# K_VDT_4 <- merge(K_VDT_3, VDT_B2_33A_23max, by = 'Doy', all.x=TRUE)
# K_VDT_5 <- merge(K_VDT_4, VDT_B2_33D_23max, by = 'Doy', all.x=TRUE)
# K_VDT_6 <- merge(K_VDT_5, VDT_B2_55A_23max, by = 'Doy', all.x=TRUE)
# K_VDT_7 <- merge(K_VDT_6, VDT_B3_33A_23max, by = 'Doy', all.x=TRUE)
# K_VDT_8 <- merge(K_VDT_7, VDT_B3_55D_23max, by = 'Doy', all.x=TRUE)
# K_VDT_9 <- merge(K_VDT_8, VDT_B3_CN_23max, by = 'Doy', all.x=TRUE)
# 
# View(K_VDT_9)

# Read processed raw data

K_VDT_9 <- read_csv("K_VDT_9.csv")

plot(K_VDT_9$B3_33A_23, # Sensible heat (Hs)
     type="l", 
     #ylim=c(0,12),
     lwd = 2,
     col="red"
)

## Dimensionless variable K 

# K_VDT_9$k_B1CN  <- (K_VDT_9$B1_CNmax - K_VDT_9$B1_CN_23) / K_VDT_9$B1_CN_23
# K_VDT_9$k_B133D <- (K_VDT_9$B1_33Dmax - K_VDT_9$B1_33D_23) / K_VDT_9$B1_33D_23
# K_VDT_9$k_B155A <- (K_VDT_9$B1_55Amax - K_VDT_9$B1_55A_23) / K_VDT_9$B1_55A_23
# K_VDT_9$k_B233A <- (K_VDT_9$B2_33Amax - K_VDT_9$B2_33A_23) / K_VDT_9$B2_33A_2
# K_VDT_9$k_B233D <- (K_VDT_9$B2_33Dmax - K_VDT_9$B2_33D_23) / K_VDT_9$B2_33D_23
# K_VDT_9$k_B255A <- (K_VDT_9$B2_55Amax - K_VDT_9$B2_55A_23) / K_VDT_9$B2_55A_23
# K_VDT_9$k_B333A <- (K_VDT_9$B3_33Amax - K_VDT_9$B3_33A_23) / K_VDT_9$B3_33A_23
# K_VDT_9$k_B355D <- (K_VDT_9$B3_55Dmax - K_VDT_9$B3_55D_23) / K_VDT_9$B3_55D_23
# K_VDT_9$k_B3CN  <- (K_VDT_9$B3_CNmax - K_VDT_9$B3_CN_23) / K_VDT_9$B3_CN_23

# Plot of sap velocity in m/s
plot(K_VDT_9$k_B233A,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DateTimeDOY",
     ylab = "B2A33",
     #ylim = c(0, 0.01),
     main = "Plot of DiffV_16_AVG vs. DateTimeDOY")
lines(K_VDT_9$k_B233D, # Sap_dT_Tree4
      lwd = 2,
      col="green")
lines(K_VDT_9$k_B255A, # Sap_dT_Tree4
      lwd = 2,
      col="yellow")
lines(K_VDT_9$k_B355D, # Sap_dT_Tree4
      lwd = 2,
      col="blue")
lines(K_VDT_9$k_B3CN, # Sap_dT_Tree4
      lwd = 2,
      col="red")

# Make values in K_VDT_9$k_B255A NA from row 6328

# row_index <- 6328
# column_name <- "k_B255A"
# 
# # Making values NA from row 6328 onwards
# K_VDT_9[row_index:nrow(K_VDT_9), column_name] <- NA
# 
# View(K_VDT_9)

# Read K values average per treatment

K_VDT_avg <- read_csv("K_VDT_avg.csv")

# Average K values per plot

# K_VDT_avg <- K_VDT_9 %>%
#   mutate(k_CN = rowMeans(select(., 
#                                 k_B1CN,
#                                 k_B3CN),
#                          na.rm = TRUE),
#          k_33D = rowMeans(select(., 
#                                  k_B133D,
#                                  k_B233D),
#                           na.rm = TRUE),
#          k_55A = rowMeans(select(., 
#                                  k_B155A, 
#                                  k_B255A), 
#                           na.rm = TRUE),
#          k_33A = rowMeans(select(., 
#                                  k_B233A, 
#                                  k_B333A), 
#                           na.rm = TRUE))%>%
#   rename(K_55D = k_B355D)
# 
# View(K_VDT_avg)

# Avg k control

plot(K_VDT_9$k_B1CN,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DOY", 
     ylab = "Sap flow velocity (cm s-1)",
     main = "Control treatment",
     #ylim = c(0, 0.01),
     col="turquoise4")
lines(K_VDT_9$k_B3CN, # Latent Heat Flux (LE)
      lwd = 2,
      col="green")
lines(K_VDT_9$k_CN, # Latent Heat Flux (LE)
      lwd = 2,
      col="red")

# Avg k 33 Dispersed

plot(K_VDT_9$k_B133D,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DOY", 
     ylab = "Sap flow velocity (cm s-1)",
     main = "Control treatment",
     #ylim = c(0, 0.01),
     col="turquoise4")
lines(K_VDT_9$k_B233D, # Latent Heat Flux (LE)
      lwd = 2,
      col="green")
lines(K_VDT_avg$k_33D, # Latent Heat Flux (LE)
      lwd = 2,
      col="red")

# Avg k 55 Aggregate

plot(K_VDT_9$k_B155A,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DOY", 
     ylab = "Sap flow velocity (cm s-1)",
     main = "Control treatment",
     #ylim = c(0, 0.01),
     col="turquoise4")
lines(K_VDT_9$k_B255A, # Latent Heat Flux (LE)
      lwd = 2,
      col="green")
lines(K_VDT_avg$k_55A, # Latent Heat Flux (LE)
      lwd = 2,
      col="red")

# Avg k 33 Aggregate

plot(K_VDT_9$k_B233A,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DOY", 
     ylab = "Sap flow velocity (cm s-1)",
     main = "Control treatment",
     #ylim = c(0, 0.01),
     col="turquoise4")
lines(K_VDT_9$k_B333A, # Latent Heat Flux (LE)
      lwd = 2,
      col="green")
lines(K_VDT_avg$k_33A, # Latent Heat Flux (LE)
      lwd = 2,
      col="red")

# Sapflow velocity (cm/s) following Dynamax

# K_VDT_avg <- K_VDT_avg %>%
#   select(Day, Month, Year, Doy, Hour, TimeS, k_CN, k_33D, k_55A, k_33A, K_55D)

View(K_VDT_avg)

# Sap flow velocity following Dynamax per treatment

# K_VDT_avg$V_CN <- ifelse(K_VDT_avg$k_CN > 0, 0.0119 * K_VDT_avg$k_CN^1.231, 0)
# K_VDT_avg$V_33D <- ifelse(K_VDT_avg$k_33D > 0, 0.0119 *K_VDT_avg$k_33D^1.231, 0)
# K_VDT_avg$V_55A <- ifelse(K_VDT_avg$k_55A > 0, 0.0119 * K_VDT_avg$k_55A^1.231, 0)
# K_VDT_avg$V_33A <- ifelse(K_VDT_avg$k_33A > 0, 0.0119 * K_VDT_avg$k_33A^1.231, 0)
# K_VDT_avg$V_55D <- ifelse(K_VDT_avg$K_55D > 0, 0.0119 * K_VDT_avg$K_55D^1.231, 0)

plot(K_VDT_avg$V_CN,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DOY", 
     ylab = "Sap flow velocity (cm s-1)",
     main = "Control treatment",
     #ylim = c(0, 0.01),
     col="turquoise4")  

plot(K_VDT_avg$V_33D,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DOY", 
     ylab = "Sap flow velocity (cm s-1)",
     main = "33% Dispersed treatment",
     ylim = c(0, 0.01),
     col="turquoise4")

plot(K_VDT_avg$V_55A,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DOY", 
     ylab = "Sap flow velocity (cm s-1)",
     main = "55% Aggregate treatment",
     ylim = c(0, 0.01),
     col="turquoise4")

plot(K_VDT_avg$V_33A,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DOY", 
     ylab = "Sap flow velocity (cm s-1)",
     main = "33% Aggregate treatment",
     ylim = c(0, 0.01),
     col="turquoise4")

plot(K_VDT_avg$V_55D,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DOY", 
     ylab = "Sap flow velocity (cm s-1)",
     main = "55% Dispersed treatment",
     ylim = c(0, 0.01),
     col="turquoise4")

# Sap flow velocity (cm/h)

plot(K_VDT_avg$V_CN*3600,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DOY", 
     ylab = "Sap flow velocity (cm h-1)",
     main = "Control treatment",
     ylim = c(0, 30),
     col="slateblue1")

plot(K_VDT_avg$V_33D*3600,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DOY", 
     ylab = "Sap flow velocity (cm h-1)",
     main = "33% Dispersed treatment",
     ylim = c(0, 30),
     col="slateblue1")

plot(K_VDT_avg$V_55A*3600,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DOY", 
     ylab = "Sap flow velocity (cm h-1)",
     main = "55% Aggregate treatment",
     ylim = c(0, 30),
     col="slateblue1")

plot(K_VDT_avg$V_33A*3600,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DOY", 
     ylab = "Sap flow velocity (cm h-1)",
     main = "33% Aggregate treatment",
     ylim = c(0, 30),
     col="slateblue1")

plot(K_VDT_avg$V_55D*3600,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DOY", 
     ylab = "Sap flow density (cm h-1)",
     main = "55% Dispersed treatment",
     ylim = c(0, 30),
     col="slateblue1") 

# Read sap flow velocity values per treatment

SV_VDT_DC_Avg <- read_csv("SV_VDT_DC_Avg.csv")

View(SV_VDT_DC_Avg)

# SV_VDT_DC_Avg <- K_VDT_avg %>%  
#   mutate(Year = as.integer(Year), 
#          Month = as.integer(Month), 
#          Day = as.integer(Day), 
#          Hour = as.integer(Hour), 
#          min = 00,   
#          sec = 00)%>%
#   group_by(Year, Month, Day, Hour)%>% 
#   summarise(k_CN  = mean(k_CN), 
#             k_33D = mean(k_33D),
#             k_55A = mean(k_55A),
#             k_33A = mean(k_33A),
#             K_55D = mean(K_55D),
#             # Sap flow velocity
#             V_CN  = mean(V_CN),
#             V_33D = mean(V_33D),
#             V_55A = mean(V_55A),
#             V_33A = mean(V_33A),
#             V_55D = mean(V_55D))%>%
#   mutate(Time = make_datetime(year = Year, 
#                               month = Month, 
#                               day = Day, 
#                               hour = Hour, 
#                               min = 00, 
#                               sec = 00),
#          season = case_when(as.integer(Month) %in% 10:11 ~ "Fall",
#                             as.integer(Month) %in%  6:9  ~ "Summer",
#                             as.integer(Month) %in%  4:5  ~ "Spring",
#                             as.integer(Month) %in%  1:3  ~ "Winter",
#                             TRUE ~ "Other"),
#          Year = as.integer(Year), 
#          Month = as.integer(Month), 
#          Day =  as.integer(Day), 
#          Hour = as.integer(Hour))
# 
# SV_VDT_DC_Avg
    
SV_VDT_DC_Avg%>%
  filter(Month==7 & Day==10)%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = V_CN*3600,  
    color="red"), 
    size = 1)+
  geom_point(aes(
    y = V_CN*3600,  
    color="red"), 
    size = 1)+
  scale_x_datetime(date_breaks = "2 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("Sap flow velocity ("*cm*" "*h^-1*")"),
                     limits=c(0, 18),
                     breaks = seq(from = 0, to = 18, by = 2)) +
  labs(title="Control")+
  #scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 12, hjust = 0.4, color="black"),
    axis.title.x =element_blank(),
    axis.text.y = element_text(size=12, colour="black"),
    axis.title.y = element_text(size=13, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 14),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.6),    
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.2,0.1,0.2, "cm"))

# Read diurnal cycle for met data

Met_VDT_DC <- read_csv("Met_VDT_DC.csv")

# Met_VDT_DC <- Met_VDT %>%
#   mutate(Year = as.integer(Year), 
#          Month = as.integer(Month), 
#          Day = as.integer(Day), 
#          Hour = as.integer(Hour), 
#          min = 00, 
#          sec = 00)%>%
#   group_by(Year, Month, Day, Hour)%>%
#   summarise(vpd  = mean(vpd), 
#             dnPAR = mean(dnPAR),
#             upPAR = mean(upPAR),
#             SM20 = mean(SM20B),
#             SM50 = mean(SM50B),
#             REW20cm = mean(REW20cm),
#             Rain = sum(Rain),
#             RH = mean(RH),
#             Tair = mean(Tair))%>%
#   mutate(Time = make_datetime(year = Year, 
#                               month = Month, 
#                               day = Day, 
#                               hour = Hour, 
#                               min = 00, 
#                               sec = 00),
#          season = case_when(as.integer(Month) %in% 10:11 ~ "Fall",
#                             as.integer(Month) %in%  6:9  ~ "Summer",
#                             as.integer(Month) %in%  4:5  ~ "Spring",
#                             as.integer(Month) %in%  1:3  ~ "Winter",
#                             TRUE ~ "Other"),
#          Year = as.integer(Year), 
#          Month = as.integer(Month), 
#          Day =  as.integer(Day), 
#          Hour = as.integer(Hour))
# 
# Met_VDT_DC
# 
# # Converting time zone from GMT to EST time.
# 
# attr(Met_VDT_DC$Time, 'tzone') = 'EST'
# 
# Met_VDT_DC <- Met_VDT_DC %>%
#   mutate(Year = year(Time), 
#          Month = month(Time), 
#          Day = day(Time), 
#          Hour = hour(Time), 
#          min = 00, 
#          sec = 00)

Met_VDT_DC%>%
  filter(Month==6 & Day==20)%>%
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = dnPAR,
    color="red"),
    size = 1)+
  geom_point(aes(
    y = dnPAR,
    color="red"),
    size = 1)

# View(Met_VDT_DC)

SV_Met_VDT <- read_csv("SV_Met_VDT.csv")

# SV_Met_VDT  <- left_join(SV_VDT_DC_Avg, Met_VDT_DC, by=c("Year", "Month", "Day", "Hour"))

View(SV_Met_VDT)

# SV_Met_VDT <- SV_Met_VDT %>%
#   mutate(Time = make_datetime(year = Year,
#                               month = Month,
#                               day = Day,
#                               hour = Hour,
#                               min = 00,
#                               sec = 00))

View(V_Met_VDT) 

SV_Met_VDT%>%
  filter(Month==8 & Day==8)%>%
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = Tair,  
    color="red"), 
    size = 1)+
  geom_point(aes(
    y = Tair,  
    color="red"), 
    size = 1)

# Diurnal cycle of sap flow velocity per treatment for a hot day (june 4, september 4, september 9)

SV_Met_VDT%>%
  filter(Month==9 & Day==4)%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = V_CN*3600,  
    color="CN"), 
    size = 1)+
  geom_point(aes(
    y = V_CN*3600,  
    color="CN"), 
    size = 1)+
  geom_line(aes(
    y = V_33D*3600,  
    color="33D"), 
    size = 1)+
  geom_line(aes(
    y = V_55A*3600,  
    color="55A"), 
    size = 1)+
  geom_line(aes(
    y = V_33A*3600,  
    color="33A"), 
    size = 1)+
  geom_line(aes(
    y = V_55D*3600,  
    color="55D"), 
    size = 1)+
  scale_x_datetime(date_breaks = "2 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("Sap flow velocity ("*cm*" "*h^-1*")"),
                     limits=c(0, 18),
                     breaks = seq(from = 0, to = 18, by = 2)) +
  labs(title="September 4th, 2023")+
  scale_color_manual(values = c("CN" = "orange", 
                                "33D" = "red2", 
                                "55A"="magenta4", 
                                "33A"="cyan3",
                                "55D"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 12, hjust = 0.4, color="black"),
    axis.title.x =element_blank(),
    axis.text.y = element_text(size=12, colour="black"),
    axis.title.y = element_text(size=13, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 14),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.6),    
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA), 
    plot.margin = margin(0.1,.2,0.1,0.2, "cm"))

# Sapflow density (g/m2/s) following McLaren - divided 0.019 to get value in m2

dw <- 1000 # Density of water (kg/m3) 
bsarea_33A <- 0.004 
bsarea_33D <- 0.004 
bsarea_55A <- 0.004 
bsarea_55D <- 0.004 
bsarea_CN  <- 0.004 # Basal area (m2/m2) or 40.0 (m2/ha)

# Stand density (trees per plot)

A33 <- 178
D33 <- 118
A55 <- 213
D55 <- 235
CN  <- 432

# Average DBH (cm)

B2_A33 <- (34.80+34.90+31.70)/3
B2_D33 <- ((31.80+42.25+34.10+44.60+32.70+32.30)/6)
B2_A55 <- ((34.15+34.40+34.15+31.35)/4)

B1_D33 <- 37.30
B1_A55 <- ((32.70+34.50+31.00+26.60+35.30+27.35)/6)
B1_CN  <- ((31.80+33.95+33.00+33.00+29.4+31.55+26.90+29.70+42.30)/9)

B3_D55 <- ((32.70+27.75+35.15)/3)
B3_A33 <- ((28.50+26.35+23.80)/3)
B3_CN  <- ((21.50+29.03+25.06)/3)

# Average dbh in cm

A33_DBH <- (B2_A33+B3_A33)/2
D33_DBH <- (B2_D33+B1_D33)/2
A55_DBH <- (B2_A55+B1_A55)/2
D55_DBH <-  B3_D55
CN_DBH  <- (B1_CN+B3_CN)/2

# Radius in cm

r_A33 <- A33_DBH / 2 
r_D33 <- D33_DBH / 2 
r_A55 <- A55_DBH / 2 
r_D55 <- D55_DBH / 2 
r_CN <- CN_DBH / 2 

# Sapwood and wood area

# A33
wA33 <- (pi * r_A33^2)/10000 # Wood area (m2)
wA33
swA33 <- (0.189 * A33_DBH^2.35)/10000 # Sapwood area (m2)
swA33

# D33
wD33 <- (pi * r_D33^2)/10000 # Wood area (m2)
wD33
swD33 <- (0.189 * D33_DBH^2.35)/10000 # Sapwood area (m2)
swD33

# A55
wA55 <- (pi * r_A55^2)/10000 # Wood area (m2)
wA55
swA55 <- (0.189 * A55_DBH^2.35)/10000 # Sapwood area (m2)
swA55

# D55
wD55 <- (pi * r_D55^2)/10000 # Wood area (m2)
wD55
swD55 <- (0.189 * D55_DBH^2.35)/10000 # Sapwood area (m2)
swD55

# CN
wCN <- (pi * r_CN^2)/10000 # Wood area (m2)  
wCN
swCN <- (0.189 * CN_DBH^2.35)/10000 # Sapwood area (m2)
swCN  


## Total sapflow from each plot (m^3/hhour OR kg/m^2/hhour)

SV_Met_VDT$F_B2A33 <- swA33 * (SV_Met_VDT$V_33A)/100 * 3600
SV_Met_VDT$F_B2D33 <- swD33 * (SV_Met_VDT$V_33D)/100 * 3600
SV_Met_VDT$F_B2A55 <- swA55 * (SV_Met_VDT$V_55A)/100 * 3600
SV_Met_VDT$F_B3D55 <- swD55 * (SV_Met_VDT$V_55D)/100 * 3600
SV_Met_VDT$F_B3CN  <- swCN  * (SV_Met_VDT$V_CN)/100 * 3600


plot(SV_Met_VDT$F_B2A33,
     type = "l", # You can customize the plot type (e.g., "l" for lines) if needed
     pch = 16,
     xlab = "DateTimeDOY",
     ylab = "B2A33",
     #ylim = c(0, 0.01),
     main = "Plot of DiffV_16_AVG vs. DateTimeDOY")


# Transpiration following Wilson et al., 2001

# Ratio of sapwood area (m2) to tree wood area (m2)
sw_wA33 = swA33/wA33
sw_wD33 = swD33/wD33
sw_wA55 = swA55/wA55
sw_wD55 = swD55/wD55 
sw_wCN = swCN/wCN 

## Sapwood area (m2) per unit ground area (m2) (SAI) - As:Ag

SVA33 <- bsarea_33A*sw_wA33
SVD33 <- bsarea_33D*sw_wD33
SVA55 <- bsarea_55A*sw_wA55
SVD55 <- bsarea_55D*sw_wD55
SVCN <-  bsarea_CN*sw_wCN 
  

## Transpiration per unit ground area (kg/m2/s)
# T (kg/m2/s) = V (m/s) * density (kg/m3) * SV (m2*m-2)

SV_Met_VDT$T_33A <- dw * (SV_Met_VDT$V_33A/100) * SVA33
SV_Met_VDT$T_33D <- dw * (SV_Met_VDT$V_33D)/100 * SVD33
SV_Met_VDT$T_55A <- dw * (SV_Met_VDT$V_55A)/100 * SVA55
SV_Met_VDT$T_55D <- dw * (SV_Met_VDT$V_55D)/100 * SVD55
SV_Met_VDT$T_CN <- dw * (SV_Met_VDT$V_CN)/100 * SVCN

plot(SV_Met_VDT$T_33A)
plot(SV_Met_VDT$T_33D)
plot(SV_Met_VDT$T_55A)
plot(SV_Met_VDT$T_55D)
plot(SV_Met_VDT$T_CN)

## Transpiration per unit groud area (mm/h-hour)
# Millimeters of water 1 mm of water is the pressure exerted by a 1 mm high column of water
# kg/m2 =mm H2O - kg/m2 is the pressure exterted by one kilogram force being applied to an area of one square meter
# 1 kg/m2 = 1 mm H2O

SV_Met_VDT$Thh_33A <- SV_Met_VDT$T_33A * 3600
SV_Met_VDT$Thh_33D <- SV_Met_VDT$T_33D * 3600
SV_Met_VDT$Thh_55A <- SV_Met_VDT$T_55A * 3600
SV_Met_VDT$Thh_55D <- SV_Met_VDT$T_55D * 3600
SV_Met_VDT$Thh_CN <- SV_Met_VDT$T_CN * 3600

plot(SV_Met_VDT$Thh_33A)


# Daily values 

dly_SV_Met <- SV_Met_VDT%>%
  dplyr::select(Time.x,
                Year,
                Month,
                Day,
                # Transpiration
                Thh_33A,
                Thh_33D,
                Thh_55A,
                Thh_55D,
                Thh_CN,
                # Environmental conditions
                Tair,
                vpd,
                dnPAR,
                upPAR,
                SM20,
                SM50,
                REW20cm,
                Rain,
                RH,
                # K
                k_CN,
                k_33D,
                k_55A,
                k_33A,
                K_55D,
                # Sap flow velocity
                V_CN,
                V_33D,
                V_55A,
                V_33A,
                V_55D)%>%
  dplyr::group_by(Year, Month, Day) %>%
  dplyr::summarise(
    # Environmental conditions
    Tairmean    = mean(Tair, na.rm=T),
    Tairmax    = max(Tair, na.rm=T),
    Tairmin    = min(Tair, na.rm=T),
    vpdmean     = mean(vpd, na.rm=T),
    vpdmax     = max(vpd, na.rm=T),
    vpdmin     = min(vpd, na.rm=T),
    dnPAR   = mean(dnPAR, na.rm=T),
    upPAR   = mean(upPAR, na.rm=T),
    SM20    = mean(SM20, na.rm=T),
    SM50    = mean(SM50, na.rm=T),
    REW20cm = mean(REW20cm, na.rm=T),
    REW20cm = mean(REW20cm, na.rm=T),
    Rain    = sum(Rain, na.rm=T),
    RH      = mean(RH, na.rm=T),
    # Transpiration
    Thh_33A   = sum(Thh_33A, na.rm=T),
    Thh_33D   = sum(Thh_33D, na.rm=T),
    Thh_55A   = sum(Thh_55A, na.rm=T),
    Thh_55D   = sum(Thh_55D, na.rm=T),
    Thh_CN    = sum(Thh_CN, na.rm=T),
    # K
    k_CN   = mean(k_CN, na.rm=T),
    k_33D = mean(k_33D, na.rm=T),
    k_55A = mean(k_55A, na.rm=T),
    k_33A = mean(k_33A, na.rm=T),
    K_55D = mean(K_55D, na.rm=T),
    # Sap flow velocity
    V_CN  = mean(V_CN, na.rm=T),
    V_33D = mean(V_33D, na.rm=T),
    V_55A = mean(V_55A, na.rm=T),
    V_33A = mean(V_33A, na.rm=T),
    V_55D = mean(V_55D, na.rm=T))%>%
  mutate(Time = make_datetime(year = Year, month = Month, day = Day))

dly_SV_Met

plot(dly_SV_Met$Thh_33A) 

mth_SV_Met <- dly_SV_Met %>% 
  # dplyr::select(Year,
  #               Month,
  #               Day,
  #               # Sap flow velocity
  #               V_CN, 
  #               V_33D,
  #               V_55A,
  #               V_33A,
  #               V_55D)%>% 
  dplyr::group_by(Year, Month) %>%
  dplyr::summarise(
    # Transpiration
    Thh_33A   = sum(Thh_33A, na.rm=T),
    Thh_33D   = sum(Thh_33D, na.rm=T),
    Thh_55A   = sum(Thh_55A, na.rm=T),
    Thh_55D   = sum(Thh_55D, na.rm=T),
    Thh_CN    = sum(Thh_CN, na.rm=T),
    # Sap flow velocity
    V_CN  = mean(V_CN, na.rm=T),
    V_33D = mean(V_33D, na.rm=T),
    V_55A = mean(V_55A, na.rm=T),
    V_33A = mean(V_33A, na.rm=T),
    V_55D = mean(V_55D, na.rm=T))%>%
  mutate(date = make_datetime(year = Year, month = Month, day = 1))

mth_SV_Met

View(mth_SV_Met)

# END


   
