# Script for figure 4

library(data.table)
library(reshape2)
library(tidyverse)
library(gridExtra)
library(lubridate)
library(grid)
library(hms)
library(patchwork) 
library(viridis)

# Read file
SV_Met_VDT_Szn <- read_csv("SV_Met_VDT_Szn.csv")
View(SV_Met_VDT)

# Hysteresis plot per season 

# PAR 

Szn_Hys_1_CN <- SV_Met_VDT_Szn%>%
  filter(season.y!="Other")%>% 
  ggplot(aes(dnPAR, (V_CN*3600), color=season.y)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  geom_curve(
    aes(x = 500, y = 8, xend = 100, yend = 6),
    colour = "darkgoldenrod3",
    arrow = arrow(length = unit(0.03, "npc"))
  )+
  geom_curve(
    aes(x = 900, y = 0, xend = 1400, yend = 3),
    colour = "blue4",
    arrow = arrow(length = unit(0.03, "npc"))
  )+
  scale_x_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 1000))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 8),
                     breaks = seq(from = 0, to = 8, by = 2)) +
  labs(title="(a) CN")+
  scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    #legend.position = "none", 
    legend.position = c(0.55, 0.95), 
    legend.direction="horizontal",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm")) 

Szn_Hys_1_CN

Szn_Hys_1_33D <- SV_Met_VDT_Szn%>%
  filter(season.y!="Other")%>% 
  ggplot(aes(dnPAR, (V_33D*3600), color=season.y)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 1000))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 8),
                     breaks = seq(from = 0, to = 8, by = 2)) +
  labs(title="(b) 33D")+
  scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none", 
    #legend.position = c(0.9, 0.6), 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

Szn_Hys_1_33D

Szn_Hys_1_55A <- SV_Met_VDT_Szn%>%
  filter(season.y!="Other")%>% 
  ggplot(aes(dnPAR, (V_55A*3600), color=season.y)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 1000))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 8),
                     breaks = seq(from = 0, to = 8, by = 2)) +
  labs(title="(c) 55A")+
  scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none", 
    #legend.position = c(0.9, 0.6), 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

Szn_Hys_1_55A

Szn_Hys_1_33A <- SV_Met_VDT_Szn%>%
  filter(season.y!="Other")%>% 
  ggplot(aes(dnPAR, (V_33A*3600), color=season.y)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 1000))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 8),
                     breaks = seq(from = 0, to = 8, by = 2)) +
  labs(title="(d) 33A")+
  scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none", 
    #legend.position = c(0.9, 0.6), 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

Szn_Hys_1_33A

Szn_Hys_1_55D <- SV_Met_VDT_Szn%>%
  filter(season.y!="Other")%>% 
  ggplot(aes(dnPAR, (V_55D*3600), color=season.y)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 1000))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 8),
                     breaks = seq(from = 0, to = 8, by = 2)) +
  labs(title="(e) 55D")+
  scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none", 
    #legend.position = c(0.9, 0.6), 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

Szn_Hys_1_55D

# Tair

Szn_Hys_2_CN <- SV_Met_VDT_Szn%>%
  filter(season.y!="Other")%>% 
  ggplot(aes(Tair, (V_CN*3600), color=season.y)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  geom_curve(
    aes(x = 20, y = 6, xend = 18, yend = 4),
    colour = "darkgoldenrod3",
    arrow = arrow(length = unit(0.03, "npc"))
  )+
  geom_curve(
    aes(x = 20, y = 0, xend = 23, yend = 4),
    colour = "blue4",
    arrow = arrow(length = unit(0.03, "npc"))
  )+
  scale_x_continuous(quote("Tair (°C)"),
                     limits=c(0, 30),
                     breaks = seq(from = 0, to = 30, by = 10)) +
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 8),
                     breaks = seq(from = 0, to = 8, by = 2)) +
  labs(title="(f) CN")+
  scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    #legend.position = "none", 
    legend.position = c(0.55, 0.95), 
    legend.direction="horizontal",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

Szn_Hys_2_CN

