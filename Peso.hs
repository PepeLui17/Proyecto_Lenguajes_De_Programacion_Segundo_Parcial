module Peso
	( convertSolutionToTuples,
	  obtainRoutesWithWeight,
	  pesoTotal
	) where

-- Función que permite convertir lista de Strings en una lista de tuplas
convertSolutionToTuples :: [String] -> [(String,String)] 
convertSolutionToTuples [] = []
convertSolutionToTuples [x] = []
convertSolutionToTuples (x:y:xs) = (x,y):(convertSolutionToTuples (y:xs))


-- Función que permitirá agregar los pesos a las rutas obtenidas por una solución de dijkstra
obtainRoutesWithWeight :: [(String,String)] -> [(String,String,Int)] -> [(String,String,Int)]
obtainRoutesWithWeight x y = [ (r,s,t) | (a,b) <- x, (r,s,t) <- y, a==r && b==s ]


-- Función para obtener el peso total de la ruta mas corta obtenida por una solución de dijkstra
pesoTotal :: [(String,String,Int)] -> Int
pesoTotal xs = sum [ c | (a,b,c) <- xs]