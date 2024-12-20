library(ggplot2)
library(dplyr)
data <- read.table("MAF_0.05_results.txt", header = TRUE)
qg_data <- data[2:43, ]
xz_data <- data[44:79, ]
xj_data <- data[80:112, ]
All_data <- data[2:112, ]

combined_data <- rbind(qg_data, xz_data, xj_data, All_data) %>%
  mutate(group = rep(c("QG", "XZ", "XJ", "All"), 
                     c(nrow(qg_data), nrow(xz_data), nrow(xj_data), nrow(All_data))))

four_group_violin <- ggplot(data = combined_data, aes(x = factor(group, levels = c("All", "XJ", "QG", "XZ")), y = MAF_0.05, fill = group)) +
  geom_violin(trim = FALSE, draw_quantiles = NULL, width = 0.7, scale = "width") +
  geom_boxplot(width = 0.1, fill = "white") +
  labs(x = "pop", y = "MAF_count") +
  scale_fill_manual(values = c("#F3D266", "#20B2AA", "#CD5C5C", "#6A5ACD")) + 
  theme_minimal() +
  theme(
    panel.background = element_rect(fill = "white"),
    axis.line = element_line(color = "black"),
    axis.text = element_text(size = 18),
    axis.title = element_text(size = 18),
    plot.title = element_text(size = 18),
    legend.position = "none",
    panel.grid = element_blank()
  )

four_group_violin
