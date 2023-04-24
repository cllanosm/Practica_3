View(epa_http)

#Pregunta 1

str(epa_http)

epa_http$return_code <- as.numeric(epa_http$return_code)

read_table(epa_http)

epa_http$source <- as.character(epa_http$source)

str(epa_http)

epa_http$return_code <- as.integer(epa_http$return_code)


#Pregunta 2 Identificar el número único de usuarios que han interactuado directamente con
#el servidor de forma segregada según si los usuarios han tenido algún tipo de
#error en las distintas peticiones ofrecidas por el servidor.


usuarios_sinerror <- sum(epa_http$return_code == "200")
usuarios_conerror <- sum(epa_http$return_code != "200")

print(paste("Cantidad de usuarios que no han tenido ningun error en peticiones al servidor:", usuarios_sinerror))
print(paste("Cantidad de usuarios con errores en peticiones al servidor:",usuarios_conerror))

tipo_errores <- unique(epa_http$return_code)
print(tipo_errores)

filtro200 <-  subset(epa_http, return_code != "200")
conteo_errores <-  table(filtro200$return_code)
print(conteo_errores)
#######################################################################

epa_http$X3 <- as.factor(epa_http$X3)
epa_http_one_hot$return_code <- as.factor(epa_http_one_hot$return_code)


library(mltools)
library(data.table)
epa_http_one_hot <- one_hot(as.data.table(epa_http), sparsifyNAs = TRUE)


#Codigo para cambiar nombre de columnas
colnames(epa_http) <- c("source", "datetime", "http_method", "resource", "http_version", "return_code", "bytes_sent")

epa_http$http_method <- gsub('[\"]', '', epa_http$http_method)

########