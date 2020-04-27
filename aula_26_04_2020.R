data("iris")
iris
dplyr::select(iris, dplyr::contains("Sepal") )

library(tidyverse) # "ligar" o pacotao tidyverse
iris <- as_tibble(iris)
select(iris, contains("Sepal"))

## Exercicio 2
st_clean <- filter(starwars, !is.na(height))
st_clean %>% filter(!is.na(mass))

st_clean <-starwars %>% 
  filter(!is.na(height), 
         !is.na(mass), 
         !is.na(hair_color),
         !is.na(skin_color), 
         !is.na(eye_color), 
         !is.na(birth_year))
# + 3 filter()
# Filtre personagens starwars que apresentem eye_color  brown
starwars %>% 
  filter(eye_color == "brown")

# Filtre personagens starwars que apresente eye_color brown ou blue
starwars %>% 
  filter(eye_color == "brown"|eye_color == "blue" ) 
starwars %>% 
  filter(eye_color %in% c("brown", "blue")) # funciona igual

# Filtre personagens com skin_color white e species Human
starwars %>% 
  filter(skin_color =="white" & species=="Human" )
starwars %>% 
  filter(skin_color =="white", species=="Human" ) # funciona igual

# + 1 select()
# Selecione as colunas entre mpg e drat de mtcars
data("mtcars")
mtcars %>% select(mpg:drat)

# + 4 mutate()
carros <- as_tibble(mtcars)
# Crie uma coluna onde mpg (milhas por galao) fique no formato kml (kilometros por litro)
# 1 milha = 1.6 km
# 1 galao = 3.78 l
carros %>% 
  mutate(kml = (mpg/3.78)*1.6)

# Crie uma coluna "automatico" com valores logicos (T/F) a partir da coluna "am"
# A coluna "am" tem os valores 0 para manual e 1 para carro automático
# Dica: use a funcao as.logical()
as.logical(carros$am)
carros <- carros %>%
  mutate(automatico = as.logical(am))
carros
# Crie uma coluna "cavalo_vapor" onde o valor dele seja de 10x o valor de "hp"
carros <- carros %>% mutate(cavalo_vapor = hp*10)
carros %>% select(cavalo_vapor)
# Usando ifelse(), modifique a coluna "automatico", onde TRUE = "autom" e FALSE="manual"
ifelse(carros$automatico == TRUE, "autom", "manual")
carros <- carros %>% 
  mutate(automatico = ifelse(automatico == TRUE, "autom", "manual"))
carros

## Ggplot
graf_pontos<-ggplot(iris, 
                    aes(x = Sepal.Length, 
                        y = Sepal.Width))+
  geom_point()
graf_pontos+geom_smooth()
graf_pontos+geom_smooth(method="lm")
graf_pontos+geom_smooth(method="lm", se=FALSE)

ggplot(iris,
       aes(x = Sepal.Length, 
           y = Sepal.Width,
           size = Petal.Length))+
  geom_point()

ggplot(iris, aes(x=Sepal.Length))+
  geom_histogram()
ggplot(iris, aes(x=Sepal.Length))+
  geom_density()+
  facet_wrap(~Species)
ggplot(iris, aes(x=Sepal.Length))+
  geom_density()

# Dica:
esquisse::esquisser(iris)

## Exercicios:
# 1. Construa um grafico de pontos (geom_point), onde x = mpg, y = hp, color = am (carros)
ggplot(carros, 
       aes(x = mpg, y = hp,color = am))+
  geom_point()
# 2. Construa um grafico de pontos (geom_point), onde x = mpg, y = hp, color = automatico (carros)
ggplot(carros, 
       aes(x = mpg,  y = hp, color = automatico))+
  geom_point()
# 3. 