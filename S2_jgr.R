# Script for supplementary figure 2

library(tidyverse)
library(gridExtra)
library(grid)

SV_Met_VDT <- read_csv("SV_Met_VDT.csv")
View(SV_Met_VDT)

SV_Met_VDT_long <- gather(SV_Met_VDT, condition, measurement, V_CN:V_55D, factor_key=TRUE)
View(SV_Met_VDT_long)

Day1 <-  SV_Met_VDT_long%>%
  filter(Month==8 & Day==29)

Day2 <-  SV_Met_VDT_long%>%
  filter(Month==9 & Day==7)

Day3 <-  SV_Met_VDT_long%>%
  filter(Month==9 & Day==9)  
 
View(Day1) 

# PAR

Hys_PARD1 <- Day1 %>%
  ggplot(aes(dnPAR, (measurement*3600), color=condition, label=Hour)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  #geom_errorbar(aes(ymin = ET - SD_ET, ymax = ET + SD_ET), width = 0.2) +  # Add error bars
  scale_x_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 500),
                     expand = expansion(mult = c(0.01, 0.01)))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 12),
                     breaks = seq(from = 0, to = 12, by = 2)) +
  scale_color_manual(values = c("V_CN" = "orange", 
                                "V_33D" = "red2", 
                                "V_55A"="magenta4", 
                                "V_33A"="cyan3", 
                                "V_55D"="lightskyblue"),
                     labels=c('CN', '33D', '55A', '33A', '55D')) +
  labs(title="(a)")+
  #ggtitle("Title of the plot using ggtitle()")+
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(size=18, colour="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -8, size = 18),
    #plot.subtitle = element_text(hjust = 0.02, vjust = -12, size = 14),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.8),  
    legend.direction="vertical",
    #legend.position = "none", 
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,1,0.1,0.2, "cm"))

Hys_PARD1

Hys_PARD2 <- Day2 %>%
  ggplot(aes(dnPAR, (measurement*3600), color=condition, label=Hour)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  #geom_errorbar(aes(ymin = ET - SD_ET, ymax = ET + SD_ET), width = 0.2) +  # Add error bars
  scale_x_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 500),
                     expand = expansion(mult = c(0.01, 0.01)))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 12),
                     breaks = seq(from = 0, to = 12, by = 2)) +
  scale_color_manual(values = c("V_CN" = "orange", "V_33D" = "red2", "V_55A"="magenta4", "V_33A"="cyan3", "V_55D"="lightskyblue")) +
  labs(title="(b)")+
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(size=18, colour="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -8, size = 18),
    #plot.subtitle = element_text(hjust = 0.02, vjust = -12, size = 14),
    legend.title = element_blank(),
    #legend.position = c(0.8, 0.6), 
    legend.position = "none", 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,1,0.1,0.2, "cm"))

Hys_PARD2

Hys_PARD3 <- Day3 %>%
  ggplot(aes(dnPAR, (measurement*3600), color=condition, label=Hour)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  #geom_errorbar(aes(ymin = ET - SD_ET, ymax = ET + SD_ET), width = 0.2) +  # Add error bars
  scale_x_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 500),
                     expand = expansion(mult = c(0.01, 0.01)))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 12),
                     breaks = seq(from = 0, to = 12, by = 2)) +
  scale_color_manual(values = c("V_CN" = "orange", "V_33D" = "red2", "V_55A"="magenta4", "V_33A"="cyan3", "V_55D"="lightskyblue")) +
  labs(title="(c)")+
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(size=18, colour="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -8, size = 18),
    #plot.subtitle = element_text(hjust = 0.02, vjust = -12, size = 14),
    legend.title = element_blank(),
    #legend.position = c(0.8, 0.6), 
    legend.position = "none", 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,1,0.1,0.2, "cm"))

Hys_PARD3

# Temperature

Hys_TairD1 <- Day1 %>%  
  ggplot(aes(Tair, (measurement*3600), color=condition, label=Hour)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  #geom_errorbar(aes(ymin = ET - SD_ET, ymax = ET + SD_ET), width = 0.2) +  # Add error bars
  scale_x_continuous(quote(""*T["air"]*"  (°C)"),
                     limits=c(0, 30),
                     breaks = seq(from = 0, to = 30, by = 5),
                     expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 12),
                     breaks = seq(from = 0, to = 12, by = 2)) +
  scale_color_manual(values = c("V_CN" = "orange", 
                                "V_33D" = "red2", 
                                "V_55A"="magenta4", 
                                "V_33A"="cyan3", 
                                "V_55D"="lightskyblue"),
                     labels=c('CN', '33D', '55A', '33A', '55D')) +
  labs(title="(d)")+
  #ggtitle("Title of the plot using ggtitle()")+
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(size=18, colour="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"), 
    plot.title = element_text(hjust = 0.02, vjust = -8, size = 18),
    #plot.subtitle = element_text(hjust = 0.02, vjust = -12, size = 14),
    legend.title = element_blank(),
    #legend.position = c(0.8, 0.6), 
    legend.position = "none", 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,1,0.1,0.2, "cm"))

Hys_TairD1

