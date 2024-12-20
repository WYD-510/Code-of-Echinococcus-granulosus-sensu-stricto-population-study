
setwd("./map")

library(raster)
library(ggplot2)
library(maps)
elevation_world <- getData('worldclim', var='alt', res=2.5)
df <- data.frame(rasterToPoints(elevation_world$alt))
china <- ne_states(country = "China", returnclass = "sf")

df_asia <- subset(df, x>55 & x<120 & y>20 & y<50) 


p <- ggplot(df_asia, aes(x=x, y=y)) +
  geom_raster(aes(fill=alt)) +
  scale_fill_gradientn(colours = c("#1E9600","#FFF200", "#FF0000"),
                       values = scales::rescale(c(0, 0.40, 1))) +
  labs(x = "Longitude (??E)", y = "Latitude (??N)")+
  theme(legend.text=element_text(size=18),
        legend.title=element_text(size=14,face="bold"),
        axis.line = element_line(colour = "black"),
        panel.background = element_rect(fill = 'white', colour = 'black'),
        axis.title.x = element_text(size = 14, face = "bold"),
        axis.title.y = element_text(size = 14, face = "bold"),
        axis.text = element_text(size = 12))

p

china_map <- map_data("world", region = "China")
Taiwan_map <- map_data("world", region = "Taiwan")

p + geom_path(data = china_map, aes(x = long, y = lat, group = group),
              color = "black", linetype = "solid", linewidth = 0.3) +
  geom_path(data = Taiwan_map, aes(x = long, y = lat, group = group),
            color = "black", linetype = "solid", linewidth = 0.3)

        
        
        

