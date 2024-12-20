##Figure 3A
library(stats)
library(ggplot2)

df <- read.table("BH_0.05_all_BBAA.txt", header = TRUE)
df$p_value_BH <- p.adjust(df$p_value, method = "BH")
df <- df[df$p_value_BH < 0.05, ]
XJtoQG<- df[grepl('^QG', df$P2) & grepl('^XJ', df$P3), ]
XJtoQG$Group <- "QG_XJ"

XJtoXZ <- df[grepl('^XZ', df$P2) & grepl('^XJ', df$P3), ]
XJtoXZ$Group <- "XZ_XJ"

QGtoXJ <- df[grepl('^XJ', df$P2) & grepl('^QG', df$P3), ]
QGtoXJ$Group <- "XJ_QG"

QGtoXZ <- df[grepl('^XZ', df$P2) & grepl('^QG', df$P3), ]
QGtoXZ$Group <- "XZ_QG"

XZtoQG <- df[grepl('^QG', df$P2) & grepl('^XZ', df$P3), ]
XZtoQG$Group <- "QG_XZ"

XZtoXJ <- df[grepl('^XJ', df$P2) & grepl('^XZ', df$P3), ]
XZtoXJ$Group <- "XJ_XZ"

group_counts <- data.frame(
  Group = factor(c("XJ", "XJ", "QG", "QG", "XZ", "XZ"),
                 levels = c("XJ", "QG", "XZ")),
  Subgroup = factor(c("QGtoXJ", "XZtoXJ",
                      "XJtoQG", "XZtoQG",
                      "XJtoXZ", "QGtoXZ"),
                    levels = c( "QGtoXJ", "XZtoXJ",
                               "XJtoQG",  "XZtoQG",
                               "XJtoXZ", "QGtoXZ")),
  Count = c(
     nrow(QGtoXJ), nrow(XZtoXJ),
    nrow(XJtoQG),  nrow(XZtoQG),
    nrow(XJtoXZ), nrow(QGtoXZ)
  )
)

ggplot(data = group_counts, aes(x = Group, y = Count, fill = Subgroup)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Clustered Bar Chart",
       x = "Group",
       y = "Count") +
  scale_fill_manual(values = c(
    "QGtoXJ" = "#20B2AA", "XZtoXJ" = "#6A5ACD",
    "XJtoQG" = "#CD5C5C", "XZtoQG" = "#6A5ACD",
    "XJtoXZ" = "#CD5C5C", "QGtoXZ" = "#20B2AA"
  )) + 
  theme_classic() +
  theme(
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_rect(color = "black", fill = NA, linewidth = 0.6),
    axis.text = element_text(size = 20),
    axis.title = element_text(size = 20),
    plot.title = element_text(size = 20)
  ) + scale_y_continuous(expand = c(0,0))+
  guides(fill = "none")+ ylim(0, 260)

##Figure 3B
library(dplyr)
library(ggplot2)

df <- read.table("BH_0.05_all_BBAA_standardized.txt",
                 header = TRUE)

subset_P2XJ_df <- df[grepl("^XJ", trimws(df$P2)), ]
subset_P2XJ_df <- subset_P2XJ_df[!grepl("^XJ", trimws(subset_P2XJ_df$P3)), ]

z_score_data_XJ <- subset_P2XJ_df %>%
  group_by(P3, P1, P2) %>%
  reframe(Z_score = Z_score)

z_score_data_XJ$group_label <- "P3 (to XJ)"

subset_P2QG_df <- df[grepl("^QG", trimws(df$P2)), ]
subset_P2QG_df <- subset_P2QG_df[!grepl("^QG", trimws(subset_P2QG_df$P3)), ]

z_score_data_QG <- subset_P2QG_df %>%
  group_by(P3, P1, P2) %>%
  reframe(Z_score = Z_score)

z_score_data_QG$group_label <- "P3 (to QG)"

subset_P2XZ_df <- df[grepl("^XZ", trimws(df$P2)), ]
subset_P2XZ_df <- subset_P2XZ_df[!grepl("^XZ", trimws(subset_P2XZ_df$P3)), ]

z_score_data_XZ <- subset_P2XZ_df %>%
  group_by(P3, P1, P2) %>%
  reframe(Z_score = Z_score)

z_score_data_XZ$group_label <- "P3 (to XZ)"

