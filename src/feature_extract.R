library("multicore")
options(scipen=200)
data.file.names <- c("141021")
data.dir <- "../data"
test.file.path = "../data/141021"
res.path = "../data/"

message("loading data")
d <- read.csv(file=test.file.path,
              header=T,
              sep=",",
              stringsAsFactors=F)

message("loading data finished")
cols.list <- colnames(d)


get.dummy.varies.dict <- function(col) {

  message(paste("begin to extract dummy dict :", col))

  dict <- read.csv(file=paste0(res.path, col, ".uni"),
                   stringsAsFactors=F,
                   sep=",",
                   header=T)

  dict$Var1 <- as.factor(dict$Var1)
  contrasts(dict$Var1) <- contr.treatment(length(dict$Var1))
  m.dict <- attributes(dict$Var1)$contrasts

  message(paste("writting dummy dict :", col))
  write.csv(m.dict,
            file=paste0("res.path", col, ".dum"),
            row.names=T,
            col.names=F,
            sep="\t",
            quote=F)
}

dict.list <- lapply(cols.list, get.dummy.varies.dict)
