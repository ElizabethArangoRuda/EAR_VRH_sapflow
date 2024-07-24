# Script for figure 3

library(hms)
library(tidyverse)
library(gridExtra)
library(scales)
library(ggpubr) 

# Read file
SV_Met_VDT  <- read_csv("SV_Met_VDT.csv")
View(SV_Met_VDT)

# Hysteresis

SV_Met_VDT_Szn <- SV_Met_VDT%>%
  dplyr::filter(season.y!="Winter" & season.y!="Other")%>%
  dplyr::select(Time.x,
                # Sap flow velocity
                V_CN,
                V_33D,
                V_55A,
                V_33A,
                V_55D,
                # Environmental variables
                vpd,
                dnPAR,
                REW20cm,
                Rain,
                Tair,
                Hour,
                season.y)%>%
  dplyr::group_by(season.y, Hour) %>%
  dplyr::summarise(
    # Sap flow velocity
    V_CN  = mean(V_CN, na.rm=T),
    V_33D = mean(V_33D, na.rm=T),
    V_55A = mean(V_55A, na.rm=T),
    V_33A = mean(V_33A, na.rm=T),
    V_55D = mean(V_55D, na.rm=T),
    # Environmental variables
    vpd = mean(vpd, na.rm=T),
    dnPAR = mean(dnPAR, na.rm=T),
    REW20cm = mean(REW20cm, na.rm=T),
    Rain = sum(Rain, na.rm=T),
    Tair = mean(Tair, na.rm=T))%>%
  dplyr::mutate(Time = make_datetime(year = 2023, month = 01, day = 01, hour = as.integer(Hour), min = 00, sec = 00))

SV_Met_VDT_Szn

View(SV_Met_VDT_Szn)

# Read file
SV_Met_VDT_Szn  <- read_csv("SV_Met_VDT_Szn.csv")
View(SV_Met_VDT_Szn)