combined_data <- bind_rows(z_score_data_XJ, z_score_data_QG, z_score_data_XZ)

colors <- c("XJ" = "#CD5C5C", "QG" = "#20B2AA", "XZ" = "#6A5ACD")

combined_data$group <- ifelse(grepl("^XJ", combined_data$P3), "XJ", 
                              ifelse(grepl("^QG", combined_data$P3), "QG", 
                                     ifelse(grepl("^XZ", combined_data$P3), "XZ", "Other")))

combined_data$group_label <- factor(combined_data$group_label, levels = c("P3 (to XJ)", "P3 (to QG)", "P3 (to XZ)"))

ggplot(combined_data, aes(x = P3, y = Z_score, fill = group)) +
  geom_boxplot(aes(fill = group), outlier.shape = NA, color = "black", alpha = 0.4) +  
  geom_jitter(aes(color = group), width = 0.2, height = 0, size = 1.1, alpha = 0.6) + 
  scale_fill_manual(values = colors) + 
  scale_color_manual(values = colors) + 
  facet_wrap(~group_label, scales = "free_x", ncol = 3) + 
  labs(x = "P3", y = "Z_score") +  
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1),  
    panel.background = element_rect(fill = "white"),  
    panel.grid.major = element_line(color = "#e9e9e9", size = 0.25), 
    panel.grid.minor = element_line(color = "#e9e9e9", size = 0.25),  
    panel.border = element_rect(color = "black", fill = NA, size = 1) 
  )

##Figure 3C
library(dplyr)
library(ggplot2)
df <- read.table("BH_0.05_all_BBAA_standardized.txt",
                 header = TRUE)

subset_P2XJ_df <- df[grepl("^XJ", trimws(df$P2)), ]
subset_P2XJ_df <- subset_P2XJ_df[!grepl("^XJ", trimws(subset_P2XJ_df$P3)), ]

f4_ratio_data_XJ <- subset_P2XJ_df %>%
  group_by(P3, P1, P2) %>%
  reframe(f4_ratio = f4_ratio)
f4_ratio_data_XJ$group_label <- "P3 (to XJ)"

subset_P2QG_df <- df[grepl("^QG", trimws(df$P2)), ]
subset_P2QG_df <- subset_P2QG_df[!grepl("^QG", trimws(subset_P2QG_df$P3)), ]
f4_ratio_data_QG <- subset_P2QG_df %>%
  group_by(P3, P1, P2) %>%
  reframe(f4_ratio = f4_ratio)
f4_ratio_data_QG$group <- ifelse(grepl("^XJ", f4_ratio_data_QG$P3), "XJ", 
                                 ifelse(grepl("^XZ", f4_ratio_data_QG$P3), "XZ", "Other"))
f4_ratio_data_QG$group_label <- "P3 (to QG)"

subset_P2XZ_df <- df[grepl("^XZ", trimws(df$P2)), ]
subset_P2XZ_df <- subset_P2XZ_df[!grepl("^XZ", trimws(subset_P2XZ_df$P3)), ]
f4_ratio_data_XZ <- subset_P2XZ_df %>%
  group_by(P3, P1, P2) %>%
  reframe(f4_ratio = f4_ratio)
f4_ratio_data_XZ$group <- ifelse(grepl("^XJ", f4_ratio_data_XZ$P3), "XJ", 
                                 ifelse(grepl("^QG", f4_ratio_data_XZ$P3), "QG", "Other"))
f4_ratio_data_XZ$group_label <- "P3 (to XZ)"

combined_f4_ratio_data <- bind_rows(f4_ratio_data_XJ, f4_ratio_data_QG, f4_ratio_data_XZ)

colors <- c("XJ" = "#CD5C5C", "QG" = "#20B2AA", "XZ" = "#6A5ACD")

combined_f4_ratio_data$group_label <- factor(combined_f4_ratio_data$group_label, levels = c("P3 (to XJ)", "P3 (to QG)", "P3 (to XZ)"))

