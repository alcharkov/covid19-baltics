# Title     : TODO
# Objective : TODO
# Created by: asc
# Created on: 2020-03-24

remotes::install_github("GuangchuangYu/nCov2019")
require(nCov2019)
require(dplyr)

require(ggplot2)
require(ggrepel)

x <- get_nCov2019(lang = 'en')
y <- load_nCov2019()

d <- y['global']

d <- d[d$country == 'Lithuania' | d$country == 'Latvia' | d$country == 'Estonia',]
    
n <- d %>% filter(time == time(y))
p <- ggplot(filter(d, country %in% n$country, d$time > '2020-02-27'), aes(time, cum_confirm, color=country)) + geom_line() + theme_minimal(base_size=10)

p + labs(title = "Covid-19 in Baltics", y="confirmed cases")

ggsave("static/plot.png")
