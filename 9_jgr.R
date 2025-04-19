library(tidyverse)
library(combinat)
library(zoo)
library(patchwork)
  
# BOX 1

MCS_B1 <- VDT_Box1_23 %>%
  select(YEAR, DOY, Hour, Minute, DateTimeDOY,
         DiffV_5_AVG,  
         DiffV_6_AVG, 
         DiffV_3_AVG,  
         DiffV_27_AVG, 
         DiffV_28_AVG, 
         DiffV_1_AVG,  
         DiffV_2_AVG,  
         DiffV_12_AVG, 
         DiffV_26_AVG, 
         DiffV_13_AVG, 
         DiffV_14_AVG, 
         DiffV_31_AVG, 
         DiffV_32_AVG, 
         DiffV_22_AVG, 
         DiffV_23_AVG, 
         DiffV_24_AVG, 
         DiffV_29_AVG, 
         DiffV_30_AVG) 

View(MCS_B1)

write.csv(MCS_B1,"C:/Users/eliar/OneDrive - McMaster University/Desktop/Education/Paper_IV/Paper_IV/Manuscript/M4_V5_/MCS_B1.csv", row.names = FALSE)

# Pivot data to long format
MCS_B1_long <- MCS_B1 %>%
  pivot_longer(cols = starts_with("DiffV"), names_to = "Tree", values_to = "SV")

# Define treatment assignment
treatment_mapB1 <- c(
  "DiffV_5_AVG" = "55A", "DiffV_6_AVG" = "55A", "DiffV_3_AVG" = "55A",
  "DiffV_27_AVG" = "55A", "DiffV_28_AVG" = "55A", "DiffV_1_AVG" = "55A",
  "DiffV_2_AVG" = "55A",
  "DiffV_12_AVG" = "33D", "DiffV_26_AVG" = "33D",
  "DiffV_13_AVG" = "CN", "DiffV_14_AVG" = "CN", "DiffV_31_AVG" = "CN",
  "DiffV_32_AVG" = "CN", "DiffV_22_AVG" = "CN", "DiffV_23_AVG" = "CN",
  "DiffV_24_AVG" = "CN", "DiffV_29_AVG" = "CN", "DiffV_30_AVG" = "CN"
)

# Add treatment column
MCS_B1_long <- MCS_B1_long %>%
  mutate(treatment = treatment_mapB1[Tree]) %>%
  select(YEAR, DOY, Hour, Minute, SV, treatment, Tree, DateTimeDOY)

# View transformed dataset
View(MCS_B1_long)

write.csv(MCS_B1_long,"C:/Users/eliar/OneDrive - McMaster University/Desktop/Education/Paper_IV/Paper_IV/Manuscript/M4_V5_/MCS_B1_long.csv", row.names = FALSE)

# BOX 2

MCS_B2 <- VDT_Box2_23 %>%
  select(YEAR, DOY, Hour, Minute, DateTimeDOY,
         DiffV_31_AVG, 
         DiffV_32_AVG, 
         DiffV_7_AVG,  
         DiffV_8_AVG,   
         DiffV_9_AVG,  
         DiffV_10_AVG, 
         DiffV_11_AVG, 
         DiffV_12_AVG, 
         DiffV_3_AVG,  
         DiffV_4_AVG,  
         DiffV_1_AVG,  
         DiffV_19_AVG, 
         DiffV_2_AVG,  
         DiffV_5_AVG, 
         DiffV_6_AVG)  

write.csv(MCS_B2,"C:/Users/eliar/OneDrive - McMaster University/Desktop/Education/Paper_IV/Paper_IV/Manuscript/M4_V5_/MCS_B2.csv", row.names = FALSE)

names(MCS_B2) <- c("YEAR", "DOY", "Hour", "Minute", 
                   "DateTimeDOY", 
                   "DiffV_31_2AVG",
                   "DiffV_32_2AVG",
                   "DiffV_7_2AVG",
                   "DiffV_8_2AVG",
                   "DiffV_9_2AVG",
                   "DiffV_10_2AVG",
                   "DiffV_11_2AVG",
                   "DiffV_12_2AVG",
                   "DiffV_3_2AVG",
                   "DiffV_4_2AVG",
                   "DiffV_1_2AVG",
                   "DiffV_19_2AVG",
                   "DiffV_2_2AVG", 
                   "DiffV_5_2AVG",
                   "DiffV_6_2AVG")

plot(MCS_B2$DiffV_31_2AVG,  
     type = "l", 
     pch = 16,
     xlab = "DateTimeDOY", 
     ylab = "Sap flow density (kg d-1)",
     main = "Plot of DiffV_16_AVG vs. DateTimeDOY",
     #ylim = c(0, 0.1),
     col="turquoise4")