ggplot(combined_f4_ratio_data, aes(x = P3, y = f4_ratio, fill = group)) +
  geom_boxplot(aes(fill = group), outlier.shape = NA, color = "black", alpha = 0.4) +  
  geom_jitter(aes(color = group), width = 0.2, height = 0, size = 1.1, alpha = 0.6) +  
  scale_fill_manual(values = colors) + 
  scale_color_manual(values = colors) + 
  facet_wrap(~group_label, scales = "free_x", ncol = 3) +  
  labs(x = "P3", y = "f4_ratio") + 
  theme(
    axis.text.x = element_text(angle = 90, hjust = 1),  
    panel.background = element_rect(fill = "white"),  
    panel.grid.major = element_line(color = "#e9e9e9", size = 0.25), 
    panel.grid.minor = element_line(color = "#e9e9e9", size = 0.25),  
    panel.border = element_rect(color = "black", fill = NA, size = 1) 
  )

##Figure 3D
library(ggplot2)
library(dplyr)

df <- read.table("E:\\doctor\\EG_muti\\anew_vcf\\gene_flow\\Fbranch_filtered_output.txt", header = TRUE, sep = "\t")

df_filtered <- df %>%
  filter((grepl("^XJ", P3) & grepl("^QG", P2)) |
           (grepl("^XJ", P3) & grepl("^XZ", P2)) |
           (grepl("^QG", P3) & grepl("^XJ", P2)) |
           (grepl("^QG", P3) & grepl("^XZ", P2)) |
           (grepl("^XZ", P3) & grepl("^XJ", P2)) |
           (grepl("^XZ", P3) & grepl("^QG", P2)))

df_filtered <- df_filtered %>%
  mutate(group = case_when(
    grepl("^XJ", P3) & grepl("^QG", P2) ~ "XJ-QG",
    grepl("^XJ", P3) & grepl("^XZ", P2) ~ "XJ-XZ",
    grepl("^QG", P3) & grepl("^XJ", P2) ~ "QG-XJ",
    grepl("^QG", P3) & grepl("^XZ", P2) ~ "QG-XZ",
    grepl("^XZ", P3) & grepl("^XJ", P2) ~ "XZ-XJ",
    grepl("^XZ", P3) & grepl("^QG", P2) ~ "XZ-QG"
  ))

df_filtered$group <- factor(df_filtered$group, levels = c("XJ-QG", "XJ-XZ", "QG-XJ", "QG-XZ", "XZ-XJ", "XZ-QG"))

ggplot(df_filtered, aes(x = group, y = Fbranch, fill = group)) +
  stat_boxplot(geom = "errorbar", width = 0.5) + 
  geom_boxplot(outlier.shape = 1, width = 0.8, color = "black") + 
  xlab("Group") +  
  ylab("Fbranch Value") + 
  theme_bw() +  # 使用白色背景主题
  scale_fill_manual(values = c("XJ-QG" = "#CD5C5C", "XJ-XZ" = "#CD5C5C", 
                               "QG-XJ" = "#20B2AA", "QG-XZ" = "#20B2AA", 
                               "XZ-XJ" = "#6A5ACD", "XZ-QG" = "#6A5ACD")) + 
  theme(
    axis.text = element_text(size = 20), 
    axis.title = element_text(size = 20), 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(), 
    panel.border = element_rect(color = "black", linewidth = 1), 
    legend.position = "none" 
  )

