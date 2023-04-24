View(epa_http)

#Pregunta 1

str(epa_http)

epa_http$X6 <- as.numeric(epa_http$X6)

read_table(epa_http)

epa_http$X1 <- as.character(epa_http$X1)

str(epa_http)

epa_http$X6 <- as.integer(epa_http$X6)


#Pregunta 2 Identificar el número único de usuarios que han interactuado directamente con
#el servidor de forma segregada según si los usuarios han tenido algún tipo de
#error en las distintas peticiones ofrecidas por el servidor.


usuarios_sinerror <- sum(epa_http$X6 == "200")
usuarios_conerror <- sum(epa_http$X6 != "200")

print(paste("Cantidad de usuarios que no han tenido ningun error en peticiones al servidor:", usuarios_sinerror))
print(paste("Cantidad de usuarios con errores en peticiones al servidor:",usuarios_conerror))

nrow(epa_http)