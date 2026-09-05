## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE, comment = "#>")
library(datasus)

## ----raw-catalog, eval=FALSE--------------------------------------------------
# microdados_catalogo()
# 
# microdados_arquivos(
#   sistema = "sih",
#   ano = 2024,
#   mes = 1,
#   uf = "AC"
# )

## ----raw-read, eval=FALSE-----------------------------------------------------
# admissions <- sih_microdados(
#   ano = 2024,
#   mes = 1,
#   uf = "AC",
#   colunas = c(
#     "MUNIC_RES", "DT_INTER", "DIAG_PRINC", "VAL_TOT"
#   ),
#   n_max = 1000,
#   normalizar = TRUE
# )
# 
# deaths <- sim_microdados(
#   ano = 2023,
#   uf = "RR",
#   colunas = c("CODMUNRES", "DTOBITO", "CAUSABAS"),
#   n_max = 1000,
#   normalizar = TRUE
# )
# 
# births <- sinasc_microdados(
#   ano = 2023,
#   uf = "RR",
#   colunas = c("CODMUNRES", "DTNASC", "SEXO", "PESO"),
#   n_max = 1000,
#   normalizar = TRUE
# )

## ----raw-dictionary-----------------------------------------------------------
head(datasus_dicionario("sih"), 10)

## ----raw-validation, eval=FALSE-----------------------------------------------
# datasus_validar_esquema(
#   admissions,
#   sistema = "sih",
#   campos = c(
#     "codigo_municipio_residencia",
#     "data_internacao",
#     "diagnostico_principal_cid10",
#     "valor_total"
#   ),
#   estrito = TRUE
# )

## ----generic-open-read, eval=FALSE--------------------------------------------
# resources <- opendatasus_recursos("arboviroses-dengue")
# csv_id <- resources$id[resources$formato == "CSV"][1]
# 
# sample <- opendatasus_ler(
#   "arboviroses-dengue",
#   recurso = csv_id,
#   colunas = c("DT_NOTIFIC", "SG_UF", "ID_MUNICIP"),
#   n_max = 1000
# )

## ----chunked, eval=FALSE------------------------------------------------------
# resources <- opendatasus_recursos(
#   "notificacoes-de-sindrome-gripal-leve-2020"
# )
# ms_id <- resources$id[
#   resources$formato == "CSV" & grepl("^Dados MS", resources$nome)
# ][1]
# 
# processed <- opendatasus_processar(
#   "notificacoes-de-sindrome-gripal-leve-2020",
#   recurso = ms_id,
#   ano = NULL,
#   colunas = c("municipioIBGE", "resultadoTeste"),
#   tamanho_bloco = 50000,
#   sistema = "sindrome_gripal",
#   FUN = function(dados, posicao, arquivo) {
#     data.frame(
#       arquivo = arquivo,
#       bloco_inicial = posicao,
#       registros = nrow(dados),
#       positivos = sum(
#         dados$resultado_teste == "Positivo",
#         na.rm = TRUE
#       )
#     )
#   }
# )
# 
# processed$linhas
# processed$blocos
# processed$resultados

## ----cache, eval=FALSE--------------------------------------------------------
# first <- ocupacao_hospitalar(
#   ano = 2022,
#   n_max = 1000,
#   cache = TRUE
# )
# 
# source <- datasus_proveniencia(first)
# str(source)

