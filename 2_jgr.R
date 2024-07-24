# Script for figure 2

library(tidyverse)
library(patchwork)
library(grid)

# Read file
# dly_SV_Met <- read_csv("dly_SV_Met.csv")

# PAR

Met_1 <- dly_SV_Met%>%
  ggplot(aes(x=as.POSIXct(Time)), pch=21) + 
  #geom_line(aes(y=upPAR, color = "up"), size = 1)+  # Y
  geom_line(aes(y=dnPAR, color = "dn"), size = 1.25)+  # Y
  geom_point(aes(y=dnPAR, color = "dn"), size = 1.25)+  # Y
  scale_x_datetime(date_breaks = "month",
                   date_labels = c('J', 'J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D'),
                   labels=date_format("%b"),
                   expand=c(0,0),
                   limits = c(
                     as.POSIXct("2022-12-31"),
                     as.POSIXct("2023-12-31")))+  
  scale_y_continuous(quote("PAR ("*umol*" "*m^-2*" "*d^-1*")"),
                     limits=c(-10, 800), 
                     breaks = seq(from = 0, to = 800, by = 200)) +
  #scale_color_manual(values = c("up" = "darkred", "dn" = "orange"))+
  scale_color_manual(values = c("dn" = "darkorange4"))+
  labs(title="(a)")+
  guides(color=guide_legend(override.aes=list(fill=NA)))+ 
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(axis.text.x = element_text(angle=0, size = 18, hjust = -2, color="black"),
        axis.text.y = element_text(size=18, colour="black"),
        axis.title.x = element_blank(),
        legend.position = "none",
        #legend.position = c(0.2, 0.96),
        legend.direction="horizontal",
        legend.text=element_text(size=14),
        legend.title = element_blank(),
        legend.background = element_blank(),
        legend.key.size = unit(0.8, "cm"),
        legend.key.width = unit(1, "cm"),
        legend.key = element_rect(colour = NA, fill = NA),
        #axis.title.y = element_text(size=13, colour="black", vjust = 4),
        axis.title.y = element_text(size=18, colour="black"),
        plot.title = element_text(hjust = 0.01, vjust = -8, size = 18),
        plot.margin = margin(0.1,.2,0.1,0.2, "cm"))

Met_1

# Tair

Met_2 <- dly_SV_Met%>%
  ggplot(aes(x=as.POSIXct(Time)), pch=21) + 
  geom_line(aes(y=Tairmean, color = "Mean"), size = 1.25)+
  geom_point(aes(y=Tairmean, color = "Mean"), size = 1.25)+
  geom_line(aes(y=Tairmax, color = "Max"), size = 1)+
  geom_point(aes(y=Tairmax, color = "Max"), size = 1)+
  geom_line(aes(y=Tairmin, color = "Min"), size = 1)+
  geom_point(aes(y=Tairmin, color = "Min"), size = 1)+
  scale_x_datetime(date_breaks = "month",
                   date_labels = c('J', 'J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D'),
                   labels=date_format("%b"),
                   expand=c(0,0),
                   limits = c(
                     as.POSIXct("2022-12-31"),
                     as.POSIXct("2023-12-31")))+  
  scale_y_continuous(quote("Tair (°C)"),
                     limits=c(-15, 50),
                     breaks = seq(from = -10, to = 50, by = 10)) +
  scale_color_manual(values = c("Mean" = "black", "Max" = "red", "Min" = "brown4"))+
  labs(title="(b)")+
  guides(color=guide_legend(override.aes=list(fill=NA)))+ 
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(axis.text.x = element_text(angle=0, size = 18, hjust = -2, color="black"),
        axis.text.y = element_text(size=18, colour="black"),
        axis.title.x = element_blank(),
        legend.position = c(0.2, 0.96),
        #legend.position = "none",
        legend.direction="horizontal",
        legend.text=element_text(size=14),
        legend.title = element_blank(),
        legend.background = element_blank(),
        legend.key.size = unit(0.8, "cm"),
        legend.key.width = unit(1, "cm"),
        legend.key = element_rect(colour = NA, fill = NA),
        #axis.title.y = element_text(size=13, colour="black", vjust = 4),
        axis.title.y = element_text(size=18, colour="black"),
        plot.title = element_text(hjust = 0.01, vjust = -8, size = 18),
        plot.margin = margin(0.1,.2,0.1,0.2, "cm"))

Met_2 

# VPD

