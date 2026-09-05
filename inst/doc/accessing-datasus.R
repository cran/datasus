## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE, comment = "#>")
library(datasus)

## ----catalog, eval=FALSE------------------------------------------------------
# datasus_catalogo()
# datasus_catalogo("mortalidade")
# datasus_catalogo("cnes")
# datasus_catalogo("sinan")

## ----options, eval=FALSE------------------------------------------------------
# options <- datasus_opcoes(
#   sistema = "sim",
#   conjunto = "obitos",
#   abrangencia = "uf"
# )
# 
# options$linha
# options$coluna
# options$conteudo
# names(options$filtros)

## ----vital-statistics, eval=FALSE---------------------------------------------
# deaths <- sim(
#   conjunto = "obitos",
#   abrangencia = "uf",
#   periodo = 2024,
#   coluna = "Ano do óbito"
# )
# 
# male_deaths <- sim(
#   conjunto = "obitos",
#   uf = "MS",
#   periodo = 2024,
#   filtros = list(sexo = "Masculino")
# )
# 
# births <- sinasc(
#   uf = "MS",
#   periodo = 2024,
#   coluna = "Ano do nascimento"
# )

## ----health-services, eval=FALSE----------------------------------------------
# admissions <- sih_producao(
#   uf = "MS",
#   conteudo = "Internações",
#   periodo = 2025,
#   filtros = list(carater_atendimento = "Urgência")
# )
# 
# procedures <- sia_producao(
#   uf = "MS",
#   conteudo = "Qtd.aprovada",
#   periodo = 2025
# )
# 
# beds <- cnes(
#   conjunto = "leitos_internacao",
#   uf = "MS",
#   periodo = "last"
# )
# 
# population <- populacao_residente(
#   uf = "MS",
#   periodo = 2021
# )

## ----morbidity, eval=FALSE----------------------------------------------------
# morbidity <- sih_morbidade(
#   uf = "MS",
#   linha = "Capítulo CID-10",
#   conteudo = "Internações",
#   periodo = 2025
# )

## ----other-tabnet, eval=FALSE-------------------------------------------------
# dengue <- sinan("dengue", uf = "MS", periodo = 2025)
# 
# coverage <- pni_imunizacoes(
#   conjunto = "cobertura",
#   uf = "MS"
# )
# 
# mammograms <- siscan(
#   conjunto = "mamografia_residencia",
#   uf = "MS",
#   periodo = 2025
# )
# 
# nutrition <- sisvan(uf = "MS")
# financing <- financiamento_sus(uf = "MS")

## ----tabnet-provenance, eval=FALSE--------------------------------------------
# source <- datasus_proveniencia(deaths)
# str(source)

## ----reproducibility, eval=FALSE----------------------------------------------
# analysis_metadata <- list(
#   package_version = as.character(packageVersion("datasus")),
#   query = list(
#     sistema = "sim",
#     conjunto = "obitos",
#     abrangencia = "uf",
#     periodo = 2024
#   ),
#   provenance = datasus_proveniencia(deaths)
# )

