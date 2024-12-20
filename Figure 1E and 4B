library(ggplot2)

eigenvec <- read.table(
  "./5kb.subset.vcf.eigenvec",
  header = TRUE, sep=" ")
eigenvec_sub <- eigenvec[, c("name", "pc1", "pc2")]
ID <- eigenvec_sub$name
eigenvec_sub$pop[grepl("(^Q|^G)", ID)] <- "QG"
eigenvec_sub$pop[grepl("^X", ID)] <- "XJ"
eigenvec_sub$pop[grepl("^T", ID)] <- "XZ"
eigenvec_sub$pop[grepl("^G3", ID)] <- "G3"

light_colors <- c("QG" = "#20B2AA", "XJ" = "#CD5C5C", "XZ" = "#6A5ACD", "G3" = "black")

random_factor <- 0.01

eigenvec_sub$pc1 <- eigenvec_sub$pc1 + runif(nrow(eigenvec_sub), min = -random_factor, max = random_factor)
eigenvec_sub$pc2 <- eigenvec_sub$pc2 + runif(nrow(eigenvec_sub), min = -random_factor, max = random_factor)

p <- ggplot(eigenvec_sub, aes(x = pc1, y = pc2, color = pop, shape = pop)) +
  geom_point(size = 4, alpha = 0.8) +
  scale_color_manual(values = c("QG" = "#20B2AA", "XJ" = "#CD5C5C", "XZ" = "#6A5ACD", "G3" = "#696969")) +
  scale_shape_manual(values = c("QG" = 16, "XJ" = 17, "XZ" = 18, "G3" = 15)) +
  stat_ellipse(aes(fill = pop), geom = "polygon", level = 0.95, linetype = "blank", alpha = 0.2) + 
  scale_fill_manual(values = light_colors) +  
  theme_classic() + 
  theme(
    plot.background = element_rect(fill = "white"),
    text = element_text(size = 20),  
    axis.title = element_text(size = 20),  
    axis.text = element_text(size = 20) 
  ) +
  theme(plot.background = element_rect(fill = "white"),text = element_text(size = 20)) +
  labs(x = "PC1 (24.01%)", y = "PC2 (13.95%)")+
  guides(color = guide_legend(), shape = guide_legend()) +
  annotate("rect", xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = Inf, color = "black", fill = NA, size = 1)
p

