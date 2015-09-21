data.dir <- "../data"
options(scipen=200)
data.file.names <- c("141021")

test.file.path = "../data/141021"
res.path = "../data/"

message("loading data")
d <- read.csv(file=test.file.path,
              header=T,
              sep=",",
              stringsAsFactors=F)
message("loading data finished")

cols.list <- colnames(d)


for(col in cols.list) {

  message(paste("calculating unique table of ", col))
  uni.col <- as.data.frame(table(d[col]))

  message("writing unique table")
  write.csv(uni.col,
            file=paste0(res.path, col,".uni"),
            row.names=F,
            col.names=F,
            quote=F,
            sep="\t")
  message("writing table finished")
}
