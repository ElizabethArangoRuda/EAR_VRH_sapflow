library(tidyverse)
library(combinat)  # For generating tree combinations
library(zoo)
library(gridExtra)

MCS_SV_oav %>%
  mutate(Month = month(DateTime)) %>%
  group_by(treatment, Group, Hour) %>%
  summarise(
    SV_avg = mean(SV, na.rm = TRUE)
  ) %>%
  mutate(Time = make_datetime(year = 2023, month = 01, day = 01, hour = as.integer(Hour), min = 00, sec = 00),
         Time = as.POSIXct(Time, tz = "UTC") - hours(1))%>%
  ungroup() -> diurnal_data


MCS_SV_oav %>%
  mutate(Month = month(DateTime)) %>%
  filter(treatment=="55A")%>%
  group_by(Group, Hour) %>%
  summarise(
    SV_avg = mean(SV, na.rm = TRUE)
  ) %>%
  mutate(Time = make_datetime(year = 2023, month = 01, day = 01, hour = as.integer(Hour), min = 00, sec = 00))%>%
  ungroup() -> Adiurnal_data55A

# Filter for `55D` group and SV1 to SV5 sensors
sv_55d <- diurnal_data %>%
  filter(treatment == "55D") 


SV_Met_VDT

MCS_B3$SV_avg <- rowMeans(MCS_B3[, c("DiffV3_1_3AVG", "DiffV3_14_3AVG", "DiffV3_3_3AVG")], na.rm = TRUE)

# Plot the result
ggplot(MCS_B3, aes(x = DateTimeDOY, y = SV_avg)) +
  geom_line(color = "blue", size = 1) +
  geom_line(data = VDT_Box3_23, aes(x = DateTimeDOY, y = B3_55D_23, color = "B3_55D_23"), size = 1, linetype = "dashed") +
  labs(x = "DateTime", y = "Average SV", title = "Average SV Over Time") +
  theme_minimal()




# Create a plot comparing SV1, SV2, SV3, SV4, SV5 with 55D
MTC_1 <- ggplot() +
  geom_line(data = diurnal_data %>% filter(treatment %in% c("CN")),
            aes(x = as.POSIXct(Time, tz = "UTC"), y = SV_avg, color = Group), size=0.8) +
  geom_line(data = sv_55d,
            aes(x = as.POSIXct(Time, tz = "UTC"), y = SV_avg, linetype = "55D"),
            size = 1, color = "black", ) +
  #geom_line(data = SV_Met_VDT_Szn_sd, aes(x = Time, y = V_CN*3600, color = "B3_55D_23"), color="darkorange3", size = 1, linetype = "dashed") +
  scale_x_datetime(
    name = "Hour",
    breaks = seq(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 22:00:00", tz = "UTC"),
      by = "2 hours"
    ),
    labels = function(x) format(x, "%H"),  # Show only hours
    limits = c(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 22:00:00", tz = "UTC")
    ),
    expand = c(0.004, 0.004)  # Ensures exact range without extra padding
  ) +
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits = c(-1, 10),
                     breaks = seq(0, 10, by = 2)) +
  labs(title = "(a) CN vs 55D") +
  scale_color_manual(
    values = c("SV1" = "blue", "SV2" = "green", "SV3" = "red", 
               "SV4" = "purple", "SV5" = "orange"),
    breaks = c("SV1", "SV2", "SV3", "SV4", "SV5"),
    labels = c("Trial 1", "Trial 2", "Trial 3", "Trial 4", "Trial 5")
  ) +
  scale_linetype_manual(
    values = c("SV1" = "solid", "SV2" = "solid", "SV3" = "solid", 
               "SV4" = "solid", "SV5" = "solid", "55D" = "solid"),
    breaks = c("Trio 1", "Trio 2", "Trio 3", "Trio 4", "Trio 5", "55D")
  ) +
  theme(panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
        axis.text.x  = element_text(angle = 0, size = 18, hjust = 0.4, color = "black"),
        axis.title.x = element_blank(),
        axis.text.y  = element_text(size = 18, colour = "black"),
        axis.title.y = element_text(size = 18, colour = "black"),
        plot.title = element_text(hjust = 0.02, vjust = -9, size = 16),
        legend.text = element_text(size = 14),
        legend.title = element_blank(),
        legend.position = c(0.15, 0.6),     
        legend.direction = "vertical",
        legend.background = element_blank(),
        legend.key.size = unit(0.4, "cm"), 
        legend.key.width = unit(1, "cm"),
        legend.key = element_rect(colour = NA, fill = NA),
        plot.margin = margin(0.1, .5, 0.5, 0.2, "cm"))

