# Script for figure 6

# Scatterplot

install.packages("devtools") 
install_github("vqv/ggbiplot", force = TRUE)
install_github("vqv/ggbiplot")

library(stats) 
library(tidyverse)
library(devtools)
library(ggbiplot) 
require(mgcv)
library(cowplot)
library(tidyr)

# Read file
SV_Met_VDT <- read_csv("SV_Met_VDT.csv")
View(SV_Met_VDT)

# Plots  SV_Met_VDT_long

SV_Met_VDT_long_h <- gather(SV_Met_VDT, condition, measurement, V_CN:V_55D, factor_key=TRUE)
names(SV_Met_VDT_long_h)
View(SV_Met_VDT_long_h)

# First, create a new column for Ts5cm bin values
SV_Met_VDT_long_h$PARdn_bin <- cut(SV_Met_VDT_long_h$dnPAR, breaks = seq(0, 2500, 60), include.lowest = TRUE)

# Next, calculate the mean Ts5cm and ET_TP39 for each bin and each year
par_bin <- SV_Met_VDT_long_h %>%
  dplyr::group_by(condition, SV_Met_VDT_long_h$PARdn_bin)%>%
  dplyr::summarize(PARdn = mean(dnPAR, na.rm=T), 
            measurement = mean(measurement, na.rm=T))

View(par_bin_39)

corr_PAR <- par_bin%>%
  ggplot( aes(x = PARdn, y = (measurement*3600), color = condition)) +
  geom_point(size=1) +
  #geom_line(size=0.5)+
  stat_smooth(method = "gam", formula = y ~ s(x, k=0.5), size = 1, se = F)+
  #stat_smooth(method = "lm", formula = y ~ x + I(x^0.5), size = 1, se = F)+
  scale_x_continuous(quote("PAR ("*umol*" "*m^-2*" "*h^-1*")"),
                     limits=c(0, 1600),
                     breaks = seq(from = 0, to = 1600, by = 500),
                     expand=c(0.01,0.01))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 14),
                     breaks = seq(from = 0, to = 14, by = 4),
                     expand = expansion(mult = c(0.01, 0.01)))+
  scale_color_manual(values = c("V_CN" = "orange", 
                                "V_33D" = "red2", 
                                "V_55A"="magenta4", 
                                "V_33A"="cyan3", 
                                "V_55D"="lightskyblue"),
                     labels=c('CN', '33D', '55A', '33A', '55D')) +
  labs(title="(b)")+
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x =element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.text=element_text(size=12),
    #legend.position = "none", 
    legend.position = c(0.8, 0.75), 
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"),
    legend.key.width = unit(0.6, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

corr_PAR

## TEMPERATURE
# First, create a new column for Ts5cm bin values
SV_Met_VDT_long_h$Tair_bin <- cut(SV_Met_VDT_long_h$Tair,  breaks = seq(0, 40, 0.5), include.lowest = TRUE)

# Next, calculate the mean Ts5cm and ET_TP39 for each bin and each year
Tair_bin <- SV_Met_VDT_long_h %>% 
  dplyr::group_by(condition, SV_Met_VDT_long_h$Tair_bin) %>%
  dplyr::summarize(Tair = mean(Tair, na.rm=T), 
            measurement = mean(measurement, na.rm=T))

View(Tair_bin)

corr_Tair <- Tair_bin%>%
  ggplot( aes(x = Tair, y = (measurement*3600), color = condition)) +
  geom_point(size=1) +
  #geom_line(size=0.5)+
  #stat_smooth(method = "lm", formula = y ~ x + I(x^9), size = 1, se = F)+
  stat_smooth(method = "gam", formula = y ~ s(x, k=0.5), size = 1, se = F)+
  #stat_smooth(method = "loess", formula = y ~ x + I(x^0.9), size = 1)+
  scale_x_continuous(quote(""*T["air"]*"  (°C)"),
                     limits=c(0, 30), 
                     breaks = seq(from = 0, to = 30, by = 5),
                     expand=c(0.01,0.01))+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 14), 
                     breaks = seq(from = 0, to = 14, by = 4),
                     expand=c(0.01,0.01)) +
  scale_color_manual(values = c("V_CN" = "orange", 
                                "V_33D" = "red2", 
                                "V_55A"="magenta4", 
                                "V_33A"="cyan3", 
                                "V_55D"="lightskyblue"),
                     labels=c('CN', '33D', '55A', '33A', '55D')) +
  labs(title="(c)")+
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
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