Szn_1 <- SV_Met_VDT_Szn%>%
  filter(season.y != "Other" & season.y != "Winter")%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = V_CN*3600,  
    color = as.factor(season.y), 
    group = as.factor(season.y)), 
    size = 1)+
  geom_point(aes(
    y = V_CN*3600,  
    color = as.factor(season.y), 
    group = as.factor(season.y)),  
    size = 1)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "3 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(title="(a) CN")+
  scale_color_manual(values = c("Fall" = "orange", 
                                "Spring" = "red2", 
                                "Summer"="magenta4", 
                                "Winter"="cyan3")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black",  linetype = "solid"),
    axis.text.x  = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y  = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = c(0.2, 0.6),     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

Szn_1

Szn_2 <- SV_Met_VDT_Szn%>%
  filter(season.y != "Other" & season.y != "Winter")%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = V_33D*3600,  
    color = as.factor(season.y), 
    group = as.factor(season.y)), 
    size = 1)+
  geom_point(aes(
    y = V_33D*3600,  
    color = as.factor(season.y), 
    group = as.factor(season.y)),  
    size = 1)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "3 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(title="(b) 33D")+
  scale_color_manual(values = c("Fall" = "orange", 
                                "Spring" = "red2", 
                                "Summer"="magenta4", 
                                "Winter"="cyan3")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x  = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y  = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title   = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none",   
    #legend.position = c(0.2, 0.6),    
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

Szn_2

Szn_3 <- SV_Met_VDT_Szn%>%
  filter(season.y != "Other" & season.y != "Winter")%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = V_55A*3600,  
    color = as.factor(season.y), 
    group = as.factor(season.y)), 
    size = 1)+
  geom_point(aes(
    y = V_55A*3600,  
    color = as.factor(season.y), 
    group = as.factor(season.y)),  
    size = 1)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "3 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(title="(c) 55A")+
  scale_color_manual(values = c("Fall" = "orange", 
                                "Spring" = "red2", 
                                "Summer"="magenta4", 
                                "Winter"="cyan3")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x  = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y  = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title   = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none",   
    #legend.position = c(0.2, 0.6),   
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

Szn_3 

Szn_4 <- SV_Met_VDT_Szn%>%
  filter(season.y != "Other" & season.y != "Winter")%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = V_33A*3600,  
    color = as.factor(season.y), 
    group = as.factor(season.y)), 
    size = 1)+
  geom_point(aes(
    y = V_33A*3600,  
    color = as.factor(season.y), 
    group = as.factor(season.y)),  
    size = 1)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "3 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(title="(d) 33A")+
  scale_color_manual(values = c("Fall" = "orange", 
                                "Spring" = "red2", 
                                "Summer"="magenta4", 
                                "Winter"="cyan3")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x  = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y  = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title   = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none",   
    #legend.position = c(0.2, 0.6),    
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

Szn_4

Szn_5 <- SV_Met_VDT_Szn%>%
  filter(season.y != "Other" & season.y != "Winter")%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = V_55D*3600,  
    color = as.factor(season.y), 
    group = as.factor(season.y)), 
    size = 1)+
  geom_point(aes(
    y = V_55D*3600,  
    color = as.factor(season.y), 
    group = as.factor(season.y)),  
    size = 1)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "3 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),  
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(title="(e) 55D")+
  scale_color_manual(values = c("Fall" = "orange", 
                                "Spring" = "red2", 
                                "Summer"="magenta4", 
                                "Winter"="cyan3")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x  = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y  = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none",   
    #legend.position = c(0.2, 0.5),    
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

Szn_5 

# Read file
SV_Met_VDT_mth <- read_csv("SV_Met_VDT_mth.csv")
View(SV_Met_VDT_mth)

# Hysteresis month

SV_Met_VDT_mth<- SV_Met_VDT%>%
  dplyr::select(Time.y,
                Month,
                Hour,
                # Sap flow velocity
                V_CN,
                V_33D,
                V_55A,
                V_33A,
                V_55D,
                # Environmental variables
                vpd,
                dnPAR,
                REW20cm,
                Rain,
                Tair)%>%
  dplyr::group_by(Month, Hour) %>%
  dplyr::summarise(
    # Sap flow velocity
    V_CN  = mean(V_CN, na.rm=T),
    V_33D = mean(V_33D, na.rm=T),
    V_55A = mean(V_55A, na.rm=T),
    V_33A = mean(V_33A, na.rm=T),
    V_55D = mean(V_55D, na.rm=T),
    # Environmental variables
    vpd = mean(vpd, na.rm=T),
    dnPAR = mean(dnPAR, na.rm=T),
    REW20cm = mean(REW20cm, na.rm=T),
    Rain = sum(Rain, na.rm=T),
    Tair = mean(Tair, na.rm=T))%>%
  dplyr::mutate(Time = make_datetime(year = 2023, month = Month, day = 01, hour = as.integer(Hour), min = 00, sec = 00))

SV_Met_VDT_mth

View(SV_Met_VDT_mth)

mth_1 <- SV_Met_VDT_mth%>%
  filter(Month != "1" & Month != "2" & Month != "3" & Month != "12")%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = V_CN*3600,  
    color = as.factor(Month), 
    group = as.factor(Month)),  
    size = 1)+
  geom_point(aes(
    y = V_CN*3600,  
    color = as.factor(Month), 
    group = as.factor(Month)),  
    size = 1)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "3 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(title="(f) CN")+
  scale_color_manual(values = c(
                                "4" = "springgreen3",
                                "5" = "gold1",
                                "6" = "magenta1",
                                "7" = "magenta4",
                                "8"= "firebrick",
                                "9" = "orange4",
                                "10" = "turquoise2",
                                "11"="lightskyblue"),
                     labels=c(
                              'April',
                              'May',
                              'June',
                              'July',
                              'Aug',
                              'Sept',
                              'Oct', 
                              'Nov')) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x  = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y  = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = c(0.2, 0.5),     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_1

