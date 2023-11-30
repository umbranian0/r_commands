

torre <- 
  readXL("C:/Users/vasil/Documents/Mestrado/analise dados/torre.xlsx", 
         rownames=FALSE, header=TRUE, na="", sheet="Folha1", stringsAsFactors=TRUE)
View(torre)
normalityTest(~d, test="shapiro.test", data=torre)


library(BSDA)
#aparece a mensagem orange
SIGN.test(torre$tentativa1, torre$tentativa2, md=0, alternative="two.sided", conf.level=0.95)

library(abind, pos=20)
library(e1071, pos=21)
torre$d <- with(torre, tentativa1- tentativa2)

numSummary(torre[,"d", drop=FALSE], statistics=c("mean", "sd", "IQR", 
                                                 "quantiles"), quantiles=c(0,.25,.5,.75,1))

#concluimos que com base no teste de sinais há uma diferença estatistica
#sendo que a media amostral deu melhorias na amostra estudada
#estes testes apenas dão para fazer para 2 objetos