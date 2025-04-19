library(tidyverse)
library(lubridate)
library(hms)
library(gridExtra)

head(K_VDT_avg)
View(K_VDT_avg)

anova_data <- K_VDT_avg %>%
  select(V_CN, V_33D, V_55A, V_33A, V_55D) %>%
  pivot_longer(cols = everything(), 
               names_to = "Treatment", 
               values_to = "V") %>%
  drop_na()

write.csv(K_VDT_avg,"C:/Users/eliar/OneDrive - McMaster University/Desktop/Education/Paper_IV/Paper_IV/Manuscript/M4_V5_/K_VDT_avg.csv", row.names = FALSE)


View(anova_data)

anova_results <- aov(V ~ Treatment, data = anova_data)
summary(anova_results)

# p-value: <2×10 −16
# meaning the result is highly statistically significant. There is overwhelming evidence to reject the null hypothesis that all treatment means are equal.

# Tukey's HSD test
tukey_results <- TukeyHSD(anova_results)
print(tukey_results)


ggplot(anova_data, aes(x = Treatment, y = V, fill = Treatment)) +
  geom_boxplot() +
  labs(title = "Sap Velocity by Treatment",
       x = "Treatment", y = "Sap Velocity (V)") +
  theme_minimal()

library(multcompView)

cld <- multcompLetters4(anova_results, tukey_results)
print(cld)
  
ggplot(anova_data, aes(x = Treatment, y = V)) +
  geom_boxplot(aes(fill = Treatment)) +
  labs(title = "Pairwise Comparisons of Sap Velocity",
       x = "Treatment", y = "Sap Velocity (V)") +
  theme_minimal()

# Reviewer 2 - Figure with standard deviation

write.csv(SV_Met_VDT,"C:/Users/eliar/OneDrive - McMaster University/Desktop/Education/Paper_IV/Paper_IV/Manuscript/M4_V5_/SV_Met_VDT.csv", row.names = FALSE)


SV_Met_VDT_Szn_sd <- SV_Met_VDT%>% 
  filter(season.y!="Winter" & season.y!="Other")%>%
  dplyr::select(Time,
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
  group_by(Year, Hour) %>%
  summarise(
    # Sap flow velocity - Standard deviation
    V_CN_sd  = sd(V_CN, na.rm=T),
    V_33D_sd = sd(V_33D, na.rm=T),
    V_55A_sd = sd(V_55A, na.rm=T),
    V_33A_sd = sd(V_33A, na.rm=T),
    V_55D_sd = sd(V_55D, na.rm=T),
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
  mutate(Time = make_datetime(year = 2023, month = 01, day = 01, hour = as.integer(Hour), min = 00, sec = 00))

SV_Met_VDT_Szn_sd

# CN Treatment

GS_sd_1 <- SV_Met_VDT_Szn_sd %>% 
  ggplot(aes(x = as.POSIXct(Time, tz = "UTC")))+
  geom_line(aes(
    y = V_CN*3600, color="darkorange3"), 
    size = 1)+
  geom_point(aes(
    y = V_CN*3600, color="darkorange3"),  
    size = 1)+
  geom_ribbon(aes(ymin = (V_33D - V_33D_sd) * 3600, 
                  ymax = (V_33D + V_33D_sd) * 3600),
              fill = "darkorange3", alpha = 0.2) +  
  scale_x_datetime(
    name = "Hour",
    breaks = seq(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 23:00:00", tz = "UTC"),
      by = "2 hours"
    ),
    labels = function(x) format(x, "%H"), 
    limits = c(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 23:00:00", tz = "UTC")
    ),
    expand = c(0.004, 0.004)  
  )+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits = c(-2, 8),
                     breaks = seq(0, 10, by = 2)) +
  labs(title = "(a) CN") +
  theme(panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
        axis.text.x  = element_text(angle = 0, size = 18, hjust = 0.4, color = "black"),
        axis.title.x = element_text(size = 18, colour = "black", vjust = -1),
        axis.text.y  = element_text(size = 18, colour = "black"),
        axis.title.y = element_text(size = 18, colour = "black"),
        plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
        legend.title = element_blank(),
        legend.position = "none",     
        legend.direction = "vertical",
        legend.background = element_blank(),
        legend.key.size = unit(0.4, "cm"), 
        legend.key.width = unit(1, "cm"),
        legend.key = element_rect(colour = NA, fill = NA),
        plot.margin = margin(0.1, .5, 0.5, 0.2, "cm"))

GS_sd_1

# 33D Treatment

GS_sd_2 <- SV_Met_VDT_Szn_sd%>%
  ggplot(aes(x = as.POSIXct(Time, tz = "UTC")))+
  geom_line(aes(
    y = V_33D*3600), 
    size = 1, color="magenta4")+
  geom_point(aes(
    y = V_33D*3600),  
    size = 1, color="magenta4")+
  geom_ribbon(aes(ymin = (V_33D - V_33D_sd) * 3600, 
                  ymax = (V_33D + V_33D_sd) * 3600),
              fill = "magenta4", alpha = 0.2) +  # Shaded area
  scale_x_datetime(
    name = "Hour",
    breaks = seq(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 23:00:00", tz = "UTC"),
      by = "2 hours"
    ),
    labels = function(x) format(x, "%H"),  # Show only hours
    limits = c(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 23:00:00", tz = "UTC")
    ),
    expand = c(0.004, 0.004)  # Ensures exact range without extra padding
  )+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits = c(-2, 8),
                     breaks = seq(0, 10, by = 2)) +
  labs(title="(b) 33D")+
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x  = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y  = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title   = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none",   
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