Met_3 <- dly_SV_Met%>%
  ggplot(aes(x=as.POSIXct(Time)), pch=21) + 
  geom_line(aes(y=vpdmean, color = "Mean"), size = 1.25)+
  geom_point(aes(y=vpdmean, color = "Mean"), size = 1.25)+
  geom_line(aes(y=vpdmax, color = "Max"), size = 1)+
  geom_point(aes(y=vpdmax, color = "Max"), size = 1)+
  geom_line(aes(y=vpdmin, color = "Min"), size = 1)+
  geom_point(aes(y=vpdmin, color = "Min"), size = 1)+
  scale_x_datetime(date_breaks = "month",
                   date_labels = c('J', 'J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D'),
                   labels=date_format("%b"),
                   expand=c(0,0),
                   limits = c(
                     as.POSIXct("2022-12-31"),
                     as.POSIXct("2023-12-31")))+  
  scale_y_continuous(quote("VPD (kPa)"),
                     limits=c(0, 4), 
                     breaks = seq(from = 0, to = 4, by = 0.5)) +
  scale_color_manual(values = c("Mean" = "black", "Max" = "blue", "Min" = "steelblue3"))+
  labs(title="(c)")+
  guides(color=guide_legend(override.aes=list(fill=NA)))+ 
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(axis.text.x = element_text(angle=0, size = 18, hjust = -2, color="black"),
        axis.text.y = element_text(size=18, colour="black"),
        axis.title.x = element_blank(),
        #legend.position = "none",
        legend.position = c(0.2, 0.96),
        legend.direction="horizontal",
        legend.text=element_text(size=14),
        legend.title = element_blank(),
        legend.background = element_blank(),
        legend.key.size = unit(0.8, "cm"),
        legend.key.width = unit(1, "cm"),
        legend.key = element_rect(colour = NA, fill = NA),
        axis.title.y = element_text(size=18, colour="black"),
        plot.title = element_text(hjust = 0.01, vjust = -8, size = 18),
        plot.margin = margin(0.1,.2,0.1,0.2, "cm"))

Met_3 

# REW vs Rain

Met_4 <- dly_SV_Met %>%
  ggplot(aes(x=as.POSIXct(Time)))+
  geom_bar((aes(y = Rain)), width=4,stat="identity", color="black") +
  geom_line(aes(y = REW20cm*25), color = "darkgreen", size=1) +
  #geom_line(aes(y = SM50*200, color = "0-50"), size=1) +
  scale_y_continuous(
    # Features of the first axis 
    quote("Precipitation (mm "*d^-1*")"),
    limits=c(0, 50), 
    breaks = seq(from = 0, to = 50, by = 10),  
    expand = expansion(mult = c(0.01, 0.01)), 
    # Add a second axis and specify its features
    sec.axis = sec_axis(~./25, name=quote(""*REW["0-20cm"]*"")))+
  #sec.axis = sec_axis(~./25, name=quote(""*REW["0-20"]*"  ("*m^2*" "*m^-2*" "*d^-1*")")))+
  scale_x_datetime(date_breaks = "month",
                   date_labels = c('J', 'J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D'),
                   labels=date_format("%b"),
                   expand=c(0,0),
                   limits = c(
                     as.POSIXct("2022-12-31"),
                     as.POSIXct("2023-12-31")))+  
  #scale_color_manual(values = c("0-20" = "darkgreen", "0-50" = "chartreuse2"))+
  labs(title="(d)")+
  guides(color=guide_legend(override.aes=list(fill=NA)))+ 
  theme(panel.background = element_rect(fill = "white", colour = "black"))+
  theme(axis.text.x = element_text(angle=0, size = 18, hjust = -2, color="black"),
        axis.text.y = element_text(size=18, colour="black"),
        axis.title.x = element_blank(),
        legend.position = c(0.2, 0.96),
        legend.direction="horizontal",
        legend.text=element_text(size=14), 
        legend.title = element_blank(),
        legend.background = element_blank(),
        legend.key.size = unit(0.8, "cm"),
        legend.key.width = unit(1, "cm"),
        legend.key = element_rect(colour = NA, fill = NA),
        #axis.title.y = element_text(size=13, colour="black", vjust = 4),
        axis.title.y = element_text(size=18, colour="black"),
        plot.title = element_text(hjust = 0.01, vjust = -8, size = 18),
        plot.margin = margin(0.1,.2,0.1,0.2, "cm"))

Met_4

g1 <- ggplotGrob(Met_1)  
g2 <- ggplotGrob(Met_2)    
g3 <- ggplotGrob(Met_3)  
g4 <- ggplotGrob(Met_4) 

g <- rbind(g1, g2, g3, g4, size = "last")
g$widths <- unit.pmax(g1$widths, g2$widths, g3$widths, g4$widths)
grid.newpage()
grid.draw(g)

#ggsave(file="mth_met.png", plot=g, width=12, height=12)

ggsave("Fig1.png", plot=g, width = 12, height = 12, dpi = 300)

# END



