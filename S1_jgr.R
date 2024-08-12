# Script for supplementary figure 1

library(hms)
library(tidyverse)
#library(gridExtra)
#library(scales)
library(cowplot)

SV_Met_VDT <- read_csv("SV_Met_VDT.csv")
View(SV_Met_VDT)

# Sap flow velocity - Sep 2 to Sep 7

FigS1_SV_1 <- SV_Met_VDT%>%
  filter(Month==8 & Day==29)%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time.x))))+
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
  scale_x_datetime(quote("Hour"),
                   date_breaks = "4 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 12),
                     breaks = seq(from = 0, to = 12, by = 2)) +
  labs(title="(a)")+
  scale_color_manual(values = c("CN" = "orange", 
                                "33D" = "red2", 
                                "55A"="magenta4", 
                                "33A"="cyan3",
                                "55D"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.8),  
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))+
  geom_vline(xintercept = as.numeric(as.POSIXct("1970-01-01 7:00:00 UTC", format = "%Y-%m-%d %H:%M:%S")), color = "black", linetype = "dashed")

FigS1_SV_1

FigS1_SV_2 <- SV_Met_VDT%>%
  filter(Month==9 & Day==7)%>% 
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
  #geom_segment(aes(x = as.POSIXct("2023-08-30"),xend=as.POSIXct("2023-08-30"),y=18,yend=18))+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "4 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 12),
                     breaks = seq(from = 0, to = 12, by = 2)) +
  labs(title="(b)")+
  scale_color_manual(values = c("CN" = "orange", 
                                "33D" = "red2", 
                                "55A"="magenta4", 
                                "33A"="cyan3",
                                "55D"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.8),  
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))+
  geom_vline(xintercept = as.numeric(as.POSIXct("1970-01-01 7:00:00 UTC", format = "%Y-%m-%d %H:%M:%S")), color = "black", linetype = "dashed")

FigS1_SV_2

FigS1_SV_3 <- SV_Met_VDT%>%
  filter(Month==9 & Day==9)%>% 
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
  scale_x_datetime(quote("Hour"),
                   date_breaks = "4 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 12),
                     breaks = seq(from = 0, to = 12, by = 2)) +
  labs(title="(c)")+
  scale_color_manual(values = c("CN" = "orange", 
                                "33D" = "red2", 
                                "55A"="magenta4", 
                                "33A"="cyan3",
                                "55D"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.8),  
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))+
  geom_vline(xintercept = as.numeric(as.POSIXct("1970-01-01 7:00:00 UTC", format = "%Y-%m-%d %H:%M:%S")), color = "black", linetype = "dashed")

FigS1_SV_3

# PAR

FigS1_met_1 <- SV_Met_VDT%>%
  filter(Month==8 & Day==29)%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = dnPAR,  
    color="PAR"), 
    size = 1)+
  geom_point(aes(
    y = dnPAR,   
    color="PAR"), 
    size = 2)+
  geom_line(mapping = aes(y = Tair*50, 
                          color="Tair"),
            size = 1)+
  geom_point(mapping = aes(y = Tair*50, 
                           color="Tair"),
             size = 2)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "4 hour",
                   date_labels = "%H",
                   labels=date_format("%H"), 
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 500),
                     expand = expansion(mult = c(0.01, 0.01)),
                     sec.axis = sec_axis(~./50, 
                                         name = "Tair (°C)", 
                                         breaks = seq(from = 10, to = 40, by = 5))) +
  labs(title="(d)")+
  scale_color_manual(values = c("PAR" = "darkorange3", 
                                "Tair" = "red")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.8),  
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))+
  geom_vline(xintercept = as.numeric(as.POSIXct("1970-01-01 7:00:00 UTC", format = "%Y-%m-%d %H:%M:%S")), color = "black", linetype = "dashed")

FigS1_met_1 

FigS1_met_2 <- SV_Met_VDT%>%
  filter(Month==9 & Day==7)%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = dnPAR,  
    color="PAR"), 
    size = 1)+
  geom_point(aes(
    y = dnPAR,   
    color="PAR"), 
    size = 2)+
  geom_line(mapping = aes(y = Tair*50, 
                          color="Tair"),
            size = 1)+
  geom_point(mapping = aes(y = Tair*50, 
                           color="Tair"),
             size = 2)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "4 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 500),
                     expand = expansion(mult = c(0.01, 0.01)),
                     sec.axis = sec_axis(~./50, 
                                         name = "Tair (°C)", 
                                         breaks = seq(from = 10, to = 40, by = 5))) +
  labs(title="(e)")+
  scale_color_manual(values = c("PAR" = "darkorange3", 
                                "Tair" = "red")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.8),  
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))+
  geom_vline(xintercept = as.numeric(as.POSIXct("1970-01-01 7:00:00 UTC", format = "%Y-%m-%d %H:%M:%S")), color = "black", linetype = "dashed")

FigS1_met_2