Szn_Hys_2_33D <- SV_Met_VDT_Szn%>%
  filter(season.y!="Other")%>% 
  ggplot(aes(Tair, (V_33D*3600), color=season.y)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("Tair (°C)"),
                     limits=c(0, 30),
                     breaks = seq(from = 0, to = 30, by = 10)) +
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 8),
                     breaks = seq(from = 0, to = 8, by = 2)) +
  labs(title="(g) 33D")+
  scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none", 
    #legend.position = c(0.9, 0.6), 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

Szn_Hys_2_33D

Szn_Hys_2_55A <- SV_Met_VDT_Szn%>%
  filter(season.y!="Other")%>% 
  ggplot(aes(Tair, (V_55A*3600), color=season.y)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("Tair (°C)"),
                     limits=c(0, 30),
                     breaks = seq(from = 0, to = 30, by = 10)) +
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 8),
                     breaks = seq(from = 0, to = 8, by = 2)) +
  labs(title="(h) 55A")+
  scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none", 
    #legend.position = c(0.9, 0.6), 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

Szn_Hys_2_55A

Szn_Hys_2_33A <- SV_Met_VDT_Szn%>%
  filter(season.y!="Other")%>% 
  ggplot(aes(Tair, (V_33A*3600), color=season.y)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("Tair (°C)"),
                     limits=c(0, 30),
                     breaks = seq(from = 0, to = 30, by = 10)) +
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 8),
                     breaks = seq(from = 0, to = 8, by = 2)) +
  labs(title="(i) 33A")+
  scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none", 
    #legend.position = c(0.9, 0.6), 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

Szn_Hys_2_33A

Szn_Hys_2_55D <- SV_Met_VDT_Szn%>%
  filter(season.y!="Other")%>% 
  ggplot(aes(Tair, (V_55D*3600), color=season.y)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("Tair (°C)"),
                     limits=c(0, 30),
                     breaks = seq(from = 0, to = 30, by = 10)) +
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 8),
                     breaks = seq(from = 0, to = 8, by = 2)) +
  labs(title="(j) 55D")+
  scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none", 
    #legend.position = c(0.9, 0.6), 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

Szn_Hys_2_55D

# VPD

Szn_Hys_3_CN <- SV_Met_VDT_Szn%>%
  filter(season.y!="Other")%>% 
  ggplot(aes(vpd, (V_CN*3600), color=season.y)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  geom_curve(
    aes(x = 1, y = 6, xend = 0.7, yend = 3),
    colour = "darkgoldenrod3",
    arrow = arrow(length = unit(0.03, "npc"))
  )+
  geom_curve(
    aes(x = 0.8, y = 0.2, xend = 1.1, yend = 4),
    colour = "blue4",
    arrow = arrow(length = unit(0.03, "npc"))
  )+
  scale_x_continuous(quote("VPD (kPa)"),
                     limits=c(0, 1.5),
                     breaks = seq(from = 0, to = 1.5, by = 0.5))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 8),
                     breaks = seq(from = 0, to = 8, by = 2)) +
  labs(title="(k) CN")+
  scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = c(0.55, 0.95), 
    legend.direction="horizontal",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

Szn_Hys_3_CN  

Szn_Hys_3_33D <- SV_Met_VDT_Szn%>%
  filter(season.y!="Other")%>% 
  ggplot(aes(vpd, (V_33D*3600), color=season.y)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("VPD (kPa)"),
                     limits=c(0, 1.5),
                     breaks = seq(from = 0, to = 1.5, by = 0.5))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 8),
                     breaks = seq(from = 0, to = 8, by = 2)) +
  labs(title="(l) 33D")+
  scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none", 
    #legend.position = c(0.9, 0.6), 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

Szn_Hys_3_33D

Szn_Hys_3_55A <- SV_Met_VDT_Szn%>%
  filter(season.y!="Other")%>% 
  ggplot(aes(vpd, (V_55A*3600), color=season.y)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("VPD (kPa)"),
                     limits=c(0, 1.5),
                     breaks = seq(from = 0, to = 1.5, by = 0.5))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 8),
                     breaks = seq(from = 0, to = 8, by = 2)) +
  labs(title="(m) 55A")+
  scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none", 
    #legend.position = c(0.9, 0.6), 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

