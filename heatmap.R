library(shiny)
library(shinyHeatmaply)
library(tidyr)
library(tidyverse)
library(heatmaply)
library(seriation)
library(ggplot2)
library(RColorBrewer)
library(readr)
library(gplots)

setwd("YOURPATH")
test <- read.csv("filename.csv", header = TRUE, row.names=NULL)

wh1 <- as.matrix(test)


data <- as.data.frame (wh1)
data

rnames <- data[,1]
rnames
   
mat_data <- data.matrix(data[,2:ncol(data)])
mat_data

rownames(mat_data) <- rnames

mat_data
#view(mat_data)
mypalette <- brewer.pal(8,"RdGy")
morecols <- colorRampPalette(mypalette)

png(file="name.png", width = 465, height = 225, units='mm', res = 600)
par(oma=c(1,1,1,5))
heatmap.2(mat_data,col=rev(morecols(93)),trace="none", 
          main="figname",scale="row",
          density.info="none",
          cexRow = 0.6,
         
          hclustfun=hclust)
dev.off()
