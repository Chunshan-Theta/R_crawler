##載入檔案
install.packages("rJava")
install.packages("Rwordseg", repos="http://R-Forge.R-project.org")
install.packages("tm")
install.packages("tmcn", repos="http://R-Forge.R-project.org", type="source")
install.packages("wordcloud")
install.packages("XML")
install.packages("RCurl")
##一些TEXT MINING必用的套件


###抓取資料
library(XML)
library(RCurl)

data <- list()

for( i in 1:5){
  tmp <- paste(i, '.html', sep='')
  url <- paste('https://www.ptt.cc/bbs/StupidClown/index', tmp, sep='')
  html <- htmlParse(getURL(url))
  html
  #url.list <- xpathSApply(html, "//div[@class='title']/a", xmlValue)
  
  url.list <- xpathSApply(html, "//div[@class='title']/a[@href]", xmlAttrs)
  data <- rbind(data, paste('www.ptt.cc', url.list, sep=''))
}
data <- unlist(data)
data