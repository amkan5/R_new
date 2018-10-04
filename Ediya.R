if("RGA" %in% installed.packages("RGA") == FALSE)install.packages("RGA")
library(RGA)
if("ggmap" %in% installed.packages("ggmap") == FALSE)install.packages("ggmap")
library(ggmap)
if("googleVis" %in% installed.packages("googleVis") == FALSE)install.packages("googleVis")
library(googleVis)
library(ggplot2)
# 매장정보 웹크롤링한다
# https://ediya.com/contents/find_store.html#c

shop <- c("1.역삼더블루점","2.역삼상록점","3.역삼역점")
addr <- c("서울특별시 강남구 삼성2동 테헤란로63길 16 ",
          "서울특별시 강남구 역삼1동 테헤란로43길 18 ",
          "서울특별시 강남구 역삼1동 테헤란로25길 17 ")

g <- geocode(enc2utf8(addr), output = "latlona", source = "dsk")
g

t <- data.frame(name=shop, lon=g$lon,lat=g$lat)
t

gc <- geocode("seoul, korea", source="google")
gc
centre <- as.numeric(gc)
centre
c <- c(mean(t$lon),mean(t$lat))
c 

map <- get_googlemap(
  center=c(lon=mean(t$lon),mean(t$lat))
)


get_googlemap(
  center=c(lon=mean(dat$Lon),
           lat=mean(dat$Lat)),
  zoom=8,maptype='terrain',
  color='bw')

map <- get_googlemap(
  center = c,
  maptype = "roadmap",
  zoom = 15,
  language = "ko-KR"
)

ggmap(map, extent = 'device') 