mth_2 <- SV_Met_VDT_mth%>%
  filter(Month != "1" & Month != "2" & Month != "3" & Month != "12")%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = V_33D*3600,  
    color = as.factor(Month), 
    group = as.factor(Month)), 
    size = 1)+
  geom_point(aes(
    y = V_33D*3600,  
    color = as.factor(Month), 
    group = as.factor(Month)),  
    size = 1)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "3 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(title="(g) 33D")+
  scale_color_manual(values = c(
    "4" = "springgreen3",
    "5" = "gold1",
    "6" = "magenta1",
    "7" = "magenta4",
    "8"= "firebrick",
    "9" = "orange4",
    "10" = "turquoise2",
    "11"="lightskyblue"),
    labels=c(
      'April',
      'May',
      'June',
      'July',
      'Aug',
      'Sept',
      'Oct', 
      'Nov')) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x  = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y  = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none",   
    #legend.position = c(0.2, 0.5),     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_2

mth_3 <- SV_Met_VDT_mth%>%
  filter(Month != "1" & Month != "2" & Month != "3" & Month != "12")%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = V_55A*3600,  
    color = as.factor(Month), 
    group = as.factor(Month)), 
    size = 1)+
  geom_point(aes(
    y = V_55A*3600,  
    color = as.factor(Month), 
    group = as.factor(Month)),  
    size = 1)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "3 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(title="(h) 55A")+
  scale_color_manual(values = c(
    "4" = "springgreen3",
    "5" = "gold1",
    "6" = "magenta1",
    "7" = "magenta4",
    "8"= "firebrick",
    "9" = "orange4",
    "10" = "turquoise2",
    "11"="lightskyblue"),
    labels=c(
      'April',
      'May',
      'June',
      'July',
      'Aug',
      'Sept',
      'Oct', 
      'Nov')) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    #panel.background = element_rect(fill = "white", colour = "black", size=1, linetype = "solid"),
    axis.text.x  = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y  = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none",   
    #legend.position = c(0.2, 0.5),     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_3

mth_4 <- SV_Met_VDT_mth%>%
  filter(Month != "1" & Month != "2" & Month != "3" & Month != "12")%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = V_33A*3600,  
    color = as.factor(Month), 
    group = as.factor(Month)), 
    size = 1)+
  geom_point(aes(
    y = V_33A*3600,  
    color = as.factor(Month), 
    group = as.factor(Month)),  
    size = 1)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "3 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(title="(i) 33A")+
  scale_color_manual(values = c(
    "4" = "springgreen3",
    "5" = "gold1",
    "6" = "magenta1",
    "7" = "magenta4",
    "8"= "firebrick",
    "9" = "orange4",
    "10" = "turquoise2",
    "11"="lightskyblue"),
    labels=c(
      'April',
      'May',
      'June',
      'July',
      'Aug',
      'Sept',
      'Oct', 
      'Nov')) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x  = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y  = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none",   
    #legend.position = c(0.2, 0.5),    
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

mth_4

mth_5 <- SV_Met_VDT_mth%>%
  filter(Month != "1" & Month != "2" & Month != "3" & Month != "12")%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = V_55D*3600,  
    color = as.factor(Month), 
    group = as.factor(Month)), 
    size = 1)+
  geom_point(aes(
    y = V_55D*3600,  
    color = as.factor(Month), 
    group = as.factor(Month)),  
    size = 1)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "3 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),  
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(title="(j) 55D")+
  scale_color_manual(values = c(
    "4" = "springgreen3",
    "5" = "gold1",
    "6" = "magenta1",
    "7" = "magenta4",
    "8"= "firebrick",
    "9" = "orange4",
    "10" = "turquoise2",
    "11"="lightskyblue"),
    labels=c(
      'April',
      'May',
      'June',
      'July',
      'Aug', 
      'Sept',
      'Oct', 
      'Nov')) + 
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x  = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y  = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none",   
    #legend.position = c(0.2, 0.5),     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

mth_5   

Fig3_VDT <- grid.arrange(
  Szn_1, Szn_2,   
  Szn_3, Szn_4, 
  Szn_5, mth_1,
  mth_2, mth_3,
  mth_4, mth_5,
  nrow = 2, ncol=5)   

ggsave("Fig3_VDT.png", plot=Fig3_VDT, width = 18, height = 8, dpi = 300)



