2+2  # ctrl + enter: roda a linha do script no console
# ctrl + l: limpa o console (mas nao apaga a historia)
### Criar um objeto numerico

a = 1 # para atribuir, voce pode usar o `=` ou `<-`
b <- 1 # flecha nao pode ter espaco entre `<` e `-`
c<-1 # espaco (ou nao) entre `<-` e atribuicao nao interfere
d=1 # espaco (ou nao) entre `=` e atribuicao nao interfere
e= 1
object.size(a) # tamanho do objeto `a`
object.size(b)

a == b # `a` eh igual a `b`
a != b # `a` eh diferente a `b`
a + b # objetos sao "apelidos" para valores ou ou outra coisa

# ctrl + s: salva o script

a = 2
a + b # valor do objeto mudou

### Criar um objeto numero inteiro
b <- 1L # usa-se `L` para definir um numero inteiro
class(b)
object.size(b)

### Criar um objeto logico
x <- TRUE # importante: todas as letras maisculas
y <- FALSE
class(x)
class(y)
object.size(x)
x == y
x != y

### criar um objeto caracter
b <- "larissa" # aspas duplas 
c <- 'cindy'   # ou aspas simples
d <- 'pedro paulo' # aceita espacos dentro do caracter
b <- larissa       # erro, pois objeto `larissa` nao existe
class(b)
class(c)
class(d)
object.size(b)
object.size(c)
object.size(d)
e <- "e"
object.size(e)

### Criar um objeto fator
b <- as.factor("larissa")
class(b)
object.size(b)
#### Parte 2 - pratica ####
## setwd() # Work Directory
getwd() # diretorio de trabalho atual
wd <- choose.dir()  # selecione o diretorio a ser trabalhado
setwd(wd) # estabelecer o diretorio `wd` selecionado
getwd() # verificar se diretorio eh aquele escolhido

##  c()
alunos <- c("cindy", "larissa", "luana", "pedro")
alunos
idades <- c(18, 19, 20, 21)
mulher <- c(TRUE, TRUE, TRUE, FALSE)
mulheres <- c(T, T, T, F)
mulher
mulheres
cbind(alunos, idades) # unir coluna (column bind)
rbind(alunos, idades) # unir linha (row bind)
# Essas funcoes 'bind' "simplifica" os valores das variaveis
#"simplifica": transforma um tipo de variavel em outra mais simples
data.frame(alunos, idades)
data.frame(alunos, idades, mulher, mulheres)
dados <- data.frame(alunos, idades, mulher)

## class(); str(); typeof()
class(alunos)
class(idades)
class(mulher)
class(dados) # um conjunto de vetores paralelos
gradua <- c("biologia", "biomedicina")
data.frame(alunos, idades, mulher, gradua)
facul <- c("facis", "usjt", "unip")
data.frame(alunos, idades, mulher, gradua, facul) # ERRO
lista<-list(alunos, idades, mulher, gradua, facul) # TUDO BEM!
str(alunos) # estrutura do seu objeto
str(dados)
str(lista)
alturas <- c(1.65, 1.71, 1.69, 1.73)
dados<-data.frame(alunos, idades, mulher, alturas)

## read.csv()
write.csv(dados, "dados.csv")   # formato "americano"
write.csv2(dados, "dados2.csv") # formato "brasileiro"
read.csv("dados.csv")
dados_lidos <- read.csv2("dados2.csv")
dados_lidos



### Aula 02
## dim(); head()
## []
## $
# conditionals (<, >, !=, ==)
# subsetting w/ conditionals
## ? ??, args, help()
## plot()
## function()
## function() # default
## if else
## seq()
## for
## apply()
## install.packages()
## library(); require()
## library(tidyverse)
respondentes <- c(rep("bibiana", 5),
                rep("talita", 5),
                rep("tatiana", 5),
                rep("luciana", 5))
titulo_da_obra <- c('breaking bad', 'atypical', 'how to get away with murder', 'la casa de papel', 'lock and key',
                    "Stranger Things","La Casa de Papel","The Rain","Breaking Bad","Vikings",
                    "Patch Adams", "O codigo Da Vinci", "Jurassic Park: O Parque dos dinossauros", "O sexto sentido", "Inferno",
                    "descubra seus pontos fortes","seis fundamentos do sucesso profissional","mãos talentosas","corrente do bem","conversando com Deus")
ano_de_estreia <- c('2008', '2011', '2014', '2017', '2020',
                    "2016","2017","2018","2008","2013",
                    1998, 2003, 1993, 1999, 2013,
                    2008,2005,2009,2001,2006,
                    TRUE,TRUE,FALSE,FALSE,FALSE,)
nacionalidade <- c(FALSE, FALSE, FALSE, FALSE, FALSE,
                   "False","False","False","False","False",
                   FALSE, FALSE, FALSE, FALSE, FALSE)
dados_compilados<-data.frame(respondentes, titulo_da_obra, ano_de_estreia, nacionalidade)