corr_Tair

## VPD
# First, create a new column for Ts5cm bin values
SV_Met_VDT_long_h$vpd_bin <- cut(SV_Met_VDT_long_h$vpd,  breaks =  seq(0, 4, 0.05), include.lowest = TRUE)

# Next, calculate the mean Ts5cm and ET_TP39 for each bin and each year
vpd_bin <- SV_Met_VDT_long_h %>% 
  dplyr::group_by(condition, SV_Met_VDT_long_h$vpd_bin) %>%
  dplyr::summarize(vpd = mean(vpd, na.rm=T), 
            measurement = mean(measurement, na.rm=T))

View(vpd_bin)

corr_VPD <- vpd_bin%>%
  ggplot( aes(x = vpd, y = (measurement*3600), color = condition)) +
  geom_point(size=1) +
  #geom_line(size=0.5)+
  stat_smooth(method = "gam", formula = y ~ s(x, k=0.5), size = 1, se = F)+
  #stat_smooth(method = "lm", formula = y ~ x + I(x^0.5), size = 1, se = F)+
  scale_x_continuous("VPD (kPa)",
                     limits=c(0, 3.2), 
                     breaks = seq(from = 0, to = 3.2, by = 0.5),
                     expand=c(0.01,0.01)) +
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 14), 
                     breaks = seq(from = 0, to = 14, by = 4),
                     expand=c(0.01,0.01)) +
  scale_color_manual(values = c("V_CN" = "orange", 
                                "V_33D" = "red2", 
                                "V_55A"="magenta4", 
                                "V_33A"="cyan3", 
                                "V_55D"="lightskyblue"),
                     labels=c('CN', '33D', '55A', '33A', '55D')) +
  labs(title="(d)")+
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
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

corr_VPD

## VPD
# First, create a new column for Ts5cm bin values
SV_Met_VDT_long_h$REW_bin <- cut(SV_Met_VDT_long_h$REW20cm,  breaks =  seq(0.3, 1.9, 0.02), include.lowest = TRUE)

# Next, calculate the mean Ts5cm and ET_TP39 for each bin and each year
REW_bin <- SV_Met_VDT_long_h %>% 
  dplyr::group_by(condition, SV_Met_VDT_long_h$REW_bin) %>%
  dplyr::summarize(REW = mean(REW20cm, na.rm=T), 
            measurement = mean(measurement, na.rm=T))

View(vpd_bin)

corr_REW <- REW_bin%>%
  ggplot( aes(x = REW, y = (measurement*3600), color = condition)) +
  geom_point(size=1) +
  #geom_line(size=0.5)+
  stat_smooth(method = "gam", formula = y ~ s(x, k=0.5), size = 1, se = F)+
  scale_x_continuous(quote(""*REW["0-20cm"]*""), 
                     limits=c(0.35, 1.7), 
                     breaks = seq(from = 0.35, to = 1.6, by = 0.4),
                     expand=c(0.01,0.01)) +
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 14), 
                     breaks = seq(from = 0, to = 14, by = 4),
                     expand=c(0.01,0.01)) +
  scale_color_manual(values = c("V_CN" = "orange", 
                                "V_33D" = "red2", 
                                "V_55A"="magenta4", 
                                "V_33A"="cyan3", 
                                "V_55D"="lightskyblue"),
                     labels=c('CN', '33D', '55A', '33A', '55D')) +
  labs(title="(e)")+
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
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

corr_REW

gA_6 <- ggplotGrob(corr_PAR) 
gB_6 <- ggplotGrob(corr_Tair)
gC_6 <- ggplotGrob(corr_VPD)
gD_6 <- ggplotGrob(corr_REW)

# Arrange the four charts     
g6 <- grid.arrange(gA_6, gB_6 , gC_6, gD_6,
                   nrow=2) 

# draw it
grid.newpage() 
grid.draw(g6)   

ggsave("Fig6.png", plot=g6, width = 6, height = 6, dpi = 300)

# Principal component analysis (PCA)

# Read file
dly_SV_Met <- read_csv("C:/Users/user/OneDrive - McMaster University/Documents/phd/Papers/Paper_IV/Manuscript/M4_V3_20240626/Data/dly_SV_Met.csv")
View(dly_SV_Met)

