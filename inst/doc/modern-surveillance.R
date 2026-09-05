## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE, comment = "#>")
library(datasus)

## ----discovery, eval=FALSE----------------------------------------------------
# opendatasus_catalogo("ESAVI")
# opendatasus_catalogo("doses aplicadas PNI")
# 
# resources <- opendatasus_recursos("esavi")
# resources[, c("id", "nome", "formato", "ano", "tamanho")]

## ----wrappers, eval=FALSE-----------------------------------------------------
# events <- esavi(
#   n_max = 1000,
#   colunas = c(
#     "nu_notificacao", "dt_notificacao", "nu_idade", "ds_sexo"
#   ),
#   normalizar = TRUE
# )
# 
# illness <- esus_sindrome_gripal(
#   uf = "MS",
#   ano = 2024,
#   n_max = 1000,
#   colunas = c(
#     "dataNotificacao", "municipioIBGE", "idade", "sexo"
#   ),
#   normalizar = TRUE
# )
# 
# doses <- pni_doses(
#   ano = 2026,
#   mes = 1,
#   n_max = 1000,
#   colunas = c(
#     "co_paciente", "dt_vacina", "co_vacina",
#     "co_municipio_paciente"
#   ),
#   normalizar = TRUE
# )
# 
# occupancy <- ocupacao_hospitalar(
#   ano = 2022,
#   n_max = 1000,
#   colunas = c(
#     "dataNotificacao", "cnes", "ocupacaoHospitalarUti"
#   ),
#   normalizar = TRUE
# )

## ----standardize--------------------------------------------------------------
raw_events <- data.frame(
  nu_notificacao = c("A-001", "A-002"),
  dt_notificacao = c("2026-01-10", "2026-01-11"),
  nu_idade = c("34", "67"),
  ds_sexo = c("Feminino", "Masculino"),
  stringsAsFactors = FALSE
)

events <- datasus_padronizar(raw_events, sistema = "esavi")
str(events)

## ----dictionary---------------------------------------------------------------
head(datasus_dicionario("esavi"), 8)

## ----schema-------------------------------------------------------------------
validation <- datasus_validar_esquema(
  events,
  sistema = "esavi",
  campos = c(
    "id_notificacao", "data_notificacao", "idade", "sexo"
  )
)
validation

## ----strict-schema, eval=FALSE------------------------------------------------
# datasus_validar_esquema(
#   events,
#   sistema = "esavi",
#   campos = c("id_notificacao", "data_notificacao"),
#   estrito = TRUE
# )

## ----multipart, eval=FALSE----------------------------------------------------
# resources <- opendatasus_recursos(
#   "notificacoes-de-sindrome-gripal-leve-2020"
# )
# ms_id <- resources$id[
#   resources$formato == "CSV" & grepl("^Dados MS", resources$nome)
# ][1]
# 
# files <- opendatasus_arquivos(
#   "notificacoes-de-sindrome-gripal-leve-2020",
#   recurso = ms_id,
#   formato = "CSV"
# )
# files[, c("recurso", "ano", "parte", "url")]

## ----provenance, eval=FALSE---------------------------------------------------
# provenance <- datasus_proveniencia(events)
# str(provenance)

