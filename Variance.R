#Displaying Variance for the entire dataset
MyData <- read.delim(file="reducedusersrows.tsv", header=TRUE, sep="\t",fill=TRUE)
is.data.frame(MyData)
ncol(MyData)
nrow(MyData)
library("matrixStats", lib.loc="~/R/win-library/3.4")
DMatrix<-data.matrix(MyData)
Variance<-colVars(DMatrix, suma = NULL, std = FALSE, rm=TRUE)
