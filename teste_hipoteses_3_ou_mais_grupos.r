motivacao <- 
  readXL("C:/Users/vasil/Documents/Mestrado/analise dados/motivacao.xls", 
         rownames=FALSE, header=TRUE, na="", sheet="Folha1", stringsAsFactors=TRUE)

numSummary(motivacao[,"nota", drop=FALSE], groups=motivacao$motivacao, 
           statistics=c("mean", "sd", "IQR", "quantiles"), quantiles=c(0,.25,.5,.75,1))

Boxplot(nota ~ motivacao, data=motivacao, id=list(method="y"))

#teste normalidade
normalityTest(nota ~ motivacao, test="shapiro.test", data=motivacao)
Tapply(nota ~ motivacao, var, na.action=na.omit, data=motivacao) 
# variances by group
leveneTest(nota ~ motivacao, data=motivacao, center="median")

#ha igualdade, logo podemos aplicar o teste ANOVA

AnovaModel.2 <- aov(nota ~ motivacao, data = motivacao)
summary(AnovaModel.2)
with(motivacao, numSummary(nota, groups = motivacao, statistics=c('mean', 
                                                                  'sd')))
local({
  .Pairs <- glht(AnovaModel.2, linfct = mcp(motivacao = "Tukey"))
  print(summary(.Pairs)) # pairwise tests
  print(confint(.Pairs, level=0.95)) # confidence intervals
  print(cld(.Pairs, level=0.05)) # compact letter display
  old.oma <- par(oma=c(0, 5, 0, 0))
  plot(confint(.Pairs))
  par(old.oma)
})

#concluimos que ha um par que é diferente, logo rejeitamos a hipotese

# A motivação explica 75% da vabilidade das notas
#sendo altamente impactante

(113.6)/(113.6+138.9)*100
