library(ggplot2)
library(dplyr)
data <- read.table("all_sample.het", header = TRUE)

qg_data <- data[1:42, ]
xz_data <- data[43:78, ]
xj_data <- data[79:111, ]
All_data <- data[1:111, ]
combined_data <- rbind(qg_data, xz_data, xj_data, All_data) %>%
  mutate(group = rep(c("QG", "XZ", "XJ", "All"), 
                     c(nrow(qg_data), nrow(xz_data), nrow(xj_data), nrow(All_data))))
four_group_violin <- ggplot(data = combined_data, aes(x = factor(group, levels = c("All", "XJ", "QG", "XZ")), y = F_value, fill = group)) +
  geom_violin(trim = FALSE, draw_quantiles = NULL, width = 0.7, scale = "width") +
  geom_boxplot(width = 0.1, fill = "white") +
  labs( x = "Population", y = "F value") +
  scale_fill_manual(values = c("#F3D266", "#20B2AA", "#CD5C5C", "#6A5ACD")) + 
  theme_minimal() +
  geom_hline(yintercept = 0.0, linetype = "dashed", color = "black") +
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