MTC_1 

MTC_2 <- ggplot() +
  geom_line(data = diurnal_data %>% filter(treatment %in% c("33D")),
            aes(x = as.POSIXct(Time, tz = "UTC"), y = SV_avg, color = Group), size=0.8) +
  geom_line(data = sv_55d,
            aes(x = as.POSIXct(Time, tz = "UTC"), y = SV_avg, linetype = "55D"),
            size = 1, color = "black", ) +
  #geom_line(data = SV_Met_VDT_Szn_sd, aes(x = Time, y = V_55D*3600, color = "B3_55D_23"), size = 1, linetype = "dashed") +
  scale_x_datetime(
    name = "Hour",
    breaks = seq(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 22:00:00", tz = "UTC"),
      by = "2 hours"
    ),
    labels = function(x) format(x, "%H"),  # Show only hours
    limits = c(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 22:00:00", tz = "UTC")
    ),
    expand = c(0.004, 0.004)  # Ensures exact range without extra padding
  )+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits = c(-1, 10),
                     breaks = seq(0, 10, by = 2)) +
  labs(title = "(b) 33D vs 55D") +
  scale_color_manual(
    values = c("SV1" = "blue", "SV2" = "green", "SV3" = "red", 
               "SV4" = "purple", "SV5" = "orange", "55D" = "black"),
    breaks = c("SV1", "SV2", "SV3", "SV4", "SV5", "55D"),
    labels = c("33D1", "33D2", "33D3", "33D4", "33D5", "55D")
  ) +
  scale_linetype_manual(
    values = c("SV1" = "solid", "SV2" = "solid", "SV3" = "solid", 
               "SV4" = "solid", "SV5" = "solid", "55D" = "solid"),
    breaks = c("SV1", "SV2", "SV3", "SV4", "SV5", "55D")
  ) +
  theme(panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
        axis.text.x  = element_text(angle = 0, size = 18, hjust = 0.4, color = "black"),
        axis.title.x = element_blank(),
        axis.text.y  = element_text(size = 18, colour = "black"),
        axis.title.y = element_text(size = 18, colour = "black"),
        plot.title = element_text(hjust = 0.02, vjust = -9, size = 16),
        legend.text = element_text(size = 14),
        legend.title = element_blank(),
        legend.position = "none",     
        legend.direction = "vertical",
        legend.background = element_blank(),
        legend.key.size = unit(0.4, "cm"), 
        legend.key.width = unit(1, "cm"),
        legend.key = element_rect(colour = NA, fill = NA),
        plot.margin = margin(0.1, .5, 0.5, 0.2, "cm"))

MTC_2

MTC_3 <- ggplot() +
  geom_line(data = Adiurnal_data55A,
            aes(x = as.POSIXct(Time, tz = "UTC"), y = SV_avg, color = Group),  size=0.8) +
  geom_line(data = sv_55d,
            aes(x = as.POSIXct(Time, tz = "UTC"), y = SV_avg, linetype = "55D"),
            size = 1, color = "black", ) +
  #geom_line(data = SV_Met_VDT_Szn_sd, aes(x = Time, y = V_55D*3600, color = "B3_55D_23"), size = 1, linetype = "dashed") +
  scale_x_datetime(
    name = "Hour",
    breaks = seq(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 22:00:00", tz = "UTC"),
      by = "2 hours"
    ),
    labels = function(x) format(x, "%H"),  # Show only hours
    limits = c(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 22:00:00", tz = "UTC")
    ),
    expand = c(0.004, 0.004)  # Ensures exact range without extra padding
  )+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits = c(-1, 10),
                     breaks = seq(0, 10, by = 2)) +
  labs(title = "(c) 55A vs 55D") +
  scale_color_manual(
    values = c("SV1" = "blue", "SV2" = "green", "SV3" = "red", 
               "SV4" = "purple", "SV5" = "orange", "55D" = "black"),
    breaks = c("SV1", "SV2", "SV3", "SV4", "SV5", "55D"),
    labels = c("55A1", "55A2", "55A3", "55A4", "55A5", "55D")
  ) +
  scale_linetype_manual(
    values = c("SV1" = "solid", "SV2" = "solid", "SV3" = "solid",
               "SV4" = "solid", "SV5" = "solid", "55D" = "solid"),
    breaks = c("SV1", "SV2", "SV3", "SV4", "SV5", "55D")
  ) +
  theme(panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
        axis.text.x  = element_text(angle = 0, size = 18, hjust = 0.4, color = "black"),
        axis.title.x =  element_text(size = 18, colour = "black", vjust = -1),
        axis.text.y  = element_text(size = 18, colour = "black"),
        axis.title.y = element_text(size = 18, colour = "black"),
        plot.title = element_text(hjust = 0.02, vjust = -9, size = 16),
        legend.text = element_text(size = 14),
        legend.title = element_blank(),
        legend.position = "none",   
        legend.direction = "vertical",
        legend.background = element_blank(),
        legend.key.size = unit(0.4, "cm"), 
        legend.key.width = unit(1, "cm"),
        legend.key = element_rect(colour = NA, fill = NA),
        plot.margin = margin(0.1, .5, 0.5, 0.2, "cm"))

