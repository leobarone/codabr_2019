library(tidyverse)

url_cadastro <- 'http://dados.prefeitura.sp.gov.br/pt_PT/dataset/8da55b0e-b385-4b54-9296-d0000014ddd5/resource/e0f7d848-1d35-4ce8-b2b3-20e1196c2076/download/escolas122018.csv'
cadastro <- read_csv2(url_cadastro)

glimpse(cadastro)

cadastro %>% 
  group_by(rede) %>% 
  summarise(n = n()) 

cadastro %>% 
  group_by(dre) %>% 
  summarise(n = n()) 

cadastro %>% 
  group_by(diretoria) %>% 
  summarise(n = n()) 

cadastro %>% 
  group_by(dre) %>% 
  summarise(n = n()) 

cadastro %>%
  group_by(rede, dre) %>% 
  summarise(n = n()) %>% 
  pivot_wider(names_from = rede,
              values_from = n)

cadastro %>%
  mutate(rede = recode(rede, 
                       CON = 'Rede Conveniada',
                       DIR = 'Rede Direta',
                       .missing = 'Rede Privada')) %>% 
  group_by(rede, dre) %>% 
  summarise(n = n()) %>% 
  pivot_wider(names_from = rede,
              values_from = n)


cadastro %>%
  mutate(rede = recode(rede, 
                       CON = 'Rede Conveniada',
                       DIR = 'Rede Direta',
                       .missing = 'Rede Privada')) %>% 
  group_by(rede, dre) %>% 
  summarise(n = n()) %>% 
  pivot_wider(names_from = rede,
              values_from = n)
