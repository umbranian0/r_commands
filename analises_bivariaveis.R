#########################################################################
###           Análise de Dados com R                                #####
###                     Análise Bivariada                           #####
###     Autor: Prof. Ricardo Miguel Vieira de São João (PhD)        #####
###    email:                ricardo.sjoao@esg.ipsantarem.pt        #####
#########################################################################
if(!require(vcd))install.packages("vcd")
library(vcd)
if(!require(rcompanion))install.packages("rcompanion")
library(rcompanion)
if(!require(epitools))install.packages("epitools")
library(epitools)

if(!require(psych))install.packages("psych")
library(psych)
if(!require(DescTools))install.packages("DescTools")
library(DescTools)

or 
install.packages("rcompanion");library(rcompanion);
install.packages("epitools", dependencies = TRUE);library(epitools)
install.packages("vcd");library(vcd)
install.packages("psych");library(psych)
install.packages("DescTools");library(DescTools)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#% Criação da tabela de contingência/matriz  %
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

poetas<-matrix(c(12, 26, 8, 10, 30, 14), nrow=3, byrow=TRUE,dimnames=list("Poeta"= c("Luís de Camões", "Fernando Pessoa", "Sophia Andresen"),
"sexo" = c("Homen", "Mulher")))
poetas
str(poetas)
addmargins(poetas)
colSums(poetas)
rowSums(poetas)

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#% Trabalhando com proporções                %
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#Proporção do sexo do leitor em cada poeta
#código
propspoets1<-prop.table(poetas, margin = 1)
propspoets1

#Na amostra, os leitores preferem a poeta Sofia (68.18%) e Fernando Pessoa (≈44.44%). As leitoras preferem Camões (≈68.42%)

#Proporção de cada poeta em cada sexo
#código
propspoets2<-prop.table(poetas, margin = 2)
propspoets2

#Na amostra, Sofia representa a escolha de  60% dos leitores
#enquanto que Camões representa  52% das leitoras

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#% Gráfico de Barras                         %
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

barplot(poetas, beside = TRUE, legend = TRUE,main="Poetas Portugueses vs Leitores", ylim = c(0, 15),
cex.names = 0.8, cex.axis = 0.8, args.legend = list(x ="topright", cex = 0.8, bty = "n"))


poetas.t<-t(poetas)
barplot(poetas.t,beside = TRUE,legend = TRUE, main="Poetas Portugueses vs Leitores",ylim = c(0, 15),
cex.names = 0.8, cex.axis = 0.8, args.legend = list(x ="topleft", cex = 0.8,bty = "n"))



barplot(propspoets2,beside= TRUE,legend=TRUE,ylim=c(0,
1),cex.names= 0.8,cex.axis= 0.8,col=
c("red","green","blue"),ylab= "Proporção de leitores em cada poeta por sexo",xlab=
"Sexo",args.legend=list(x="topright",cex=0.8,bty="n"))

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#% Gráfico Mosaico                           %
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


mosaicplot(poetas, color=TRUE, cex.axis=0.8)

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%% Teste Qui-Quadrado                                %
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
chisq.test(poetas)
chisq.test(poetas)$expected
chisq.test(poetas,correct=FALSE)
chisq.test(poetas,correct=TRUE)# only for 2x2 tables (Yate's correction)
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#%% Fisher's Exact Test
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beer<-matrix(c(1,6,4,1),nrow=2,byrow=TRUE,dimnames=list("Personality"=c("Introverted","Extroverted"),
"Consumption"=c("non-regular","regular")))
beer
chisq.test(beer)$expected
fisher.test(beer, alternative="less")

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#% association measures
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

assocstats(poetas)
assocstats(beer)
CramerV(poetas,conf.level=0.95)
TschuprowT(poetas)

abortion<-matrix(c(47, 39, 41, 73), nrow=2, byrow=TRUE,dimnames=list("Vote"= c("Gore", "Bush"),"Abortion Attitudes" = c("for", "against")))
Lambda(abortion, direction="row")
Lambda(abortion, direction="column")


#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#% Correlações 
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#Crie a matriz/tabela
x<-matrix(c(1.68,1.75,1.85,1.83,1.73,1.60,1.88,1.78,1.68,1.63,1.52,1.70,1.63,1.60,1.70,1.65))
y<-matrix(c(68.04,70.31,72.58,72.58,68.04,63.50,74.84,68.04,49.90,45.36,43.09, 49.90,47.63,45.36,49.90,47.63))
cor(x,y)# Coeficiente de correlação de Pearson
plot(x,y,main="altura vs peso")# Diagrama de dispersão
lm(y∼x)# Estimação do modelo de Regressão Linear Simples (RLS)
abline(lm(y∼x))# adiciona a linha ao gráfico

math<-matrix(c(80,50,36,58,72,60,56,68))
english<-matrix(c(65,60,35,39,48,44,47,61))
cor.test(math, english, method = "spearman", alternative= "two.sided")# Spearman correlation coefficient

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#% Correlações com o R Commander
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

alturapeso<-cbind(x,y)
alturapeso<-as.data.frame(alturapeso)
names(alturapeso)<-c("altura","peso")
alturapeso


#Tendo uma base de dados no caminho Statistis>Summaries>Correlation test ou 
# Statistis>Summaries>Correlation matrix é possível fazer a análise