lines(MCS_B2$DiffV_32_2AVG, 
      lwd = 2,
      col="yellow")
lines(MCS_B2$DiffV_7_2AVG, 
      lwd = 2,
      col="green")
lines(MCS_B2$DiffV_8_2AVG,
      lwd = 2,
      col="magenta1")
lines(MCS_B2$DiffV3_15_2AVG, 
      lwd = 2,
      col="slateblue1")
lines(MCS_B2$DiffV3_14_2AVG,
      lwd = 2,
      col="yellow4")

# Pivot data to long format
MCS_B2_long <- MCS_B2 %>%
  pivot_longer(cols = starts_with("DiffV"), names_to = "Tree", values_to = "SV")

# Define treatment assignment
treatment_mapB2 <- c("DiffV_31_2AVG" = "33A", 
                     "DiffV_32_2AVG" = "33A", 
                     "DiffV_7_2AVG"  = "33A",  
                     "DiffV_8_2AVG"  = "33A",  
                     "DiffV_9_2AVG"  = "33D",  
                     "DiffV_10_2AVG" = "33D", 
                     "DiffV_11_2AVG" = "33D", 
                     "DiffV_12_2AVG" = "33D", 
                     "DiffV_3_2AVG"  = "33D",  
                     "DiffV_4_2AVG" = "33D",  
                     "DiffV_1_2AVG" = "55A",  
                     "DiffV_19_2AVG" = "55A", 
                     "DiffV_2_2AVG" = "55A",  
                     "DiffV_5_2AVG" = "55A",  
                     "DiffV_6_2AVG" = "55A")  

# Add treatment column
MCS_B2_long <- MCS_B2_long %>%
  mutate(treatment = treatment_mapB2[Tree]) %>%
  select(YEAR, DOY, Hour, Minute, SV, treatment, Tree, DateTimeDOY)

# View transformed data set
View(MCS_B2_long)

write.csv(MCS_B2_long,"C:/Users/eliar/OneDrive - McMaster University/Desktop/Education/Paper_IV/Paper_IV/Manuscript/M4_V5_/MCS_B2_long.csv", row.names = FALSE)

# BOX 3

MCS_B3 <- VDT_Box3_23 %>%
  select(YEAR, DOY, Hour, Minute, DateTimeDOY,
         DiffV3_8_AVG,  
         DiffV3_1_AVG,  
         DiffV3_14_AVG, 
         DiffV3_3_AVG,  
         DiffV3_5_AVG,  
         DiffV3_6_AVG, 
  ) 

write.csv(MCS_B3,"C:/Users/eliar/OneDrive - McMaster University/Desktop/Education/Paper_IV/Paper_IV/Manuscript/M4_V5_/MCS_B3.csv", row.names = FALSE)

names(MCS_B3) <- c("YEAR", "DOY", "Hour", "Minute", "DateTimeDOY", 
                   "DiffV3_8_3AVG", 
                   "DiffV3_1_3AVG", 
                   "DiffV3_14_3AVG",
                   "DiffV3_3_3AVG", 
                   "DiffV3_5_3AVG", 
                   "DiffV3_6_3AVG" )


plot(MCS_B3$DiffV3_8_3AVG,  
     type = "l", 
     pch = 16,
     xlab = "DateTimeDOY", 
     ylab = "Sap flow density (kg d-1)",
     main = "Plot of DiffV_16_AVG vs. DateTimeDOY",
     col="turquoise4")
lines(MCS_B3$DiffV3_1_3AVG, 
      lwd = 2,
      col="yellow")
lines(MCS_B3$DiffV3_3_3AVG, 
      lwd = 2,
      col="green")
lines(MCS_B3$DiffV3_6_3AVG, 
      lwd = 2,
      col="magenta1")
lines(MCS_B3$DiffV3_15_3AVG, 
      lwd = 2,
      col="slateblue1")
lines(MCS_B3$DiffV3_14_3AVG,
      lwd = 2,
      col="yellow4")

View(MCS_B3)

# Pivot data to long format
MCS_B3_long <- MCS_B3 %>%
  pivot_longer(cols = starts_with("DiffV3"), names_to = "Tree", values_to = "SV")

# Define treatment assignment
treatment_mapB3 <- c(
  "DiffV3_8_3AVG"  = "33A", 
  "DiffV3_1_3AVG"  = "55D",  
  "DiffV3_14_3AVG"  = "55D",  
  "DiffV3_3_3AVG"  = "55D",  
  "DiffV3_5_3AVG"  = "CN",  
  "DiffV3_6_3AVG"  = "CN")   

MCS_B3$SV_avg <- rowMeans(MCS_B3[, c("DiffV3_1_3AVG", "DiffV3_14_3AVG", "DiffV3_3_3AVG")], na.rm = TRUE)

