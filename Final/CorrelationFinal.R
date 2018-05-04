#reading the file
MyData <- read.delim(file="model1.tsv", header=TRUE, sep="\t", colClasses=c("post_uniqueId"="character"))
is.data.frame(MyData)
ncol(MyData)
nrow(MyData)
library("matrixStats", lib.loc="~/R/win-library/3.4")
DMatrix<-data.matrix(MyData)
#calculating correlation
cor_mat = cor(DMatrix)
cor_mat2=round(cor_mat, 2)
#applying a threshold
data<-which((cor_mat2 < -0.7 | cor_mat2 > 0.7) & upper.tri(cor_mat2), arr.ind = T, useNames = T)
#finding unique row names
dataname<-unique(rownames(data))
#Deleting the names in dataname
MData<-MyData[,-which(names(MyData) %in% dataname)]
#writing to a file
write.table(FinalMData,file="Model_DataV3_0.7.tsv",sep='\t',row.names=FALSE)