##Figure 3E
library(ggplot2)
data <- data.frame(
  Subgroup = c('QGtoQG', 'XJtoQG', 'XZtoQG',
               'QGtoXJ', 'XJtoXJ', 'XZtoXJ',
               'QGtoXZ', 'XJtoXZ', 'XZtoXZ'),
  count1 = c(4, 83, 10, 0, 0, 0, 30, 44, 7),
  count2 = c(1, 32, 0, 0, 0, 0, 4, 21, 9),
  count3 = c(49, 152, 20, 0, 5, 0, 42, 83, 22),
  count4 = c(1, 25, 0, 0, 1, 0, 12, 23, 5),
  count5 = c(12, 85, 4, 0, 0, 0, 20, 50, 12),
  count6 = c(1, 27, 1, 0, 1, 0, 40, 49, 19),
  count7 = c(5, 81, 2, 2, 3, 3, 11, 48, 8),
  count8 = c(5, 39, 1, 0, 0, 0, 3, 11, 1),
  count9 = c(6, 95, 4, 1, 4, 5, 18, 68, 23),
  count10 = c(20, 113, 8, 0, 0, 0, 22, 67, 16),
  count11 = c(4, 59, 1, 3, 6, 0, 2, 42, 4),
  count12 = c(7, 89, 0, 0, 0, 0, 12, 58, 8),
  count13 = c(9, 86, 5, 0, 1, 0, 7, 23, 5),
  count14 = c(9, 85, 2, 0, 0, 0, 42, 44, 22),
  count15 = c(11, 71, 11, 0, 2, 1, 13, 29, 2),
  count16 = c(8, 42, 2, 0, 1, 0, 11, 26, 0),
  count17 = c(4, 99, 3, 2, 3, 0, 30, 70, 16),
  count18 = c(4, 51, 3, 0, 0, 0, 28, 48, 8),
  count19 = c(9, 141, 9, 3, 1, 2, 24, 90, 19),
  count20 = c(3, 99, 11, 0, 5, 2, 34, 95, 18),
  count21 = c(0, 56, 2, 0, 0, 0, 1, 16, 5),
  count22 = c(0, 33, 0, 0, 1, 1, 15, 38, 11),
  count23 = c(0, 20, 0, 0, 1, 1, 8, 23, 2),
  count24 = c(1, 65, 1, 0, 2, 0, 22, 41, 9),
  count25 = c(3, 40, 2, 1, 0, 0, 8, 15, 2),
  count26 = c(8, 51, 5, 0, 0, 0, 1, 27, 9),
  count27 = c(29, 142, 9, 0, 5, 0, 36, 85, 15),
  count28 = c(26, 173, 17, 1, 9, 1, 77, 124, 24),
  count29 = c(31, 108, 9, 0, 4, 4, 53, 78, 9),
  count30 = c(32, 127, 14, 4, 3, 0, 10, 37, 3),
  count31 = c(0, 41, 0, 0, 0, 2, 22, 40, 12),
  count32 = c(5, 42, 5, 0, 1, 0, 47, 35, 7),
  count33 = c(17, 93, 8, 0, 7, 2, 20, 91, 21),
  count34 = c(1, 48, 1, 0, 1, 0, 21, 36, 13),
  count35 = c(3, 43, 2, 0, 0, 1, 17, 65, 12),
  count36 = c(0, 42, 2, 0, 1, 1, 57, 91, 20),
  count37 = c(10, 46, 5, 0, 0, 0, 12, 15, 1),
  count38 = c(19, 79, 4, 1, 0, 0, 16, 44, 14),
  count39 = c(13, 75, 5, 0, 3, 0, 47, 71, 25),
  count40 = c(4, 50, 5, 0, 0, 0, 29, 40, 4),
  count41 = c(7, 58, 3, 0, 0, 0, 14, 47, 9),
  count42 = c(9, 80, 8, 2, 3, 1, 19, 71, 17),
  count43 = c(12, 94, 1, 0, 3, 1, 12, 46, 5),
  count44 = c(8, 99, 2, 2, 15, 2, 53, 93, 21),
  count45 = c(9, 40, 6, 0, 1, 1, 15, 32, 11),
  count46 = c(3, 39, 1, 0, 5, 0, 27, 42, 14),
  count47 = c(29, 177, 17, 2, 8, 4, 77, 169, 35),
  count48 = c(34, 167, 14, 0, 2, 2, 28, 80, 8),
  count49 = c(5, 43, 9, 0, 1, 1, 5, 29, 4),
  count50 = c(5, 121, 0, 0, 0, 0, 39, 81, 22)
)

library(tidyr)
data_long <- gather(data, key = 'Count', value = 'Value', -Subgroup)


data_long$Subgroup <- factor(data_long$Subgroup, levels = c('XJtoQG','XJtoXZ','QGtoXJ','QGtoXZ','XZtoXJ','XZtoQG'))


ggplot(data_long, aes(x = Subgroup, y = Value, fill = Subgroup)) +
  stat_boxplot(geom = "errorbar",width=0.5)+
  geom_boxplot(outlier.shape = 1, width=0.8) +
  xlab("Subgroup") + 
  ylab("Count") +
  theme_bw() + 
  scale_fill_manual(values = c("#CD5C5C","#CD5C5C","#20B2AA","#20B2AA","#6A5ACD","#6A5ACD")) +
  theme(axis.text = element_text(size = 20), 
        axis.title = element_text(size = 20),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        legend.position = "none",
        panel.border = element_rect(color = "black", linewidth = 1))

