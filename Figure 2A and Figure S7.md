##Display the ADMIXTURE result at K = 2.
library(ggplot2)
library(reshape2)
data_k3 <- read.table("5kb.ref.2.Q", header = FALSE, sep = " ")
colnames(data_k3) <- c("group", "id", "XZ", "XJ")
data_k3$id <- as.character(data_k3$id)
data_k3$id <- paste0(1:nrow(data_k3))
data_k3$id <- as.numeric(data_k3$id)
data_k3$group <- factor(data_k3$group, levels = c("XJ", "QG", "XZ"))
data_k3_long <- melt(data_k3, id.vars = c("group", "id"))
k2 <- ggplot(data_k3_long, aes(x = id, y = value, fill = variable)) +
  geom_bar(stat = "identity", width = 1) +
  scale_x_continuous(expand = c(0, 0), breaks = NULL) +
  scale_y_continuous(expand = c(0, 0), breaks = NULL) +
  scale_fill_manual(values = c("#20B2AA", "#CD5C5C"), guide = "none") +
  ylab(expression(paste(italic("K"), "=2"))) + theme(axis.title.y = element_text(size = 18))+
  facet_wrap(~group, scales = "free_x", ncol = 3) +  # ???ݷ?????????ʾ
  theme(strip.text.x = element_text(size = 18, face = "bold")) # ???÷?????ǩ????????С?ʹ?ϸ
print(k2)

##Display the ADMIXTURE result at K = 3.
library(ggplot2)
library(reshape2)
data_k3 <- read.table("5kb.ref.3.Q",header = FALSE, sep = " ")
colnames(data_k3) <- c("group", "id", "QG", "XZ", "XJ")
data_k3$id <- as.character(data_k3$id)
data_k3$id <- paste0(1:nrow(data_k3))
data_k3$id <- as.numeric(data_k3$id)
data_k3$group <- factor(data_k3$group, levels = c("XJ", "QG", "XZ"))

data_k3_long <- melt(data_k3, id.vars = c("group", "id"))

k3 <- ggplot(data_k3_long, aes(x = id, y = value, fill = variable)) +
  geom_bar(stat = "identity", width = 1) +
  scale_x_continuous(expand = c(0, 0), breaks = NULL) +
  scale_y_continuous(expand = c(0, 0), breaks = NULL) +
  scale_fill_manual(values = c("#20B2AA", "#6A5ACD", "#CD5C5C"), guide = "none") +
  ylab(expression(paste(italic("K"), "=3"))) + theme(axis.title.y = element_text(size = 18))+
  facet_wrap(~group, scales = "free_x", ncol = 3) +  # ???ݷ?????????ʾ
  theme(strip.text.x = element_text(size = 18, face = "bold")) # ???÷?????ǩ????????С?ʹ?ϸ
print(k3)

##Display the ADMIXTURE result at K = 4.
library(ggplot2)
library(reshape2)
data_k3 <- read.table("5kb.ref.4.Q",header = FALSE, sep = " ")
colnames(data_k3) <- c("group", "id", "QG","XJ", "XZ", "NA")
data_k3$id <- as.character(data_k3$id)
data_k3$id <- paste0(1:nrow(data_k3))
data_k3$id <- as.numeric(data_k3$id)
data_k3$group <- factor(data_k3$group, levels = c("XJ", "QG", "XZ"))
data_k3_long <- melt(data_k3, id.vars = c("group", "id"))
k4 <- ggplot(data_k3_long, aes(x = id, y = value, fill = variable)) +
  geom_bar(stat = "identity", width = 1) +
  scale_x_continuous(expand = c(0, 0), breaks = NULL) +
  scale_y_continuous(expand = c(0, 0), breaks = NULL) +
  scale_fill_manual(values = c("#6A5ACD","#CD5C5C", "#20B2AA" ,"#FFA500"), guide = "none") +
  ylab(expression(paste(italic("K"), "=4"))) + theme(axis.title.y = element_text(size = 18))+
  facet_wrap(~group, scales = "free_x", ncol = 3) +  # ???ݷ?????????ʾ
  theme(strip.text.x = element_text(size = 18, face = "bold")) # ???÷?????ǩ????????С?ʹ?ϸ
print(k4)

##Display the ADMIXTURE result at K = 5.
library(ggplot2)
library(reshape2)
data_k3 <- read.table("5kb.ref.5.Q", header = FALSE, sep = " ")
colnames(data_k3) <- c("group", "id", "NA", "XZ", "QG" ,"NB","XJ")
data_k3$id <- as.character(data_k3$id)
data_k3$id <- paste0(1:nrow(data_k3))
data_k3$id <- as.numeric(data_k3$id)
data_k3$group <- factor(data_k3$group, levels = c("XJ", "QG", "XZ"))
data_k3_long <- melt(data_k3, id.vars = c("group", "id"))
k5 <- ggplot(data_k3_long, aes(x = id, y = value, fill = variable)) +
  geom_bar(stat = "identity", width = 1) +
  scale_x_continuous(expand = c(0, 0), breaks = NULL) +
  scale_y_continuous(expand = c(0, 0), breaks = NULL) +
  scale_fill_manual(values = c("#FFA500", "#20B2AA", "#6A5ACD" ,"#FF66FF","#CD5C5C"), guide = "none") +
  ylab(expression(paste(italic("K"), "=5"))) + theme(axis.title.y = element_text(size = 18))+
  facet_wrap(~group, scales = "free_x", ncol = 3) +  # ???ݷ?????????ʾ
  theme(strip.text.x = element_text(size = 18, face = "bold")) # ???÷?????ǩ????????С?ʹ?ϸ
print(k5)