MTC_3 

MTC_4 <- ggplot() +
  geom_line(data = diurnal_data %>% filter(treatment %in% c("33A")), 
            aes(x = as.POSIXct(Time, tz = "UTC"), y = SV_avg, color = Group),  size=0.8) +
  geom_line(data = sv_55d, 
            aes(x = as.POSIXct(Time, tz = "UTC"), y = SV_avg, linetype = "55D"), 
            size = 1, color = "black", ) +
  #geom_line(data = SV_Met_VDT_Szn_sd, aes(x = Time, y = V_55D*3600, color = "B3_55D_23"), size = 1, linetype = "dashed") +
  scale_x_datetime(
    name = "Hour",
    breaks = seq(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 22:00:00", tz = "UTC"),
      by = "2 hours"
    ),
    labels = function(x) format(x, "%H"),  # Show only hours
    limits = c(
      as.POSIXct("2023-01-01 00:00:00", tz = "UTC"),
      as.POSIXct("2023-01-01 22:00:00", tz = "UTC")
    ),
    expand = c(0.004, 0.004)  # Ensures exact range without extra padding
  )+
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits = c(-1, 10),
                     breaks = seq(0, 10, by = 2)) +
  labs(title = "(d) 33A vs 55D") +
  scale_color_manual(
    values = c("SV1" = "blue", "SV2" = "green", "SV3" = "red", 
               "SV4" = "purple", "SV5" = "orange", "55D" = "black"),
    breaks = c("SV1", "SV2", "SV3", "SV4", "SV5", "55D"),
    labels = c("33A1", "33A2", "33A3", "33A4", "33A5", "55D")
  ) +
  scale_linetype_manual(
    values = c("SV1" = "solid", "SV2" = "solid", "SV3" = "solid",
               "SV4" = "solid", "SV5" = "solid", "55D" = "solid"),
    breaks = c("SV1", "SV2", "SV3", "SV4", "SV5", "55D")
  ) +
  theme(panel.background = element_rect(fill = "white", colour = "black", linetype = "solid"),
        axis.text.x  = element_text(angle = 0, size = 18, hjust = 0.4, color = "black"),
        axis.title.x =  element_text(size = 18, colour = "black", vjust = -1),
        axis.text.y  = element_text(size = 18, colour = "black"),
        axis.title.y = element_text(size = 18, colour = "black"),
        plot.title = element_text(hjust = 0.02, vjust = -9, size = 16),
        legend.text = element_text(size = 14),
        legend.title = element_blank(),
        legend.position = "none",      
        legend.direction = "vertical",
        legend.background = element_blank(),
        legend.key.size = unit(0.4, "cm"), 
        legend.key.width = unit(1, "cm"),
        legend.key = element_rect(colour = NA, fill = NA),
        plot.margin = margin(0.1, .5, 0.5, 0.2, "cm"))

MTC_4  

F9_jgr_Rev <- grid.arrange(
  MTC_1, MTC_2,     
  MTC_3, MTC_4, 
  nrow = 2)    

ggsave("9_jgr_Rev.png", plot=F9_jgr_Rev, width = 12, height = 10, dpi = 300)