FigS1_met_3 <- SV_Met_VDT%>%
  filter(Month==9 & Day==9)%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = dnPAR,  
    color="PAR"), 
    size = 1)+
  geom_point(aes(
    y = dnPAR,   
    color="PAR"), 
    size = 2)+
  geom_line(mapping = aes(y = Tair*50, 
                          color="Tair"),
            size = 1)+
  geom_point(mapping = aes(y = Tair*50, 
                           color="Tair"),
             size = 2)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "4 hour", 
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("PAR ("*umol*" "*m^-2*" "*d^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 500),
                     expand = expansion(mult = c(0.01, 0.01)),
                     sec.axis = sec_axis(~./50, 
                                         name = "Tair (°C)", 
                                         breaks = seq(from = 10, to = 40, by = 5))) +
  labs(title="(f)")+
  scale_color_manual(values = c("PAR" = "darkorange3", 
                                "Tair" = "red")) +
  guides(color=guide_legend(override.aes=list(fill=NA)))+ 
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.8),  
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))+
  geom_vline(xintercept = as.numeric(as.POSIXct("1970-01-01 7:00:00 UTC", format = "%Y-%m-%d %H:%M:%S")), color = "black", linetype = "dashed")

FigS1_met_3 

# VPD

FigS1_soil_1 <- SV_Met_VDT%>%
  filter(Month==8 & Day==29)%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = vpd,    
    color="VPD"), 
    size = 1)+
  geom_point(aes(
    y = vpd,    
    color="VPD"), 
    size = 1)+ 
  geom_line(mapping = aes(y = REW20cm*2, 
                          color="REW"),
            size = 1)+
  geom_point(mapping = aes(y = REW20cm*2, 
                           color="REW"),
             size = 2)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "4 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("VPD (kPa)"),
                     limits=c(0, 3),
                     breaks = seq(from = 0, to = 3, by = 0.5),
                     expand = expansion(mult = c(0.01, 0.01)),
                     sec.axis = sec_axis(~./2, 
                                         name=quote(""*REW["0-20"]*""), 
                                         breaks = seq(from = 0, to = 1.5, by = 0.5))) +
  labs(title="(g)")+
  scale_color_manual(values = c("VPD" = "deepskyblue4", 
                                "REW" = "darkslategray3")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.8),  
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))+
  geom_vline(xintercept = as.numeric(as.POSIXct("1970-01-01 7:00:00 UTC", format = "%Y-%m-%d %H:%M:%S")), color = "black", linetype = "dashed")

FigS1_soil_1

FigS1_soil_2 <- SV_Met_VDT%>%
  filter(Month==9 & Day==7)%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = vpd,   
    color="VPD"), 
    size = 1)+
  geom_point(aes(
    y = vpd,   
    color="VPD"), 
    size = 1)+ 
  geom_line(mapping = aes(y = REW20cm*2, 
                          color="REW"),
            size = 1)+
  geom_point(mapping = aes(y = REW20cm*2, 
                           color="REW"),
             size = 2)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "4 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("VPD (kPa)"),
                     limits=c(0, 3),
                     breaks = seq(from = 0, to = 3, by = 0.5),
                     expand = expansion(mult = c(0.01, 0.01)),
                     sec.axis = sec_axis(~./2, 
                                         name=quote(""*REW["0-20"]*""), 
                                         breaks = seq(from = 0, to = 1.5, by = 0.5))) +
  labs(title="(h)")+
  scale_color_manual(values = c("VPD" = "deepskyblue4", 
                                "REW" = "darkslategray3")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.8),  
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))+
  geom_vline(xintercept = as.numeric(as.POSIXct("1970-01-01 7:00:00 UTC", format = "%Y-%m-%d %H:%M:%S")), color = "black", linetype = "dashed")

FigS1_soil_2 

FigS1_soil_3 <- SV_Met_VDT%>%
  filter(Month==9 & Day==9)%>% 
  ggplot(aes(x = as.POSIXct(as_hms(Time))))+
  geom_line(aes(
    y = vpd,   
    color="VPD"), 
    size = 1)+
  geom_point(aes(
    y = vpd,   
    color="VPD"), 
    size = 1)+ 
  geom_line(mapping = aes(y = REW20cm*2, 
                          color="REW"),
            size = 1)+
  geom_point(mapping = aes(y = REW20cm*2, 
                           color="REW"),
             size = 2)+
  scale_x_datetime(quote("Hour"),
                   date_breaks = "4 hour",
                   date_labels = "%H",
                   labels=date_format("%H"),
                   expand=c(0.004,0.004))+
  scale_y_continuous(quote("VPD (kPa)"),
                     limits=c(0, 3),
                     breaks = seq(from = 0, to = 3, by = 0.5),
                     expand = expansion(mult = c(0.01, 0.01)),
                     sec.axis = sec_axis(~./2, 
                                         name=quote(""*REW["0-20"]*""), 
                                         breaks = seq(from = 0, to = 1.5, by = 0.5))) +
  labs(title="(i)")+
  scale_color_manual(values = c("VPD" = "deepskyblue4", 
                                "REW" = "darkslategray3")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.8),  
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))+
  geom_vline(xintercept = as.numeric(as.POSIXct("1970-01-01 7:00:00 UTC", format = "%Y-%m-%d %H:%M:%S")), color = "black", linetype = "dashed")

FigS1_soil_3

FigS1_VDT <- plot_grid(
  FigS1_SV_1, FigS1_SV_2, FigS1_SV_3,  
  FigS1_met_1, FigS1_met_2, FigS1_met_3,
  FigS1_soil_1, FigS1_soil_2, FigS1_soil_3,
  rel_widths = c(1,1,1),
  labels = c('Aug. 29th', 'Sept. 7th', 'Sept. 9th'),
  nrow = 3,
  align = "hv")

FigS1_VDT

ggsave("FigS1_VDT.png", plot=FigS2_VDT, width = 14, height = 10, dpi = 300)

# END