# Add treatment column
MCS_B3_long <- MCS_B3_long %>%
  mutate(treatment = treatment_mapB3[Tree]) %>%
  select(YEAR, DOY, Hour, Minute, SV, treatment, Tree, DateTimeDOY)

# View transformed data set
View(MCS_B3_long)

write.csv(MCS_B3_long,"C:/Users/eliar/OneDrive - McMaster University/Desktop/Education/Paper_IV/Paper_IV/Manuscript/M4_V5_/MCS_B3_long.csv", row.names = FALSE)

# Combine the three datasets
MCS_SV_1 <- bind_rows(MCS_B3_long, MCS_B2_long, MCS_B1_long)

# View the combined dataset
View(MCS_SV)

write.csv(MCS_SV_1,"C:/Users/eliar/OneDrive - McMaster University/Desktop/Education/Paper_IV/Paper_IV/Manuscript/M4_V5_/MCS_SV_1.csv", row.names = FALSE)

# Generate dynamic groupings of three trees per treatment
generate_tree_groups <- function(data) {
  treatments <- unique(data$treatment)  # Get all unique treatments
  tree_groups <- list()
  
  for (treat in treatments) {
    # Get trees for each treatment
    trees <- unique(na.omit(data$Tree[data$treatment == treat]))
    
    # Ensure there are at least 3 trees to generate combinations
    if (length(trees) >= 3) {
      groups <- combn(trees, 3, simplify = FALSE)
      group_names <- paste0("SV", seq_along(groups))
      tree_groups[[treat]] <- setNames(groups, group_names)
    } else {
      tree_groups[[treat]] <- "Not enough trees for combination"
    }
  }
  
  return(tree_groups)
}

# Generate tree groupings dynamically
tree_groups <- generate_tree_groups(MCS_SV_1)

selected_tree_groups <- lapply(tree_groups, function(sublist) {
  if (length(sublist) >= 5) {
    return(sublist[1:5])
  } else {
    return(sublist)  # Return all elements if less than 5
  }
})

# Print the result
print(selected_tree_groups)

compute_group_avg_max <- function(data, groups_by_treatment) {
  results_avg <- list()
  results_max <- list()
  
  # Ensure required columns exist
  required_cols <- c("Tree", "treatment", "YEAR", "DOY", "Hour", "Minute", "SV")
  missing_cols <- setdiff(required_cols, colnames(data))
  if (length(missing_cols) > 0) {
    stop(paste("Missing columns in dataset:", paste(missing_cols, collapse = ", ")))
  }
  
  for (treat in names(groups_by_treatment)) {
    groups <- groups_by_treatment[[treat]]
    
    for (group_name in names(groups)) {
      group_trees <- groups[[group_name]]
      
      # Compute AVERAGE SV for each timestamp
      avg_data <- data %>%
        filter(Tree %in% group_trees, treatment == treat) %>%
        group_by(YEAR, DOY, Hour, Minute) %>%
        summarise(SV_avg = mean(SV, na.rm = TRUE), .groups = "drop") %>%
        mutate(Group = group_name, treatment = treat)
      
      results_avg[[paste(treat, group_name, sep = "_")]] <- avg_data
      
      # Compute MAX SV_avg per day (DOY) for 0-10 AM
      max_data <- avg_data %>%
        filter(Hour >= 0 & Hour <= 10) %>%
        group_by(YEAR, DOY) %>%
        summarise(SV_max = max(SV_avg, na.rm = TRUE), .groups = "drop") %>%
        mutate(Group = group_name, treatment = treat)
      
      results_max[[paste(treat, group_name, sep = "_")]] <- max_data
    }
  }
  
  # Combine results
  avg_df <- bind_rows(results_avg)
  max_df <- bind_rows(results_max)
  
  # Merge avg and max data on YEAR, DOY, Group, and Treatment
  final_data <- left_join(avg_df, max_df, by = c("YEAR", "DOY", "Group", "treatment"))
  
  return(final_data)
}

# Example usage
MCS_SV_summary <- compute_group_avg_max(MCS_SV_1, selected_tree_groups)

write.csv(MCS_SV_summary,"C:/Users/eliar/OneDrive - McMaster University/Desktop/Education/Paper_IV/Paper_IV/Manuscript/M4_V5_/MCS_SV_summary.csv", row.names = FALSE)

# Create datetime 

MCS_SV_Sum <- MCS_SV_summary %>%
  mutate(
    DateTime = make_datetime(year = YEAR, month = 1, day = 1) + 
      days(DOY - 1) + hours(Hour) + minutes(Minute),
    DateTime = with_tz(DateTime, "UTC")  # Convert to UTC
  )

View(MCS_SV_Sum)

# Plotting average SV

