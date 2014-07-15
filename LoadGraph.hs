module LoadGraph
	( loadFile,
	 splitString,
	 transformToTripla,
	 convertLastToInt,
	 finalGraph
	) where

import Data.List.Split (splitOn, endBy)


-- Lectura de fichero, se recibe como parametro un String con nombre del fichero y devuelve lista con las lineas del archivo				
loadFile :: String -> IO [String]
loadFile filename = do 
                contents <- readFile filename
                return (lines contents)

-- Divide la lista de Strings por el separador "|"				
splitString :: [String] ->[[String]]
splitString xs =[ splitOn "|" a |  a <- xs]

-- Convierte una lista de Strings en una lista de triplas
transformToTripla :: [[String]] -> [(String,String,String)]
transformToTripla y= [(a,b,c) | [a,b,c] <- y]


-- Convierte el ultimo valor String de cada una de las triplas a un valor Int
convertLastToInt :: [(String,String,String)] -> [(String,String,Int)]
convertLastToInt z= [(a,b, read c :: Int) | (a,b,c) <- z]

-- Se envia como parametro la lista de lineas del archivo y devolverá una lista de triplas
finalGraph :: [String] -> [(String,String,Int)]
finalGraph a =  convertLastToInt (transformToTripla (splitString a))




