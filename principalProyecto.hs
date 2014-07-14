import Dijkstra
import LoadGraph

-- Main principal del programa

main = do
	--foo <- putStrLn "--------------- SISTEMA DE BUSQUEDA DE VUELOS ---------------"
	--putStr "Ingrese factor de busqueda (Costo o Distancia):\n"
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
			let resultado = shortestPath (dijkstra destino $ transformGraph g) origen
			putStrLn "\nRuta mas corta:\n"
			print resultado
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
				let resultado = shortestPath (dijkstra destino $ transformGraph g) origen
				putStrLn "\nRuta mas corta:\n"
				print resultado
				return ()
			else do
				putStrLn "Parametro No valido, vuelva a ingresar parametro\n\n"
				main

				