pca_dly_upd <- dly_SV_Met %>%
  filter(Month != "1" & Month != "2" & Month != "3" & Month != "12")%>%
  dplyr::select(dnPAR, 
                Tairmean, 
                vpdmean, 
                REW20cm, 
                Year, 
                Month, 
                Day,
                V_CN, 
                V_33D, 
                V_55A, 
                V_33A, 
                V_55D)

View(pca_yrmth_upd)

pca_dly_upd <- pca_dly_upd[!is.na(pca_dly_upd$V_CN), ]
pca_dly_upd <- pca_dly_upd[!is.na(pca_dly_upd$V_33D), ]
pca_dly_upd <- pca_dly_upd[!is.na(pca_dly_upd$V_55A), ]
pca_dly_upd <- pca_dly_upd[!is.na(pca_dly_upd$V_33A), ]
pca_dly_upd <- pca_dly_upd[!is.na(pca_dly_upd$V_55D), ]

pca_dly_upd_ <- pca_dly_upd

pcaa_upd_dly <- pca_dly_upd[,c("dnPAR", "Tairmean", "vpdmean", "REW20cm", "V_CN", "V_33D", "V_55A", "V_33A", "V_55D")]

names(pcaa_upd_dly)

colnames(pcaa_upd_dly) <- c("PAR", "Tair", "VPD", "REW", "CN",  "33D", "55A", "33A", "55D")

View(pcaa_upd_dly)
tpd.pca_upd_dly <- prcomp(pcaa_upd_dly, center = TRUE, scale = TRUE)
summary(tpd.pca_upd_dly)
str(tpd.pca_upd_dly)

pca_final.season <- month.abb[pca_dly_upd_$Month]

# Reorder the levels of pca_final.season according to months' order
pca_final.season <- factor(pca_final.season, levels = month.abb[c(4,5, 6, 7, 8, 9, 10, 11)])

# Define the color gradient for the growing seasons
season_colors <- colorRampPalette(c("magenta", "darkgreen", "orange", "red"))(length(unique(pca_final.season)))

PCA_SV <- ggbiplot(tpd.pca_upd_dly, 
                    ellipse=FALSE,  
                    #labels=rownames(pcaa_upd), 
                    groups=pca_final.season,
                    circle = FALSE,
                    #scale = TRUE,
                    labels.size=5,
                    var.scale = 1,
                    #varname.adjust=3,
                    varname.size = 4)+
  #scale_colour_manual(values = c("magenta3","darkorange1","forestgreen"))+
  scale_color_manual(values = season_colors) +  #
  scale_x_continuous(quote("PC1 (73.78% explained var.)"),
                     limits=c(-2, 2),
                     breaks = seq(from = -2, to = 2, by = 0.5),
                     expand=c(0.004,0.004)) +
  scale_y_continuous(quote("PC2 (10.57% explained var.)"),
                     limits=c(-2, 2),
                     breaks = seq(from = -2, to = 2, by = 0.5),
                     expand = expansion(mult = c(0.01, 0.01))) +
  labs(title="(a)")+
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(
    legend.title = element_blank(),
    #legend.position = c(0.50, 0.95),
    legend.direction="vertical",
    legend.text=element_text(size=12),
    legend.background = element_rect(fill="white", 
                                     size=0.5, linetype="solid"),
    legend.key.size = unit(0.6, "cm"),
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.5, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.x = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -8, size = 18),
    plot.margin = margin(0.1,.2,0.1,0.2, "cm"))

PCA_SV

ggsave("Fig6.png", plot=PCA_SV, width = 20, height = 15, units = "cm") 


Fig6_VDT <- plot_grid(PCA_SV,
                      # ,
                      # rel_heights = C(1.5),
                      # rel_widths = c(1.5),
                      plot_grid(corr_PAR, corr_Tair, corr_VPD, corr_REW,
                                ncol = 2, 
                                align = "hv"
                                # , 
                                # rel_widths = c(1,1,1,1),
                                # rel_heights = C(1,1,1,1)
                      ),
                      nrow = 1, ncol = 2,
                      rel_widths = c(1, 1), 
                      rel_heights = c(0.5, 1)
                      # ,
                      #labels = c('A')
                      # ,  # Optional: Add labels if needed
                      #align = "hv"
)

