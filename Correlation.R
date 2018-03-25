#Displaying Correlation for the entire dataset
MyData <- read.delim(file="reducedusersrows.tsv", header=TRUE, sep="\t",fill=TRUE)
is.data.frame(MyData)
ncol(MyData)
nrow(MyData)
library("matrixStats", lib.loc="~/R/win-library/3.4")
DMatrix<-data.matrix(MyData)
cor_mat = cor(DMatrix)
data<-which(cor_mat < 0.16 & lower.tri(cor_mat), arr.ind = T, useNames = T)
dataname<-rownames(data)
DMat<-as.data.frame(DMatrix)
DMat %>% select(-one_of(dataname))

