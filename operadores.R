1+2
x<-c(4,5,6)
x
x+10
sum(x)
y<-c(7,8,9)
x+y
boxplot(x)
mean(x)
b<- c(x,y)

i<-b*x+y*0.5
mean(b)
boxplot(i)


##########################################################
##    		operadores aritméticos	                ##
##########################################################
5+6
5-6
5*6
5/6
5**2
5^2
c(1,2)%*%c(3,4)# Produto interno
6%%2 #resto da divisão de 6 por 2
27%/%3 #quociente da divisão de 27 por 3



##########################################################
##    		operadores lógicos	                ##
##########################################################
5<7
7<=5
4>3
7>=5
5==(1+4)
5!=6
!TRUE
(5>3)|(4>7)
(5>3)&(4>7)

##########################################################
##    		funções numéricas	                ##
##########################################################

?abs #or F1 to check help documentation

abs(-3)
sqrt(49)
ceiling(3.1)
floor(4.99)
round(2.833,digits=2)
cos(pi)
sin(pi/2)
log(exp(2))
log(100,base=10)
log2(16)
log10(1000)
exp(3)

##########################################################
##    		funções estatísticas	                ##
##########################################################
mean(x,na.rm=FALSE)
sd(x)
var(x)
median(x)
quantile(x, probs=c(0.25,0.5,0.01 , 0.1))
sum(x)
min(x)
max(x)
range(x)
scale(x, center = TRUE, scale = TRUE)

##########################################################
##    		vamos praticar  1 	                ##
##########################################################
faltas<-c(1,1,2,5,6)
mean(faltas)
median(faltas)
quantile(faltas,probs=c(0.25,0.5,0.75))
faltas2<-c(1,1,2,5,6,NA,NULL,NaN)
mean(faltas2)
mean(faltas2,na.rm = TRUE)
sd(faltas)
sd(faltas2)
sd(faltas2,na.rm=TRUE)
sum(faltas)
min(faltas)
max(faltas)
range(faltas)

##########################################################
##    		vamos praticar  2 	                ##
##########################################################
horas<-c(3,4,5)
scale(horas,center=TRUE)
scale(horas,scale=FALSE)
scale(horas,scale=2)
scale(horas,center=FALSE,scale=TRUE)

mat<-matrix(c(1,4,7,2,5,8,3,6,9),nrow=3, byrow=TRUE)
mat
scale(mat,scale=FALSE) 
scale(mat,center=FALSE,scale=c(1,2,3))
dim(mat)


##########################################################
##    		vamos praticar  3 	                ##
##########################################################
sample(horas,size=1,replace=TRUE)
set.seed(87)

sample(horas,size=5,replace=TRUE)
sample(horas, size = 1, replace = TRUE, prob = c(6/10,
                                                 1/10, 3/10))
seq(from = 10, to = 15, by = 1)
1:6
rep(3:6, times = 2)
rep(3:6, each = 2)
rep(3:6, times = 2, each = 2)
##########################################################
##    			matrizes   	                ##
##########################################################
matriz2 <- matrix(x <- 11:18, nrow = 2, ncol = 4, byrow= TRUE)
matriz3 <- matrix(x <- 11:18, nrow = 2, ncol = 4, byrow= FALSE)
t(matriz3)
L1<-11:14
L2<-15:18
matriz4<-cbind(L1,L2)
matriz5<-rbind(L1,L2)
matriz4
matriz5
matriz5[1,]#todos os elementos da linha 1
matriz5[,3]#todos os elementos da coluna 3
matriz5[1,3]#elemento localizado na linha 1 e coluna 3.

##########################################################
##	Vetorização & Missing Values			##
##########################################################
T<-1:10
W<-11:20
T+W
T-W
T**2
exp(W)
faltas2<-c(1,1,2,5,6,NA)
faltas2
is.na(faltas2) #ver observações omissas


##########################################################
##	Vetores lógicos 				##
##########################################################
resposta<-c(TRUE,FALSE,FALSE)
typeof(resposta)
set.seed(5434)
set.seed(5434)
R <- rnorm(15)
R
indice<-R>0
indice
R[indice]


##########################################################
##		Fatores	 				##
##########################################################
sexo <- c("M", "F", "M", "M", "F")
sexo
typeof(sexo)
attributes(sexo)
sexo <- factor(sexo, levels = c("F", "M"))
sexo
typeof(sexo)
class(sexo)
attributes(sexo)
unclass(sexo)#permite identificar a codificação atribuída a cada nível do fator
sexo <- relevel(sexo, ref = "M")
levels(sexo)


##########################################################
##		Listas	 				##
##########################################################
lista <- list(4:7, "a", c(TRUE, TRUE, FALSE), c(1.3,6.2))
lista
typeof(lista)
lista[1]
lista[2]
lista[3]
lista[4]
lista <- list(inteiros=4:7, texto="a", logica=c(TRUE,TRUE, FALSE), double=c(1.3, 6.2))
lista


##########################################################
##		bases de dados 				##
##########################################################

bd <- data.frame(sexo=factor(c("M","F","M","F","F","M","M")), idade = c(20,30, 40, 50, 60,70,99))
bd
attributes(bd)
dim(bd)
bd$sexo
bd$idade
head(bd)
tail(bd)
bd[1,1]
bd[bd$sexo=="M",]

bd[1,]
bd[c(1,5,7),]

bd[,2]
bd[,c(1,2)]

bd[bd$sexo=="M",]

### defining a list CEO
CEO <- c(11,12,13,14,15,16,17,18,19,20,50,40,34,56,12)

stem(CEO)
ls()
rm(list=ls())


## analise resposta e tratamento 
View(resposta_tratamento)
euronext <- 
  readXL("C:/Users/vasil/Documents/Mestrado/analise dados/euronext.xlsx", 
         rownames=FALSE, header=TRUE, na="", sheet="dados", stringsAsFactors=TRUE)

names(euronext)


colinestrease <- 
  readXL("C:/Users/vasil/Documents/Mestrado/analise dados/colineasterase.xls",
         rownames=FALSE, header=TRUE, na="", sheet="Folha1", stringsAsFactors=TRUE)

#saber a natureza da distribuição
normalityTest(~cserica, test="shapiro.test", data=colinestrease)

normalityTest(~idade, test="shapiro.test", data=colinestrease)


#quando um teste é maior que o valor de erro vai de x a 10% , mas é definido á priori 
#quando o valor p-value é maior que o valor do erro, ele é normal, nao negado 

#### testar o valor medio, com teste de HIPOTESE

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

#output
#t = -7.4987, df = 19, p-value = 0.0000004322

with(bpm, (t.test(bpm, alternative = "less", mu = 73, conf.level = .95)))





