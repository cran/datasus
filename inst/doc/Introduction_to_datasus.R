## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# library(devtools)
# install_github("rpradosiqueira/datasus")

## ----eval = FALSE-------------------------------------------------------------
# datasus_catalogo("sim")
# datasus_opcoes("sim", "obitos", abrangencia = "uf")
# 
# obitos_uf <- sim(
#   "obitos",
#   abrangencia = "uf",
#   periodo = 2024
# )
# 
# obitos_municipios <- sim(
#   "obitos",
#   uf = "MS",
#   periodo = 2024,
#   filtros = list(sexo = "Masculino")
# )
# 
# nascimentos <- sinasc(uf = "MS", periodo = 2024)
# datasus_proveniencia(obitos_uf)

## ----eval = FALSE-------------------------------------------------------------
# datasus_catalogo()
# datasus_catalogo("cnes")
# 
# op <- datasus_opcoes("sih", uf = "MS")
# op$conteudo
# op$filtros$carater_atendimento

## ----eval = FALSE-------------------------------------------------------------
# sih_producao(
#   uf = "MS",
#   conteudo = "Internações",
#   periodo = 2025,
#   filtros = list(carater_atendimento = "Urgência")
# )
# 
# sia_producao(uf = "MS", conteudo = "Qtd.aprovada")
# cnes(uf = "MS")
# cnes(conjunto = "leitos_internacao", uf = "MS")

## ----eval = FALSE-------------------------------------------------------------
# populacao_residente(uf = "MS", periodo = 2021)
# 
# sih_morbidade(
#   uf = "MS",
#   linha = "Capítulo CID-10",
#   conteudo = "Internações",
#   periodo = 2025
# )
# 
# datasus_catalogo("sinan")
# sinan("dengue", uf = "MS", periodo = 2025)

## ----eval = FALSE-------------------------------------------------------------
# pni_imunizacoes(uf = "MS")
# pni_imunizacoes("cobertura", uf = "MS")
# 
# siscan(uf = "MS")
# siscan("mamografia_residencia", uf = "MS", periodo = 2025)
# 
# sisvan(uf = "MS")
# financiamento_sus(uf = "MS")

## ----eval = FALSE-------------------------------------------------------------
# opendatasus_catalogo("dengue")
# opendatasus_recursos("arboviroses-dengue")

## ----eval = FALSE-------------------------------------------------------------
# srag <- sivep_gripe(ano = 2025, n_max = 1000)
# dengue <- sinan_dengue(ano = 2025, n_max = 1000)
# cases <- sinan_mpox(ano = 2025, n_max = 1000)
# 
# adverse_events <- esavi(n_max = 1000)
# mild_cases <- esus_sindrome_gripal(
#   uf = "MS",
#   ano = "last",
#   n_max = 1000,
#   colunas = c(
#     "dataNotificacao", "municipioIBGE", "idade", "sexo"
#   ),
#   normalizar = TRUE
# )
# doses <- pni_doses(
#   ano = "last", mes = "last", n_max = 1000, normalizar = TRUE
# )
# occupancy <- ocupacao_hospitalar(
#   ano = "last", n_max = 1000, normalizar = TRUE
# )
# 
# datasus_proveniencia(dengue)
# datasus_validar_esquema(
#   doses,
#   "pni_doses",
#   campos = c("data_vacinacao", "cnes")
# )

## ----eval = FALSE-------------------------------------------------------------
# sg_resources <- opendatasus_recursos(
#   "notificacoes-de-sindrome-gripal-leve-2020"
# )
# sg_ms <- sg_resources$id[
#   sg_resources$formato == "CSV" &
#     grepl("^Dados MS", sg_resources$nome)
# ]
# summary <- opendatasus_processar(
#   "notificacoes-de-sindrome-gripal-leve-2020",
#   recurso = sg_ms,
#   ano = NULL,
#   colunas = c("municipioIBGE", "resultadoTeste"),
#   tamanho_bloco = 50000,
#   sistema = "sindrome_gripal",
#   FUN = function(dados, posicao, arquivo) {
#     table(dados$codigo_municipio_residencia)
#   }
# )

## ----eval = FALSE-------------------------------------------------------------
# microdados_catalogo()
# microdados_arquivos("sih", ano = 2024, mes = 1, uf = "AC")
# 
# admissions <- sih_microdados(
#   ano = 2024,
#   mes = 1,
#   uf = "AC",
#   colunas = c("MUNIC_RES", "DT_INTER", "DIAG_PRINC", "VAL_TOT"),
#   n_max = 1000,
#   normalizar = TRUE
# )
# 
# datasus_dicionario("sih")
# datasus_proveniencia(admissions)

## ----eval = FALSE-------------------------------------------------------------
# datasus_territorios("regiao")
# datasus_territorios("uf")
# datasus_territorios("municipio", uf = "MS")
# 
# normalizar_codigo_ibge(c("500270", "500370"))
# 
# cases <- data.frame(
#   codmun = c("500270", "500370"),
#   ano = 2025,
#   casos = c(10, 5)
# )
# adicionar_territorio(cases, "codmun")

## ----eval = FALSE-------------------------------------------------------------
# completar_territorios(
#   cases,
#   codigo = "codmun",
#   periodo = "ano",
#   periodos = 2023:2025,
#   preencher = list(casos = 0)
# )

## ----eval = FALSE-------------------------------------------------------------
# calcular_taxa(eventos = c(10, 25), populacao = c(10000, 20000))
# intervalo_taxa(eventos = 10, populacao = 10000)
# 
# taxa_incidencia(
#   dados,
#   casos = "casos",
#   populacao = "populacao",
#   grupo = c("codigo_municipio", "ano"),
#   confianca = 0.95
# )
# taxa_mortalidade(dados, "obitos", "populacao", grupo = "ano")
# proporcao(dados, "vacinados", "elegiveis", grupo = "ano")
# letalidade(dados, "obitos", "casos", grupo = "ano")

## ----eval = FALSE-------------------------------------------------------------
# dados <- juntar_populacao(
#   eventos,
#   denominadores,
#   por = c(codmun = "codigo_municipio", ano = "ano"),
#   coluna_populacao = "habitantes"
# )

## ----eval = FALSE-------------------------------------------------------------
# semana_epidemiologica(as.Date(c("2025-01-01", "2026-01-01")))
# calendario_epidemiologico(2026)
# 
# media_movel(casos_diarios, janela = 7)

## ----eval = FALSE-------------------------------------------------------------
# padronizar_idade(
#   eventos = obitos_por_idade,
#   populacao = habitantes_por_idade,
#   idade = faixa_etaria,
#   populacao_padrao = populacao_padrao("oms"),
#   grupo = ano,
#   confianca = 0.95
# )

