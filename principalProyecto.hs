import Dijkstra
import LoadGraph
import Peso

-- Main principal del programa
main = do
    factor <- getLine
    if factor == "Costo"
        then do
			putStrLn "\n--------------- SISTEMA DE BUSQUEDA DE VUELOS CON PRECIO MAS BAJO---------------\n"
			archivo <- loadFile "vuelos_costo.txt"
			let g= finalGraph archivo
			putStrLn "Ingrese ciudad de origen:"
			origen <- getLine 
			putStrLn "Ingrese ciudad destino:"
			destino <- getLine
			let result = shortestPath (dijkstra destino $ transformGraph g) origen
			let rutas = obtainRoutesWithWeight (convertSolutionToTuples result) g
			
			if (length result) == ((length rutas) + 1) && (length rutas) /= 0
				then do
				putStrLn "\nRuta mas corta:"
				print rutas
				putStrLn "\nCosto total:"
				print (pesoTotal rutas)				
				return ()
			else do
				putStrLn "\nNo existe ruta posible\n"
				return ()
				
			
        else if factor == "Distancia"
			then do
				putStrLn "\n--------------- SISTEMA DE BUSQUEDA DE VUELOS CON DISTANCIA MAS CORTA---------------\n"
				archivo <- loadFile "vuelos_distancia.txt"
				let g= finalGraph archivo
				putStrLn "Ingrese ciudad de origen:"
				origen <- getLine
				putStrLn "Ingrese ciudad destino:"
				destino <- getLine
				let result = shortestPath (dijkstra destino $ transformGraph g) origen
				let rutas = obtainRoutesWithWeight (convertSolutionToTuples result) g
			
				if (length result) == ((length rutas) + 1) && (length rutas) /= 0
					then do
					putStrLn "\nRuta mas corta:"
					print rutas
					putStrLn "\nDistancia total:"
					print (pesoTotal rutas)				
					return ()
				else do
					putStrLn "\nNo existe ruta posible\n"
					return ()
			else do
				putStrLn "Parametro No valido, vuelva a ingresar factor (Costo o Distancia)\n\n"
				main

				