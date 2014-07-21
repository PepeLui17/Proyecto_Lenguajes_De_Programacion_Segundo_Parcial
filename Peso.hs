module Peso
	( convertSolutionToTuples,
	  obtainRoutesWithWeight,
	  pesoTotal
	) where

-- Funci�n que permite convertir lista de Strings en una lista de tuplas
convertSolutionToTuples :: [String] -> [(String,String)] 
convertSolutionToTuples [] = []
convertSolutionToTuples [x] = []
convertSolutionToTuples (x:y:xs) = (x,y):(convertSolutionToTuples (y:xs))


-- Funci�n que permitir� agregar los pesos a las rutas obtenidas por una soluci�n de dijkstra
obtainRoutesWithWeight :: [(String,String)] -> [(String,String,Int)] -> [(String,String,Int)]
obtainRoutesWithWeight x y = [ (r,s,t) | (a,b) <- x, (r,s,t) <- y, a==r && b==s ]


-- Funci�n para obtener el peso total de la ruta mas corta obtenida por una soluci�n de dijkstra
pesoTotal :: [(String,String,Int)] -> Int
pesoTotal xs = sum [ c | (a,b,c) <- xs]