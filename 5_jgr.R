# Script for figure 5

# Hysteresis plot per month

# Read file
SV_Met_VDT_mth <- read_csv("SV_Met_VDT_mth.csv")
View(SV_Met_VDT_mth)

# PAR 

mth_Hys_1_CN <- SV_Met_VDT_mth%>%
  filter(Month!="1" & Month!="2" & Month!="3" & Month!="12")%>% 
  ggplot(aes(dnPAR, (V_CN*3600), color=as.factor(Month))) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  # geom_curve(
  #   aes(x = 500, y = 8, xend = 100, yend = 6),
  #   colour = "darkgoldenrod3",
  #   arrow = arrow(length = unit(0.03, "npc"))
  # )+
  # geom_curve(
  #   aes(x = 900, y = 0, xend = 1400, yend = 3),
  #   colour = "blue4",
  #   arrow = arrow(length = unit(0.03, "npc"))
  # )+
  scale_x_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 1000))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(title="(a) CN")+
  scale_color_manual(values = c(
    "4" = "springgreen3",
    "5" = "gold1",
    "6" = "magenta1",
    "7" = "magenta4",
    "8"= "firebrick",
    "9" = "orange4",
    "10" = "turquoise2",
    "11"="darkblue"),
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
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.35), 
    #legend.position = "none",     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_Hys_1_CN

mth_Hys_1_33D <- SV_Met_VDT_mth%>%
  filter(Month!="1" & Month!="2" & Month!="3" & Month!="12")%>% 
  ggplot(aes(dnPAR, (V_33D*3600), color=as.factor(Month))) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 1000))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(title="(b) 33D")+
  scale_color_manual(values = c(
    "4" = "springgreen3",
    "5" = "gold1",
    "6" = "magenta1",
    "7" = "magenta4",
    "8"= "firebrick",
    "9" = "orange4",
    "10" = "turquoise2",
    "11"="darkblue"),
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
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    #legend.position = c(0.9, 0.6), 
    legend.position = "none",     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_Hys_1_33D

mth_Hys_1_55A <- SV_Met_VDT_mth%>%
  filter(Month!="1" & Month!="2" & Month!="3" & Month!="12")%>% 
  ggplot(aes(dnPAR, (V_55A*3600), color=as.factor(Month))) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 1000))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(title="(c) 55A")+
  scale_color_manual(values = c(
    "4" = "springgreen3",
    "5" = "gold1",
    "6" = "magenta1",
    "7" = "magenta4",
    "8"= "firebrick",
    "9" = "orange4",
    "10" = "turquoise2",
    "11"="darkblue"),
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
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    #legend.position = c(0.9, 0.6), 
    legend.position = "none",     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_Hys_1_55A

mth_Hys_1_33A <- SV_Met_VDT_mth%>%
  filter(Month!="1" & Month!="2" & Month!="3" & Month!="12")%>% 
  ggplot(aes(dnPAR, (V_33A*3600), color=as.factor(Month))) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 1000))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(title="(d) 33A")+
  scale_color_manual(values = c(
    "4" = "springgreen3",
    "5" = "gold1",
    "6" = "magenta1",
    "7" = "magenta4",
    "8"= "firebrick",
    "9" = "orange4",
    "10" = "turquoise2",
    "11"="darkblue"),
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
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    #legend.position = c(0.9, 0.6), 
    legend.position = "none",     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_Hys_1_33A

mth_Hys_1_55D <- SV_Met_VDT_mth%>%
  filter(Month!="1" & Month!="2" & Month!="3" & Month!="12")%>% 
  ggplot(aes(dnPAR, (V_55D*3600), color=as.factor(Month))) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 2000),
                     breaks = seq(from = 0, to = 2000, by = 1000))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 10),
                     breaks = seq(from = 0, to = 10, by = 2)) +
  labs(title="(e) 55D")+
  scale_color_manual(values = c(
    "4" = "springgreen3",
    "5" = "gold1",
    "6" = "magenta1",
    "7" = "magenta4",
    "8"= "firebrick",
    "9" = "orange4",
    "10" = "turquoise2",
    "11"="darkblue"),
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
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    #legend.position = c(0.9, 0.6), 
    legend.position = "none",     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_Hys_1_55D

# Tair

mth_Hys_2_CN <- SV_Met_VDT_mth%>% 
  filter(Month!="1" & Month!="2" & Month!="3" & Month!="12")%>% 
  ggplot(aes(Tair, (V_CN*3600), color=as.factor(Month))) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  # geom_curve(
  #   aes(x = 20, y = 6, xend = 18, yend = 4),
  #   colour = "darkgoldenrod3",
  #   arrow = arrow(length = unit(0.03, "npc"))
  # )+
  # geom_curve(
  #   aes(x = 20, y = 0, xend = 23, yend = 4),
  #   colour = "blue4",
  #   arrow = arrow(length = unit(0.03, "npc"))
  # )+
  scale_x_continuous(quote("Tair (°C)"),
                     limits=c(0, 30),
                     breaks = seq(from = 0, to = 30, by = 10)) +
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
    "11"="darkblue"),
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
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.35), 
    #legend.position = "none",     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_Hys_2_CN

