# Exercicio 0.
# Construa um data.frame com os 5 filmes/séries/livros que vocês mais gostam. 
# As colunas desse data.frame devem ser: 
# 1) Titulo da obra, 
# 2) Ano de estreia (publicado/1a temporada), e 
# 3) Se é nacional ou não (coluna com dados lógicos, TRUE/FALSE). 
titulo <- c("Pulp Fiction", "Matrix", "Jurassic Park", "Chapolin", "Xuxa")
ano <- c(1992, 1999, 1994, 1970, 1988)
nacional <- c(FALSE, FALSE, FALSE, FALSE, TRUE)
dados <- data.frame(titulo, ano, nacional)
dados

### Aula 02
## ? ??, args, help()
class(dados)
## Objetos podem ser:
# um unico valor 1 x 1
# um vetor: 1 x n # c(), usando virgula para separar os valores
# data.frame: m x n # m colunas e n linhas, sendo q as colunas devem ter o mesmo n
# list: m x n x z # varias dimensoes. Podemos juntar vetores com diferentes comprimentos, ou diferentes objetos (data.frame com um vetor), etc
## Funcoes, tem como caracteristica ter o () e usa um objeto
# realiza um algoritmo
?class() # abre a ajuda (help)
help(args) # funciona igual
args(class) # argumentos existentes em uma função

## dim(); head()
dim() # retorna as dimensoes do meu objeto (matriz, data.frame)
dim(dados) # retorna dois valores. o 1o eh numero de linhas, 2o eh colunas
dim(nacional) # so tem 1 dimensao (somente comprimento)
length(nacional) # comprimento em ingles
head(dados) # mostra as 5 primeiras linhas
args(head)
?head()
head(dados, n = 2L) # ele me retorna as duas primeiras linhas
head(dados, n = 2) # funciona igual
tail(dados, n = 2) # "rabo" do data.frame

## []
titulo[1] # o 1o filme
titulo[2]
titulo[6] # NA: Not Available
dados[1] # 1a coluna
dados[1,] # 1a linha
dados[,1] # 1a coluna como vetor
dados[3,2] # 3a linha da 2a coluna
dados

dados[c(1,3), 2]
titulo[c(1,3,5)]
# :
1:20 # sequencia de 1 a 20 (intervalo de 1)
15:100 # sequencia de 15 a 100 por um intervalo de 1
sequencia <- 100:1000
sequencia[77] # septagesimo sétimo valor da minha sequencia
?seq()
seq_quebrada <- seq(from = 1, to = 100, by = 0.5) # de 1 a 100 por 0.5
# from, to, by sao argumentos da minha funcao seq()
seq_quebrada

## $, funciona para data.frame
dados[1]
dados[,1]
dados$titulo # separa a coluna `titulo` do meu `data.frame` `dados`

## conditionals (<, >, !=, ==)
ano >= 1992
ano > 1992
ano == 1992
ano != 1992

# subsetting w/ conditionals
ano[c(TRUE, TRUE, FALSE, FALSE, FALSE)] # somente os dois primeiros sao TRUE, logo, vai me retornar somente os dois primeiros
ano[ano >= 1992]
titulo[ano >= 1992] # sabe quais filmes foram lançados a partir de 1992

c("bla","bla","bla","bla","bla")
rep("bla", 5)

## Exercicio 2
# a. data(mtcars)
data("mtcars")
# explore a classe desse objeto mtcars
class(mtcars)
str(mtcars)
head(mtcars)
tail(mtcars)
object.size(mtcars)
?mtcars

# b. veja quais carros tem:
# b.1) hp < 100
mtcars[,4] # 4a coluna
mtcars[c(1,2,3), ] # me retonar as 3 primeiras linhass
mtcars[1:3, ] # antes da virgula sao as linhas, depois da virgula: as colunas
mtcars$hp # separa a coluna `hp`
mtcars$hp < 100
carros_fracos <- mtcars$hp < 100
carros_fracos
sum(carros_fracos) # TRUE = 1, FALSE = 0, somando o vetor ele retorna quantos TRUE existem
mtcars[carros_fracos, ]

# b.2) am = 1 (manual)
mtcars$am = 1 # altera a tabela
carros_manuais <- mtcars$am = 1 # erro

data("mtcars") # volta aos dados como eram
mtcars$am == 1 # logica: TRUE am ==1, FALSE am != 1
carros_manuais <- mtcars$am == 1 # OK!
mtcars[carros_manuais, ]
sum(carros_manuais)

# b.2i) mpg > 20

carros_economicos <- mtcars$mpg > 20 
mtcars[carros_economicos, ]
sum(carros_economicos)

mtcars[mtcars$mpg > 20, ] # 2 linhas em uma unica linha
sum(mtcars$mpg > 20) # 2 linhas em uma unica linha

# b.3) mpg > 20 & am = 0 # carro automatico e economico
TRUE & TRUE
TRUE & FALSE
FALSE & FALSE
FALSE & TRUE

carros_bb <- mtcars$mpg > 20 & mtcars$am == 0 
carros_bb
mtcars[carros_bb,]

# b.3i) economicos (mpg >20) e potentes (hp > 100)
mtcars[mtcars$mpg > 20 & mtcars$hp > 100, ]

# c. Usando $, [] e :
# c.1) Veja entre as linhas 11 e 22 do df

# c.2) veja entre as colunas 2 e 5 do df

# c.3) Extraia os três primeiros valores da coluna qsec

# c.4) Organize a tabela com o mpg maior para o menor, usando a função sort().
# Use ? para ajudar

