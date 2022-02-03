CondInd = 
  function (filename = "/home/zgong001/Documents/Alarm/D50C9v/D50C9vT.txt", alphalevel = 0.05, methodu="x2", exfilename = "/home/zgong001/Documents/Alarm/D50C9v/D50C9vCI0P.xlsx"){
    library(bnlearn)
    result = data.frame()
    sprinkler <- read.table(filename, header = TRUE)
    columname = colnames(sprinkler)
    m=length(columname)
    x=seq(0,m-1,by=1)
    colnames(sprinkler)=x
    columname = colnames(sprinkler)
    TwoVComb = combn(columname,2)
    for(jt in 1:ncol(TwoVComb)){
      twoV = c(TwoVComb[1,jt], TwoVComb[2,jt])
 #     columnameT = columname[! columname %in% twoV]
 #     colComb = combn(columnameT,2)
 #     for (j in 1:ncol(colComb)){
      citest = ci.test(TwoVComb[1,jt], TwoVComb[2,jt], test = methodu, data = sprinkler)
      lable = paste(TwoVComb[1,jt], TwoVComb[2,jt], sep=", ")
      pvalue = citest$p.value
      CIlist= data.frame("Index" = lable, "pvalue" = pvalue)
      result = rbind(result, CIlist)
#      }
    }
    result2 = result[order(-result[,2]), ]
    write.xlsx(result2, exfilename, sheetName = "Sheet1", col.names = TRUE, row.names = TRUE, append = FALSE)
    return(result2)
  }