mth_Hys_2_33D <- SV_Met_VDT_mth%>%
  filter(Month!="1" & Month!="2" & Month!="3" & Month!="12")%>% 
  ggplot(aes(Tair, (V_33D*3600), color=as.factor(Month))) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("Tair (°C)"),
                     limits=c(0, 30),
                     breaks = seq(from = 0, to = 30, by = 10)) +
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
    "11"="darkblue"),
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
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    #legend.position = c(0.9, 0.6), 
    legend.position = "none",     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_Hys_2_33D

mth_Hys_2_55A <- SV_Met_VDT_mth%>%
  filter(Month!="1" & Month!="2" & Month!="3" & Month!="12")%>% 
  ggplot(aes(Tair, (V_55A*3600), color=as.factor(Month))) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("Tair (°C)"),
                     limits=c(0, 30),
                     breaks = seq(from = 0, to = 30, by = 10)) +
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
    "11"="darkblue"),
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
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    #legend.position = c(0.9, 0.6), 
    legend.position = "none",     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_Hys_2_55A

mth_Hys_2_33A <- SV_Met_VDT_mth%>%
  filter(Month!="1" & Month!="2" & Month!="3" & Month!="12")%>% 
  ggplot(aes(Tair, (V_33A*3600),color=as.factor(Month))) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("Tair (°C)"),
                     limits=c(0, 30),
                     breaks = seq(from = 0, to = 30, by = 10)) +
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
    "11"="darkblue"),
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
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    #legend.position = c(0.9, 0.6), 
    legend.position = "none",     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_Hys_2_33A

mth_Hys_2_55D <- SV_Met_VDT_mth%>%
  filter(Month!="1" & Month!="2" & Month!="3" & Month!="12")%>% 
  ggplot(aes(Tair, (V_55D*3600), color=as.factor(Month))) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("Tair (°C)"),
                     limits=c(0, 30),
                     breaks = seq(from = 0, to = 30, by = 10)) +
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
    "11"="darkblue"),
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
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    #legend.position = c(0.9, 0.6), 
    legend.position = "none",     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_Hys_2_55D

# VPD

