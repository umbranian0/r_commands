vacina <- 
  readXL("C:/Users/vasil/Documents/Mestrado/analise dados/vacina.xlsx", 
         rownames=FALSE, header=TRUE, na="", sheet="Folha1", stringsAsFactors=TRUE)

with(vacina, (t.test(eficacia, alternative = "two.sided", mu = 0.0, 
                     conf.level = .95)))

bpm <- readXL("C:/Users/vasil/Documents/Mestrado/analise dados/bpm.xlsx", 
              rownames=FALSE, header=TRUE, na="", sheet="Folha1", stringsAsFactors=TRUE)

library(abind, pos=17)
library(e1071, pos=18)
numSummary(bpm[,"bpm", drop=FALSE], statistics=c("var", "quantiles"), 
           quantiles=c(0,.25,.5,.75,1))

install.packages("EnvStats")
library("EnvStats")

varTest(bpm$bpm , alternative = "two.sided", conf.level=0.95, sigma.squared=4)

#importar tabela de depressao por grupos
depressao <- 
  readXL("C:/Users/vasil/Documents/Mestrado/analise dados/depressao.xls", 
         rownames=FALSE, header=TRUE, na="", sheet="Folha1", stringsAsFactors=TRUE)
head(depressao)
tail(depressao)
#teste  as  do summary numerico por grupo
numSummary(depressao[,"scores", drop=FALSE], groups=depressao$grupo, 
           statistics=c("mean", "sd", "IQR", "quantiles"), quantiles=c(0,.25,.5,.75,1))

Boxplot(scores ~ grupo, data=depressao, id=list(method="y"))


################################################################
#
cc <- 
  readXL("C:/Users/vasil/Documents/Mestrado/analise dados/chronceliacos.xls", 
         rownames=FALSE, header=TRUE, na="", sheet="Folha1", stringsAsFactors=TRUE)

numSummary(cc[,"espessura", drop=FALSE], groups=cc$doenca, 
           statistics=c("mean", "sd", "IQR", "quantiles"), quantiles=c(0,.25,.5,.75,1))

#se o valor da mediana for proximo do valor da media, é porque temos valores muito pero
#neste caso os valores não são proximos
Boxplot(espessura ~ doenca, data=cc, id=list(method="y"))

#como podemos ver na caixa de bigodes, temos discrepancias muito grandes
#vamos fazer o teste de normalidade por grupo
normalityTest(espessura ~ doenca, test="shapiro.test", data=cc)

#rejeitamos assim a espressura do cron
#não precisamos fazer a igualdade de variancia!
#TESTE NAO PARAMETRICO
#Teste TWO-SAMPLE TEST man-whytley / Wilcoxman , porque a normalidade foi violada no 2º grupo
Tapply(espessura ~ doenca, median, na.action=na.omit, data=cc) 
# medians by group
wilcox.test(espessura ~ doenca, alternative="two.sided", data=cc)
#Dado que este valor P é muito pequeno
#dado que existe diferenças estatisticamente comprovadas
#





