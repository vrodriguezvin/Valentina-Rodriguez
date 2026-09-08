str(df)
#identificar la unidad observacion
(unique(df$matricula_letra))
#cual es la columna identificador?
length(unique(df$matricula_letra)) # el simbolo de peso es para que te muestre las columnas
length(unique(df$pesada)) #este es el identificador porque me dio 1222 observaciones
