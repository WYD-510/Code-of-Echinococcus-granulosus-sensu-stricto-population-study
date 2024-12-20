library(ggplot2)
setwd("TajimasD")

chr9_LD_region <- read.table("chr_LD_region_TajimasD.txt", header = TRUE)
exclude_chr9_LD_region <- read.table("exclude_chr_LD_region_TajimasD.txt", header = TRUE)
chr9_exclude_LD_region <- read.table("chr9_exclude_LD.txt", header = TRUE)

combined_data <- rbind(chr9_LD_region, exclude_chr9_LD_region, chr9_exclude_LD_region)
combined_data$Category <- factor(rep(c("chr9_LD_region", "exclude_chr9_LD_region", "chr9_exclude_LD_region"), 
                                     times = c(nrow(chr9_LD_region), nrow(exclude_chr9_LD_region), nrow(chr9_exclude_LD_region))))

ggplot(combined_data, aes(x = Category, y = TajimaD, fill = Category)) +
  geom_violin(trim = FALSE, alpha = 0.8) +
  geom_boxplot(width = 0.2, fill = "white", color = "black") +
  labs(
       x = "Category",
       y = "Tajimas' D") +
  theme_bw()  +
  geom_hline(yintercept = 0.0, linetype = "dashed", color = "black") +
  theme(
    panel.background = element_rect(fill = "white"),
    axis.line = element_line(color = "black"),
    axis.text = element_text(size = 20),
    axis.title = element_text(size = 20),
    plot.title = element_text(size = 20),
    legend.position = "none",
    panel.grid = element_blank()
  )