Szn_Hys_3_55A

Szn_Hys_3_33A <- SV_Met_VDT_Szn%>%
  filter(season.y!="Other")%>% 
  ggplot(aes(vpd, (V_33A*3600), color=season.y)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("VPD (kPa)"),
                     limits=c(0, 1.5),
                     breaks = seq(from = 0, to = 1.5, by = 0.5))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 8),
                     breaks = seq(from = 0, to = 8, by = 2)) +
  labs(title="(n) 33A")+
  scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none", 
    #legend.position = c(0.9, 0.6), 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

Szn_Hys_3_33A

Szn_Hys_3_55D <- SV_Met_VDT_Szn%>%
  filter(season.y!="Other")%>% 
  ggplot(aes(vpd, (V_55D*3600), color=season.y)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("VPD (kPa)"),
                     limits=c(0, 1.5),
                     breaks = seq(from = 0, to = 1.5, by = 0.5))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 8),
                     breaks = seq(from = 0, to = 8, by = 2)) +
  labs(title="(o) 55D")+
  scale_color_manual(values = c("Fall" = "orange", "Summer" = "red2", "Spring"="magenta4", "Winter"="lightskyblue")) +
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none", 
    #legend.position = c(0.9, 0.6), 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,0.5,0.5,0.2, "cm"))

Szn_Hys_3_55D 
 
Szn_Hys_1_CN  + 
  Szn_Hys_1_33D  +
  Szn_Hys_1_55A + 
  Szn_Hys_1_33A+
  Szn_Hys_1_55D+ 
  Szn_Hys_2_CN+ 
  Szn_Hys_2_33D+
  Szn_Hys_2_55A+
  Szn_Hys_2_33A+
  Szn_Hys_2_55D+
  Szn_Hys_3_CN+
  Szn_Hys_3_33D+
  Szn_Hys_3_55A+
  Szn_Hys_3_33A+
  Szn_Hys_3_55D+ 
  plot_layout(ncol = 5, widths = c(1))

ggsave(file="Fig4_VDT.png", width = 16, height = 10, dpi = 300)

gA_F4 <- ggplotGrob(Szn_Hys_1_CN) 
gB_F4 <- ggplotGrob(Szn_Hys_1_33D)
gC_F4 <- ggplotGrob(Szn_Hys_1_55A)
gD_F4 <- ggplotGrob(Szn_Hys_1_33A)
gE_F4 <- ggplotGrob(Szn_Hys_1_55D)
gF_F4 <- ggplotGrob(Szn_Hys_2_CN) 
gG_F4 <- ggplotGrob(Szn_Hys_2_33D)
gH_F4 <- ggplotGrob(Szn_Hys_2_55A)
gI_F4 <- ggplotGrob(Szn_Hys_2_33A)
gJ_F4 <- ggplotGrob(Szn_Hys_2_55D)
gK_F4 <- ggplotGrob(Szn_Hys_3_CN) 
gL_F4 <- ggplotGrob(Szn_Hys_3_33D)
gM_F4 <- ggplotGrob(Szn_Hys_3_55A)
gN_F4 <- ggplotGrob(Szn_Hys_3_33A)
gO_F4 <- ggplotGrob(Szn_Hys_3_55D)

# Arrange the four charts
grid.arrange(gA_F4, gF_F4, gK_F4, 
             gB_F4, gG_F4, gL_F4, 
             gC_F4, gH_F4, gM_F4, 
             gD_F4, gI_F4, gN_F4,
             gE_F4, gJ_F4, gO_F4,
             nrow=3)

# Combine the plots   
g_F4 = cbind(
          rbind(gA_F4, gF_F4, gK_F4,size = "last"),  
          rbind(gB_F4, gG_F4, gL_F4, size = "last"), 
          rbind(gC_F4, gH_F4, gM_F4, size = "last"), 
          rbind(gD_F4, gI_F4, gN_F4, size = "last"), 
          rbind(gE_F4, gJ_F4, gO_F4, size = "last"), 
          size = "first")

# draw it
grid.newpage() 
grid.draw(g_F4)  

ggsave("Fig4_VDT.png", plot=g_F4, width = 18, height = 12, dpi = 300)

