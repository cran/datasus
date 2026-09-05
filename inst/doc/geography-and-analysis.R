## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE, comment = "#>")
library(datasus)

## ----territories--------------------------------------------------------------
datasus_territorios("regiao")
head(datasus_territorios("uf"))
head(datasus_territorios("municipio", uf = "MS"))

## ----normalize-codes----------------------------------------------------------
normalizar_codigo_ibge(
  c("500270", "500370"),
  nivel = "municipio",
  formato = "ibge"
)

## ----validate-codes-----------------------------------------------------------
validar_codigo_ibge(c("5002704", "5003702", "9999999"))

## ----add-geography------------------------------------------------------------
events <- data.frame(
  codigo = c("500270", "500370"),
  ano = c(2025L, 2025L),
  casos = c(18L, 7L)
)

events <- adicionar_territorio(events, codigo = "codigo")
events

## ----complete-geography, eval=FALSE-------------------------------------------
# panel <- completar_territorios(
#   events,
#   codigo = "codigo",
#   periodo = "ano",
#   uf = "MS",
#   periodos = 2023:2025,
#   preencher = list(casos = 0)
# )

## ----population-join----------------------------------------------------------
cases <- data.frame(
  codigo_municipio = c("5002704", "5003702"),
  ano = c(2025L, 2025L),
  casos = c(18L, 7L)
)
population <- data.frame(
  codigo_municipio = c("5002704", "5003702"),
  ano = c(2025L, 2025L),
  habitantes = c(925000, 95000)
)

analysis <- juntar_populacao(
  cases,
  population,
  por = c(
    codigo_municipio = "codigo_municipio",
    ano = "ano"
  ),
  coluna_populacao = "habitantes",
  nome = "habitantes"
)
analysis

## ----vector-rates-------------------------------------------------------------
calcular_taxa(
  eventos = c(10, 25),
  populacao = c(10000, 20000)
)

intervalo_taxa(
  eventos = 10,
  populacao = 10000,
  confianca = 0.95
)

## ----grouped-rates------------------------------------------------------------
taxa_incidencia(
  analysis,
  casos = "casos",
  populacao = "habitantes",
  grupo = "ano",
  confianca = 0.95
)

outcomes <- data.frame(
  ano = c(2024L, 2024L, 2025L, 2025L),
  casos = c(50, 30, 45, 35),
  obitos = c(2, 1, 1, 2)
)
letalidade(
  outcomes,
  obitos = "obitos",
  casos = "casos",
  grupo = "ano",
  confianca = 0.95
)

## ----epi-calendar-------------------------------------------------------------
semana_epidemiologica(
  as.Date(c("2025-01-01", "2025-12-31", "2026-01-01"))
)

head(calendario_epidemiologico(2026))

media_movel(
  c(2, 5, 3, 8, 7, 6, 9),
  janela = 3,
  parcial = TRUE
)

## ----standard-populations-----------------------------------------------------
head(populacao_padrao("oms"))

## ----age-standardization, eval=FALSE------------------------------------------
# standardized <- padronizar_idade(
#   eventos = deaths_by_age$obitos,
#   populacao = deaths_by_age$habitantes,
#   idade = deaths_by_age$faixa_etaria,
#   populacao_padrao = populacao_padrao("oms"),
#   grupo = deaths_by_age$ano,
#   confianca = 0.95
# )

