library(ggplot2)
library(dplyr)

data <- read.table("all_sample_minor_MAF_filtered.txt", header = TRUE)

qg_data <- data[2:43, ]
xz_data <- data[44:79, ]
xj_data <- data[80:112, ]
All_data <- data[2:112, ]

combined_data <- rbind(qg_data, xz_data, xj_data, All_data) %>%
  mutate(group = rep(c("QG", "XZ", "XJ", "All"), 
                     c(nrow(qg_data), nrow(xz_data), nrow(xj_data), nrow(All_data))))

four_group_violin <- ggplot(data = combined_data, aes(x = factor(group, levels = c("All", "XJ", "QG", "XZ")), 
                                                      y = Minor_Ratio, fill = group)) +
  geom_violin(trim = FALSE, alpha = 0.6, width = 0.7, scale = "width") + 
  geom_jitter(aes(color = group), width = 0.2, linewidth = 1.5, alpha = 1) + 
  geom_hline(yintercept = 0.35, color = "black", linetype = "dashed", linewidth = 1) +
  labs(x = "Population", y = "MAF_Ratio") +
  scale_fill_manual(values = c("#F3D266", "#20B2AA", "#CD5C5C", "#6A5ACD")) + 
  scale_color_manual(values = c("#F3D266", "#20B2AA", "#CD5C5C", "#6A5ACD")) + 
  theme_minimal() +
  theme(
    panel.background = element_rect(fill = "white"),
    axis.line = element_line(color = "black"),
    axis.text = element_text(size = 24),
    axis.title = element_text(size = 24),
    plot.title = element_text(size = 24),
    legend.position = "none",
    panel.grid = element_blank()
  )
print(four_group_violin)