MCS_SV_Sum %>% 
  filter (treatment =="55D") %>%
  ggplot(aes(x = DateTime, y = SV_avg, color = Group)) +
  geom_point(size = 1) +
  geom_hline(yintercept = mean(MCS_SV_summary$SV_avg, na.rm = TRUE), linetype = "dashed", color = "black") +
  scale_y_continuous(quote(sv),
                     limits=c(0.25, 0.45), 
                     breaks = seq(from = 0.25, to = 0.45, by = 0.1)) +
  labs(title = "Sap Flow Velocity Over Time 55D",
       x = "Date",
       y = "Sap Flow Velocity (SV_avg)",
       color = "Group") +
  theme_minimal() +
  theme(legend.position = "bottom")

# Calculating sap flow velocity in cm/s from K vales and SV max values. Filtering out values higher than 15 cm/s

MCS_SV_oav <- MCS_SV_Sum %>%
  filter(DOY >= 91 & DOY <= 334)%>%
  group_by(YEAR, DOY, Group, treatment) %>%
  mutate(K = ifelse(SV_avg == 0 | is.na(SV_avg), NA, (SV_max - SV_avg) / SV_avg),
         SV = ifelse(K > 0, 0.0119 *K^1.231, 0),
         Hour = as.numeric(Hour),  # Convert Hour to numeric
         Minute = as.numeric(Minute)) %>% # Convert Minute to numeric if necessary) %>%
  ungroup()%>%
  group_by(YEAR, DOY, Hour, Group, treatment) %>%
  summarise(SV = mean(SV, na.rm=T),
            SV_max = max(SV, na.rm=T),
            K = mean(K, na.rm=T),
            .groups = "drop")%>%
  mutate(SV = SV*3600,
         DateTime = make_datetime(year = YEAR, month = 1, day = 1, hour=Hour) + days(DOY - 1))

View(MCS_SV_oav)

MCS_SV_Fig1 <- MCS_SV_oav %>% 
  filter(treatment == "33A")%>%
  ggplot(aes(x = DateTime, y = SV, color = Group)) +
  geom_line(size = 1) +
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 20),
                     breaks = seq(from = 0, to = 20, by = 5)) +
  labs(title = "33A Treatment",
       x = "Date",
       color = "Group") +
  theme_minimal() +
  theme(legend.position = "bottom")

MCS_SV_Fig1 

MCS_SV_Fig2 <- MCS_SV_oav %>% 
  filter (treatment =="CN") %>%
  ggplot(aes(x = DateTime, y = SV, color = Group)) +
  geom_line(size = 1) +
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 20),
                     breaks = seq(from = 0, to = 20, by = 5)) +
  labs(title = "CN Treatment",
       x = "Date",
       color = "Group") +
  theme_minimal() +
  theme(legend.position = "bottom")

MCS_SV_Fig2

MCS_SV_Fig3 <- MCS_SV_oav %>% 
  filter (treatment =="55A") %>%
  ggplot(aes(x = DateTime, y = SV, color = Group)) +
  geom_line(size = 1) +
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 20),
                     breaks = seq(from = 0, to = 20, by = 5)) +
  labs(title = "55A Treatment",
       x = "Date",
       color = "Group") +
  theme_minimal() +
  theme(legend.position = "bottom")

MCS_SV_Fig3

MCS_SV_Fig4 <- MCS_SV_oav %>% 
  filter (treatment =="33D") %>%
  ggplot(aes(x = DateTime, y = SV, color = Group)) +
  geom_line(size = 1) +
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 20),
                     breaks = seq(from = 0, to = 20, by = 5)) +
  labs(title = "33D Treatment",
       x = "Date",
       color = "Group") +
  theme_minimal() +
  theme(legend.position = "bottom")

MCS_SV_Fig4

MCS_SV_Fig5 <- MCS_SV_oav %>% 
  filter (treatment =="55D") %>%
  ggplot(aes(x = DateTime, y = SV, color = Group)) +
  geom_line(size = 1) +
  scale_y_continuous(quote("SV ("*cm*" "*h^-1*")"),
                     limits=c(0, 20),
                     breaks = seq(from = 0, to = 20, by = 5)) +
  labs(title = "55D Treatment",
       x = "Date",
       color = "Group") +
  theme_minimal() +
  theme(legend.position = "bottom")

MCS_SV_Fig5

MCS_SV_Figall <-
  MCS_SV_Fig1 + MCS_SV_Fig2 + MCS_SV_Fig3 + MCS_SV_Fig4 + MCS_SV_Fig5 + plot_layout(ncol = 2)

MCS_SV_Figall

ggsave("MCS_SV_Figall.png", plot=MCS_SV_Figall, width = 14, height = 18, dpi = 300)

# Calculate Mean Diurnal SV for each combination

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