Hys_TairD2 <- Day2 %>%
  ggplot(aes(Tair, (measurement*3600), color=condition, label=Hour)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  #geom_errorbar(aes(ymin = ET - SD_ET, ymax = ET + SD_ET), width = 0.2) +  # Add error bars
  scale_x_continuous(quote(""*T["air"]*"  (°C)"),
                     limits=c(0, 30),
                     breaks = seq(from = 0, to = 30, by = 5),
                     expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 12),
                     breaks = seq(from = 0, to = 12, by = 2)) +
  scale_color_manual(values = c("V_CN" = "orange", "V_33D" = "red2", "V_55A"="magenta4", "V_33A"="cyan3", "V_55D"="lightskyblue")) +
  labs(title="(e)")+
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(size=18, colour="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -8, size = 18),
    #plot.subtitle = element_text(hjust = 0.02, vjust = -12, size = 14),
    legend.title = element_blank(),
    #legend.position = c(0.8, 0.6), 
    legend.position = "none", 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,1,0.1,0.2, "cm"))

Hys_TairD2 

Hys_TairD3 <- Day3 %>%
  ggplot(aes(Tair, (measurement*3600), color=condition, label=Hour)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  #geom_errorbar(aes(ymin = ET - SD_ET, ymax = ET + SD_ET), width = 0.2) +  # Add error bars
  scale_x_continuous(quote(""*T["air"]*"  (°C)"),
                     limits=c(0, 30),
                     breaks = seq(from = 0, to = 30, by = 5),
                     expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 12),
                     breaks = seq(from = 0, to = 12, by = 2)) +
  scale_color_manual(values = c("V_CN" = "orange", "V_33D" = "red2", "V_55A"="magenta4", "V_33A"="cyan3", "V_55D"="lightskyblue")) +
  labs(title="(f)")+
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(size=18, colour="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -8, size = 18),
    #plot.subtitle = element_text(hjust = 0.02, vjust = -12, size = 14),
    legend.title = element_blank(),
    #legend.position = c(0.8, 0.6), 
    legend.position = "none", 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,1,0.1,0.2, "cm"))

Hys_TairD3

# VPD

Hys_VPDD1 <- Day1 %>%
  ggplot(aes(vpd, (measurement*3600), color=condition, label=Hour)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  #geom_errorbar(aes(ymin = ET - SD_ET, ymax = ET + SD_ET), width = 0.2) +  # Add error bars
  scale_x_continuous(quote("VPD (kPa)"), 
                     limits=c(0, 1.8),
                     breaks = seq(from = 0, to = 1.8, by = 0.4),
                     expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 12),
                     breaks = seq(from = 0, to = 12, by = 2)) +
  scale_color_manual(values = c("V_CN" = "orange", 
                                "V_33D" = "red2", 
                                "V_55A"="magenta4", 
                                "V_33A"="cyan3", 
                                "V_55D"="lightskyblue"),
                     labels=c('CN', '33D', '55A', '33A', '55D')) +
  labs(title="(g)")+
  #ggtitle("Title of the plot using ggtitle()")+
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(size=18, colour="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -8, size = 18),
    #plot.subtitle = element_text(hjust = 0.02, vjust = -12, size = 14),
    legend.title = element_blank(),
    #legend.position = c(0.8, 0.6), 
    legend.position = "none", 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,1,0.1,0.2, "cm"))

Hys_VPDD1

Hys_VPDD2 <- Day2 %>%
  ggplot(aes(vpd, (measurement*3600), color=condition, label=Hour)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  #geom_errorbar(aes(ymin = ET - SD_ET, ymax = ET + SD_ET), width = 0.2) +  # Add error bars
  scale_x_continuous(quote("VPD (kPa)"),
                     limits=c(0, 1.8),
                     breaks = seq(from = 0, to = 1.8, by = 0.4),
                     expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 12),
                     breaks = seq(from = 0, to = 12, by = 2)) +
  scale_color_manual(values = c("V_CN" = "orange", "V_33D" = "red2", "V_55A"="magenta4", "V_33A"="cyan3", "V_55D"="lightskyblue")) +
  labs(title="(h)")+
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(size=18, colour="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -8, size = 18),
    #plot.subtitle = element_text(hjust = 0.02, vjust = -12, size = 14),
    legend.title = element_blank(),
    #legend.position = c(0.8, 0.6), 
    legend.position = "none", 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,1,0.1,0.2, "cm"))

Hys_VPDD2

Hys_VPDD3 <- Day3 %>% 
  ggplot(aes(vpd, (measurement*3600), color=condition, label=Hour)) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  #geom_errorbar(aes(ymin = ET - SD_ET, ymax = ET + SD_ET), width = 0.2) +  # Add error bars
  scale_x_continuous(quote("VPD (kPa)"),
                     limits=c(0, 1.8),
                     breaks = seq(from = 0, to = 1.8, by = 0.4),
                     expand=c(0.004,0.004))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 12),
                     breaks = seq(from = 0, to = 12, by = 2)) +
  scale_color_manual(values = c("V_CN" = "orange", "V_33D" = "red2", "V_55A"="magenta4", "V_33A"="cyan3", "V_55D"="lightskyblue")) +
  labs(title="(i)")+
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(size=18, colour="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -8, size = 18),
    #plot.subtitle = element_text(hjust = 0.02, vjust = -12, size = 14),
    legend.title = element_blank(),
    #legend.position = c(0.8, 0.6), 
    legend.position = "none", 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(0.4, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,1,0.1,0.2, "cm"))

Hys_VPDD3

FigS3_VDT <- plot_grid(
  Hys_PARD1, Hys_PARD2, Hys_PARD3,  
  Hys_TairD1, Hys_TairD2, Hys_TairD3,
  Hys_VPDD1, Hys_VPDD2, Hys_VPDD3,
  rel_widths = c(1,1,1),
  labels = c('Aug. 29th', 'Sept. 7th', 'Sept. 9th'),
  nrow = 3,
  align = "hv")

FigS3_VDT

ggsave("FigS3_VDT.png", plot=FigS3_VDT, width = 14, height = 12, dpi = 300)
