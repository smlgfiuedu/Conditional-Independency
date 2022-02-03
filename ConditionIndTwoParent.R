CondIndTwoVar = 
  function (filename = "/home/zgong001/Documents/SprinklerDataset/sprinkler1001.txt", alphalevel = 0.05, methodu="x2"){
    library(bnlearn)
    result = list()
    sprinkler <- read.table(filename, header = TRUE)
    columname = colnames(sprinkler)
    TwoVComb = combn(columname,2)
    for(jt in 1:ncol(TwoVComb)){
      twoV = c(TwoVComb[1,jt], TwoVComb[2,jt])
      columnameT = columname[! columname %in% twoV]
      colComb = combn(columnameT,2)
      for (j in 1:ncol(colComb)){
        citest = ci.test(colComb[1,j], colComb[2,j], twoV, test = methodu, data = sprinkler)
        lable = paste(colComb[1,j], colComb[2,j], "|", twoV[1], twoV[2], sep=" ")
        pvalue = citest$p.value
        indp = TRUE
        if(pvalue > alphalevel){
          indp = TRUE
        }else{
          indp = FALSE
        }
        CIlist= list(lable, pvalue, indp)
        result = rbind(result, CIlist)
      }
    }
    return(result)
  }