Fig6_VDT   

ggsave("Fig6_VDT.png", plot=Fig6_VDT, width = 35, height = 15, units = "cm") 

# Hourly

pca_hh_upd <- SV_Met_VDT %>%
  filter(Month != 1 & Month != 2 & Month != 3 & Month != 12)%>%
  dplyr::select(dnPAR, 
                Tair, 
                vpd, 
                REW20cm, 
                Year, 
                Month, 
                Day,
                V_CN, 
                V_33D, 
                V_55A, 
                V_33A, 
                V_55D)

View(pca_hh_upd)

pca_hh_upd <- pca_hh_upd[!is.na(pca_hh_upd$V_CN), ]
pca_hh_upd <- pca_hh_upd[!is.na(pca_hh_upd$V_33D), ]
pca_hh_upd <- pca_hh_upd[!is.na(pca_hh_upd$V_55A), ]
pca_hh_upd <- pca_hh_upd[!is.na(pca_hh_upd$V_33A), ]
pca_hh_upd <- pca_hh_upd[!is.na(pca_hh_upd$V_55D), ]
pca_hh_upd <- pca_hh_upd[!is.na(pca_hh_upd$dnPAR), ]
pca_hh_upd <- pca_hh_upd[!is.na(pca_hh_upd$Tair), ]
pca_hh_upd <- pca_hh_upd[!is.na(pca_hh_upd$vpd), ]
pca_hh_upd <- pca_hh_upd[!is.na(pca_hh_upd$REW20cm), ]

pca_hh_upd_ <- pca_hh_upd

pcaa_upd_hh <- pca_hh_upd[,c("dnPAR", "Tair", "vpd", "REW20cm", "V_CN", "V_33D", "V_55A", "V_33A", "V_55D")]

names(pcaa_upd_hh)

colnames(pcaa_upd_hh) <- c("PAR", "Tair", "VPD", "REW", "CN",  "33D", "55A", "33A", "55D")

View(pcaa_upd_hh)
tpd.pca_upd_hh <- prcomp(pcaa_upd_hh, center = TRUE, scale = TRUE)
summary(tpd.pca_upd_hh)
str(tpd.pca_upd_hh)

pca_final.season <- month.abb[pca_hh_upd_$Month]

# Reorder the levels of pca_final.season according to months' order
pca_final.season <- factor(pca_final.season, levels = month.abb[c(4,5, 6, 7, 8, 9, 10, 11)])

# Define the color gradient for the growing seasons
season_colors <- colorRampPalette(c("blue", "darkgreen", "orange", "red", "blue"))(length(unique(pca_final.season)))

PCA_SV_hh <- ggbiplot(tpd.pca_upd_hh, 
                   ellipse=FALSE,  
                   #labels=rownames(pcaa_upd), 
                   groups=pca_final.season,
                   circle = FALSE,
                   #scale = TRUE,
                   labels.size=5,
                   var.scale = 1, 
                   #varname.adjust=3,
                   varname.size = 4)+
  #scale_colour_manual(values = c("magenta3","darkorange1","forestgreen"))+
  scale_color_manual(values = season_colors) +  #
  scale_x_continuous(quote("PC1 (79.3% explained var.)"),
                     limits=c(-2, 2),
                     breaks = seq(from = -2, to = 2, by = 0.5),
                     expand=c(0.004,0.004)) +
  scale_y_continuous(quote("PC2 (8.1% explained var.)"),
                     limits=c(-2, 2),
                     breaks = seq(from = -2, to = 2, by = 0.5),
                     expand = expansion(mult = c(0.01, 0.01))) +
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(
    legend.title = element_blank(),
    #legend.position = c(0.50, 0.95),
    legend.direction="vertical",
    legend.background = element_rect(fill="white", 
                                     size=0.5, linetype="solid"),
    legend.key.size = unit(0.6, "cm"),
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    axis.text.x = element_text(angle=0, size = 18, hjust = 0.5, color="black"),
    axis.text.y = element_text(size=18, colour="black"),
    axis.title.x = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title = element_text(hjust = 0.02, vjust = -8, size = 14),
    plot.margin = margin(0.1,.2,0.1,0.2, "cm"))

PCA_SV_hh  


  