mth_Hys_3_CN <- SV_Met_VDT_mth%>%
  filter(Month!="1" & Month!="2" & Month!="3" & Month!="12")%>% 
  ggplot(aes(vpd, (V_CN*3600), color=as.factor(Month))) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  # geom_curve(
  #   aes(x = 1, y = 6, xend = 0.7, yend = 3),
  #   colour = "darkgoldenrod3",
  #   arrow = arrow(length = unit(0.03, "npc"))
  # )+
  # geom_curve(
  #   aes(x = 0.8, y = 0.2, xend = 1.1, yend = 4),
  #   colour = "blue4",
  #   arrow = arrow(length = unit(0.03, "npc"))
  # )+
  scale_x_continuous(quote("VPD (kPa)"),
                     limits=c(0, 1.5),
                     breaks = seq(from = 0, to = 1.5, by = 0.5))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 9),
                     breaks = seq(from = 0, to = 9, by = 2)) +
  labs(title="(k) CN")+
  scale_color_manual(values = c(
    "4" = "springgreen3",
    "5" = "gold1",
    "6" = "magenta1",
    "7" = "magenta4",
    "8"= "firebrick",
    "9" = "orange4",
    "10" = "turquoise2",
    "11"="darkblue"),
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
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = c(0.9, 0.35), 
    #legend.position = "none",     
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.1, "cm"), 
    legend.key.width = unit(0.1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_Hys_3_CN  

mth_Hys_3_33D <- SV_Met_VDT_mth%>%
  filter(Month!="1" & Month!="2" & Month!="3" & Month!="12")%>% 
  ggplot(aes(vpd, (V_33D*3600), color=as.factor(Month))) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("VPD (kPa)"),
                     limits=c(0, 1.5),
                     breaks = seq(from = 0, to = 1.5, by = 0.5))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 9),
                     breaks = seq(from = 0, to = 9, by = 2)) +
  labs(title="(l) 33D")+
  scale_color_manual(values = c(
    "4" = "springgreen3",
    "5" = "gold1",
    "6" = "magenta1",
    "7" = "magenta4",
    "8"= "firebrick",
    "9" = "orange4",
    "10" = "turquoise2",
    "11"="darkblue"),
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
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_Hys_3_33D

mth_Hys_3_55A <- SV_Met_VDT_mth%>%
  filter(Month!="1" & Month!="2" & Month!="3" & Month!="12")%>% 
  ggplot(aes(vpd, (V_55A*3600), color=as.factor(Month))) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("VPD (kPa)"),
                     limits=c(0, 1.5),
                     breaks = seq(from = 0, to = 1.5, by = 0.5))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 9),
                     breaks = seq(from = 0, to = 9, by = 2)) +
  labs(title="(m) 55A")+
  scale_color_manual(values = c(
    "4" = "springgreen3",
    "5" = "gold1",
    "6" = "magenta1",
    "7" = "magenta4",
    "8"= "firebrick",
    "9" = "orange4",
    "10" = "turquoise2",
    "11"="darkblue"),
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
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_Hys_3_55A

mth_Hys_3_33A <- SV_Met_VDT_mth%>%
  filter(Month!="1" & Month!="2" & Month!="3" & Month!="12")%>% 
  ggplot(aes(vpd, (V_33A*3600), color=as.factor(Month))) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("VPD (kPa)"),
                     limits=c(0, 1.5),
                     breaks = seq(from = 0, to = 1.5, by = 0.5))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 9),
                     breaks = seq(from = 0, to = 9, by = 2)) +
  labs(title="(n) 33A")+
  scale_color_manual(values = c(
    "4" = "springgreen3",
    "5" = "gold1",
    "6" = "magenta1",
    "7" = "magenta4",
    "8"= "firebrick",
    "9" = "orange4",
    "10" = "turquoise2",
    "11"="darkblue"),
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
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_Hys_3_33A

mth_Hys_3_55D <- SV_Met_VDT_mth%>%
  filter(Month!="1" & Month!="2" & Month!="3" & Month!="12")%>% 
  ggplot(aes(vpd, (V_55D*3600), color=as.factor(Month))) +
  geom_point(size=1)+
  geom_path(size=1) +
  geom_text(aes(label = Hour), size = 3, nudge_y = 0.2, check_overlap = TRUE) +
  scale_x_continuous(quote("VPD (kPa)"),
                     limits=c(0, 1.5),
                     breaks = seq(from = 0, to = 1.5, by = 0.5))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 9),
                     breaks = seq(from = 0, to = 9, by = 2)) +
  labs(title="(o) 55D")+
  scale_color_manual(values = c(
    "4" = "springgreen3",
    "5" = "gold1",
    "6" = "magenta1",
    "7" = "magenta4",
    "8"= "firebrick",
    "9" = "orange4",
    "10" = "turquoise2",
    "11"="darkblue"),
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
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

mth_Hys_3_55D 

mth_Hys_1_CN+ 
  mth_Hys_1_33D+
  mth_Hys_1_55A+  
  mth_Hys_1_33A+
  mth_Hys_1_55D+
  mth_Hys_2_CN+   
  mth_Hys_2_33D+  
  mth_Hys_2_55A+  
  mth_Hys_2_33A+
  mth_Hys_2_55D+
  mth_Hys_3_CN+
  mth_Hys_3_33D+ 
  mth_Hys_3_55A+
  mth_Hys_3_33A+
  mth_Hys_3_55D+ 
  plot_layout(ncol = 5, widths = c(1))

ggsave(file="Fig5_VDT_mth.png", width = 16, height = 10, dpi = 300)

gA_F5 <- ggplotGrob(mth_Hys_1_CN) 
gB_F5 <- ggplotGrob(mth_Hys_1_33D)
gC_F5 <- ggplotGrob(mth_Hys_1_55A)
gD_F5 <- ggplotGrob(mth_Hys_1_33A)
gE_F5 <- ggplotGrob(mth_Hys_1_55D)
gF_F5 <- ggplotGrob(mth_Hys_2_CN) 
gG_F5 <- ggplotGrob(mth_Hys_2_33D)
gH_F5 <- ggplotGrob(mth_Hys_2_55A)
gI_F5 <- ggplotGrob(mth_Hys_2_33A)
gJ_F5 <- ggplotGrob(mth_Hys_2_55D)
gK_F5 <- ggplotGrob(mth_Hys_3_CN) 
gL_F5 <- ggplotGrob(mth_Hys_3_33D)
gM_F5 <- ggplotGrob(mth_Hys_3_55A)
gN_F5 <- ggplotGrob(mth_Hys_3_33A)
gO_F5 <- ggplotGrob(mth_Hys_3_55D)

# Arrange the four charts
grid.arrange(gA_F5, gF_F5, gK_F5, 
             gB_F5, gG_F5, gL_F5, 
             gC_F5, gH_F5, gM_F5, 
             gD_F5, gI_F5, gN_F5,
             gE_F5, gJ_F5, gO_F5,
             nrow=3)

# Combine the plots   
g_F5 = cbind(
  rbind(gA_F5, gF_F5, gK_F5, size = "last"),  
  rbind(gB_F5, gG_F5, gL_F5, size = "last"), 
  rbind(gC_F5, gH_F5, gM_F5, size = "last"), 
  rbind(gD_F5, gI_F5, gN_F5, size = "last"), 
  rbind(gE_F5, gJ_F5, gO_F5, size = "last"), 
  size = "first")

# draw it
grid.newpage() 
grid.draw(g_F5)  

ggsave("Fig5_VDT.png", plot=g_F5, width = 18, height = 12, dpi = 300)