GS_sd_2

# 55A Treatment

GS_sd_3 <- SV_Met_VDT_Szn_sd%>%
  ggplot(aes(x = as.POSIXct(Time, tz = "UTC")))+
  geom_line(aes(
    y = V_55A*3600), 
    size = 1, color="deepskyblue3")+
  geom_point(aes(
    y = V_55A*3600),  
    size = 1, color="deepskyblue3")+
  geom_ribbon(aes(ymin = (V_33D - V_33D_sd) * 3600, 
                  ymax = (V_33D + V_33D_sd) * 3600),
              fill = "deepskyblue3", alpha = 0.2) +  # Shaded area
  scale_x_datetime(
    name = "Hour",
    breaks = seq(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 23:00:00", tz = "UTC"),
      by = "2 hours"
    ),
    labels = function(x) format(x, "%H"),  # Show only hours
    limits = c(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 23:00:00", tz = "UTC")
    ),
    expand = c(0.004, 0.004)  # Ensures exact range without extra padding
  )+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits = c(-2, 8),
                     breaks = seq(0, 10, by = 2)) +
  labs(title="(c) 55A")+
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x  = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y  = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title   = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none",   
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

GS_sd_3

GS_sd_4 <- SV_Met_VDT_Szn_sd%>%
  ggplot(aes(x = as.POSIXct(Time, tz = "UTC")))+
  geom_line(aes(
    y = V_33A*3600), 
    size = 1,
    color="deeppink3")+
  geom_point(aes(
    y = V_33A*3600),  
    size = 1,
    color="deeppink3")+
  geom_ribbon(aes(ymin = (V_33D - V_33D_sd) * 3600, 
                  ymax = (V_33D + V_33D_sd) * 3600),
              fill = "deeppink3", alpha = 0.2) +  # Shaded area
  scale_x_datetime(
    name = "Hour",
    breaks = seq(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 23:00:00", tz = "UTC"),
      by = "2 hours"
    ),
    labels = function(x) format(x, "%H"),  # Show only hours
    limits = c(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 23:00:00", tz = "UTC")
    ),
    expand = c(0.004, 0.004)  # Ensures exact range without extra padding
  )+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits = c(-2, 8),
                     breaks = seq(0, 10, by = 2)) +
  labs(title="(d) 33A")+
  theme(
    panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
    axis.text.x  = element_text(angle=0, size = 18, hjust = 0.4, color="black"),
    axis.title.x = element_text(size=18, colour="black", vjust=-1),
    axis.text.y  = element_text(size=18, colour="black"),
    axis.title.y = element_text(size=18, colour="black"),
    plot.title   = element_text(hjust = 0.02, vjust = -7, size = 18),
    legend.title = element_blank(),
    legend.position = "none",   
    legend.direction="vertical",
    legend.background = element_blank(),
    legend.key.size = unit(0.4, "cm"), 
    legend.key.width = unit(1, "cm"),
    legend.key = element_rect(colour = NA, fill = NA),
    plot.margin = margin(0.1,.5,0.5,0.2, "cm"))

