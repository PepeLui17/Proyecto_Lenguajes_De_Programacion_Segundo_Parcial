import Dijkstra
import LoadGraph

main = do
		putStrLn "--------------- SISTEMA DE BUSQUEDA DE VUELOS ---------------"
		putStrLn "Ingrese parametro de busqueda (Costo o Distancia):"
		param <- getLine
		archivo <- loadFile "input.txt"
		let g= finalGraph archivo
		putStrLn "Ingrese ciudad de origen"
		origen <- getLine
		putStrLn "Ingrese ciudad destino"
		destino <- getLine
		let resultado = shortestPath (dijkstra destino $ transformGraph g) origen
		print resultado