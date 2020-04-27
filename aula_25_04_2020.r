if(!require(tidyverse)){install.packages("tidyverse")}

head(mtcars, 3)
mtcars %>% head(3) # eh igual

# 1. maneira atribuindo objeto
cabecalho <- head(mtcars, 10)
tail(cabecalho, 3)

# 2. maneira longa - inserindo uma funcao dentro de outra funcao
tail(head(mtcars, 10), 3)

# 3. pipe (cano em ingles ~ lembra de SuperMario?)
mtcars %>% 
  head(10) %>% 
  tail(3)

# dados iris
data(iris)
iris # formato data.frame
class(iris)
str(iris)
iris<-as_tibble(iris)
iris # formato tibble
class(iris)

# DPLYR
data("starwars")
starwars
filter(starwars, name == "Darth Vader")
starwars %>% filter(name == "Darth Vader") # mesma maneira

starwars %>% 
  filter(species == "Human", 
         gender=="male",
         height > 200)
starwars %>% arrange(desc(mass)) %>% tail(4)

starwars[,c("name", "mass")] # "old school"
select(starwars, name, mass) # com select
starwars %>% select(name, mass) # com pipe

iris %>% select(contains("Petal"))
iris %>% select(contains("Length"))

starwars$IMC <- starwars$mass/((starwars$height/100)^2) # old school

dados<-starwars %>% 
  mutate(IMC = mass/((height/100)^2),
         Idade = 200 - birth_year) %>% 
  select(name, IMC, Idade)
dados

starwars %>% filter(!is.na(height)) # excluir aqueles sem height
!TRUE

starwars %>% 
  filter(!is.na(height)) %>% 
  summarise(Media_Altura = mean(height))

starwars %>% 
  summarize(Media_Altura = mean(height, na.rm=TRUE)) # igual

summary(starwars)

starwars %>% 
  summarize(Media_Altura = mean(height, na.rm=TRUE),
            Altura_NA =  sum(is.na(height)),
            Altura_max =  max(height, na.rm=TRUE),
            Altura_min = min(height, na.rm= TRUE),
            Qtos_personagens = n()) 

starwars %>% filter(gender=="male") %>% 
  summarize(Media_Altura = mean(height, na.rm=TRUE),
            Altura_NA =  sum(is.na(height)),
            Altura_max =  max(height, na.rm=TRUE),
            Altura_min = min(height, na.rm= TRUE),
            Qtos_personagens = n()) 

starwars %>% group_by(gender) %>% 
  summarize(Media_Altura = mean(height, na.rm=TRUE),
            Altura_NA =  sum(is.na(height)),
            Altura_max =  max(height, na.rm=TRUE),
            Altura_min = min(height, na.rm= TRUE),
            Qtos_personagens = n())

starwars %>% group_by(homeworld, gender) %>% 
  summarize(Media_Altura = mean(height, na.rm=TRUE),
            Altura_NA =  sum(is.na(height)),
            Altura_max =  max(height, na.rm=TRUE),
            Altura_min = min(height, na.rm= TRUE),
            Qtos_personagens = n()) 

starwars %>% group_by(gender, homeworld) %>% 
  summarize(Media_Altura = mean(height, na.rm=TRUE),
            Altura_NA =  sum(is.na(height)),
            Altura_max =  max(height, na.rm=TRUE),
            Altura_min = min(height, na.rm= TRUE),
            Qtos_personagens = n()) 

starwars %>% 
  filter(gender %in% c("female", "male") ) %>% 
  group_by(gender) %>% 
  summarize(Media_Altura = mean(height, na.rm=TRUE),
            Altura_NA =  sum(is.na(height)),
            Altura_max =  max(height, na.rm=TRUE),
            Altura_min = min(height, na.rm= TRUE),
            Qtos_personagens = n()) 
starwars %>% group_by(homeworld, gender) %>% 
  summarize(Media_Altura = mean(height, na.rm=TRUE),
            Altura_NA =  sum(is.na(height)),
            Altura_max =  max(height, na.rm=TRUE),
            Altura_min = min(height, na.rm= TRUE),
            Qtos_personagens = n()) %>%
  filter(gender %in% c("female", "male") )

## Exercicio 2
# a) Utilize as funcoes is.na() e filter() 


# b) select() muitas vezes
select(starwars, gender, gender, gender)
starwars %>% select(gender, gender, gender)
starwars[,c("gender", "gender","gender")]

# c) iris area das petalas e sepalas
