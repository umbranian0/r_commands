#### testar o valor medio
#opção 1
### DEFINIR H0: Medio = 73
### DEFINIR H1: Medio != 73
#opção 2
### DEFINIR H0: Medio >= 73   # definido a partir da media devolvida no R
### DEFINIR H1: Medio < 73	   # o maior ou igual é definido com base na media 

bpm <- readXL("C:/Users/vasil/Documents/Mestrado/analise dados/bpm.xlsx", 
  rownames=FALSE, header=TRUE, na="", sheet="Folha1", stringsAsFactors=TRUE)

library(abind, pos=17)
library(e1071, pos=18)
numSummary(bpm[,"bpm", drop=FALSE], statistics=c("mean", "sd", "IQR", 
  "quantiles"), quantiles=c(0,.25,.5,.75,1))


with(bpm, (t.test(bpm, alternative = "two.sided", mu = 0.0, conf.level = 
  .95)))


with(bpm, (t.test(bpm, alternative = "less", mu = 73, conf.level = .95)))