GS_sd_4

GS_sd_5 <- SV_Met_VDT_Szn_sd%>%
  ggplot(aes(x = as.POSIXct(Time, tz = "UTC")))+
  geom_line(aes(
    y = V_55D*3600), 
    size = 1,
    color="darkslategray")+
  geom_point(aes(
    y = V_55D*3600),  
    size = 1,
    color="darkslategray")+
  geom_ribbon(aes(ymin = (V_33D - V_33D_sd) * 3600, 
                  ymax = (V_33D + V_33D_sd) * 3600),
              fill = "darkslategray", alpha = 0.2) +  # Shaded area
  scale_x_datetime(
    name = "Hour",
    breaks = seq(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 23:00:00", tz = "UTC"),
      by = "2 hours"
    ),
    labels = function(x) format(x, "%H"),  # Show only hours
    limits = c(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 23:00:00", tz = "UTC")
    ),
    expand = c(0.004, 0.004)  # Ensures exact range without extra padding
  )+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits = c(-2, 8),
                     breaks = seq(0, 10, by = 2)) +
  labs(title="(e) 55D")+
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

GS_sd_5

GS_sd_6 <- SV_Met_VDT_Szn_sd %>% 
  pivot_longer(cols = starts_with("V_"), 
               names_to = "Sensor", 
               values_to = "Value") %>%
  filter(Sensor %in% c("V_CN", "V_33D", "V_55A", "V_33A", "V_55D")) %>%
  ggplot(aes(x = as.POSIXct(Time, tz = "UTC"), 
             y = Value * 3600, 
             color = Sensor, 
             group = Sensor)) +
  geom_line(size = 1) +
  geom_point(size = 1) +
  scale_color_manual(values = c("V_CN" = "darkorange3", 
                                "V_33D" = "magenta4", 
                                "V_55A" = "deepskyblue3", 
                                "V_33A" = "deeppink3", 
                                "V_55D" = "darkslategray"),
                     labels = c("V_CN" = "CN", 
                                "V_33D" = "33D", 
                                "V_55A" = "55A", 
                                "V_33A" = "33A", 
                                "V_55D" = "55D")) +
  scale_x_datetime(
    name = "Hour",
    breaks = seq(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 23:00:00", tz = "UTC"),
      by = "2 hours"
    ),
    labels = function(x) format(x, "%H"),  # Show only hours
    limits = c(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 23:00:00", tz = "UTC")
    ),
    expand = c(0.004, 0.004)  # Ensures exact range without extra padding
  )+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits = c(-2, 8),
                     breaks = seq(0, 10, by = 2)) +
  labs(title = "(f)") +
  theme(panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
        axis.text.x  = element_text(angle = 0, size = 18, hjust = 0.4, color = "black"),
        axis.title.x = element_text(size = 18, colour = "black", vjust = -1),
        axis.text.y  = element_text(size = 18, colour = "black"),
        axis.title.y = element_text(size = 18, colour = "black"),
        plot.title = element_text(hjust = 0.02, vjust = -7, size = 18),
        legend.text=element_text(size=14),
        legend.title = element_blank(),
        legend.position = c(0.2, 0.6),     
        legend.direction = "vertical",
        legend.background = element_blank(),
        legend.key.size = unit(0.4, "cm"), 
        legend.key.width = unit(1, "cm"),
        legend.key = element_rect(colour = NA, fill = NA),
        plot.margin = margin(0.1, .5, 0.5, 0.2, "cm"))

GS_sd_6

GS_sd <- grid.arrange(
  GS_sd_1, GS_sd_2,   
  GS_sd_3, GS_sd_4, 
  GS_sd_5, GS_sd_6, 
  nrow = 3, ncol=2)    

ggsave("SD_R2.png", plot=GS_sd, width = 14, height = 12, dpi = 300)

GS_sd_shade <- grid.arrange(
  GS_sd_1, GS_sd_2,   
  GS_sd_3, GS_sd_4, 
  GS_sd_5,
  nrow = 5)    

ggsave("GS_sd_shade.png", plot=GS_sd_shade, width = 8, height = 16, dpi = 300)



 