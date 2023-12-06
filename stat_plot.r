library(dplyr)
library(tidyverse)
library(ggridges)
library(forcats)
library(writexl)

# input data set

node_info <- read_csv("node_info.csv")

summary_node_info <- read.csv("summary_node_info.csv")

summary_node_info2 <- read.csv("summary_node_info2.csv")

tria_node_info <- filter(node_info, dataset == "Tria")
vosseberg_node_info <- filter(node_info, dataset == "Vosseberg")

clock_data <- read.csv("clock_stat.csv")

# FINAL PLOTS

# ridgeline plot 1

n <- ggplot(node_info, aes(x = median, y = origin_node_type, fill, fill = origin_node_type, show.legend=FALSE)) + 
  geom_density_ridges(scale = 1) +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none") +
  ylab("Node Type & Eukaryote Origin") +
  xlab("Median Age (100Ma)") +  
  scale_y_discrete(expand = c(0, 0)) +
  scale_x_continuous(expand = c(0, 0)) +
  scale_color_manual(name = "Node Type & Origin")

n + xlim(13,35.5)

# scatter plot 1

o <- ggplot(node_info, aes(x=origin_node_type, y = median, colour = dataset)) +
  geom_jitter(position=position_jitter(0)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Median Age (100Ma)") +
  xlab("Node Type & Eukaryote Origin")

o

# scatter plot HPD 1

p <- ggplot(data = node_info, aes(x = median, y = tree_name, colour = dataset))+
  geom_point(size=0.0000000000000000001)+
  geom_pointrange(aes(xmin = HPD_min, xmax = HPD_max),
                  linetype="solid")+
  facet_grid(~origin_node_type, as.table = FALSE, scales = "fixed")+
  theme(plot.title = element_text(hjust = 0),
        axis.text.y = element_text(hjust = 0))+
  ylab("Tree Name")+
  xlab("Node Age (100Ma)")

p

# ridgeline plot 2

q <- ggplot(summary_node_info2, aes(x = dup_minus_mean_leca, y = eukaryote_origin, fill, fill = eukaryote_origin, show.legend=FALSE)) + 
  geom_density_ridges(scale = 1) +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none") +
  ylab("Eukaryote Origin") +
  xlab("Mean LECA Stem Length (100Ma)") + 
  scale_y_discrete(expand = c(0, 0)) +
  scale_x_continuous(expand = c(0, 0)) +
  scale_color_manual(name = "Eukaryote Origin")

q + xlim(-5,15)

# scatter plot 2

r <- ggplot(summary_node_info2, aes(x=eukaryote_origin, y = dup_minus_mean_leca, colour = dataset)) +
  geom_jitter(position=position_jitter(0)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Mean LECA Stem Length (100Ma)") +
  xlab("Eukaryote Origin")

r

# ridgeline plot 3

s <- ggplot(clock_data, aes(x = median, y = clock_model, fill, fill = clock_model, show.legend=FALSE)) + 
  geom_density_ridges(scale = 1) +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none") +
  ylab("Clock Model") +
  xlab("Median Duplication Age (100Ma)") 

s + xlim(10,50)

# scatter plot HPD 3

t <- ggplot(data = clock_data, aes(x = median, y = tree_name, colour = dataset))+
  geom_point(size=0.00000000000000000000000000000001)+
  geom_pointrange(aes(xmin = HPD_min, xmax = HPD_max),
                  linetype="solid")+
  facet_grid(~clock_model, as.table = FALSE, scales = "fixed")+
  theme(plot.title = element_text(hjust = 0),
        axis.text.y = element_text(hjust = 0))+
  ylab("Tree Name")+
  xlab("Median Duplication Age (100Ma)")

t






















