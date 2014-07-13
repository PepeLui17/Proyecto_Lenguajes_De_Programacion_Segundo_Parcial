module LoadGraph
	( loadFile,
	 splitString,
	 transformToTripla,
	 finalTuple,
	 finalGraph
	) where

import Data.List.Split (splitOn, endBy)


-- Lectura de fichero, se recibe como parametro un String con nombre del fichero y devuelve lista con las lineas del archivo				
loadFile :: String -> IO [String]
loadFile filename = do 
                contents <- readFile filename
                return (lines contents)




splitString :: [String] ->[[String]]
splitString xs =[ splitOn "|" a |  a <- xs]



transformToTripla :: [[String]] -> [(String,String,String)]
transformToTripla y= [(a,b,c) | [a,b,c] <- y]



finalTuple :: [(String,String,String)] -> [(String,String,Int)]
finalTuple z= [(a,b, read c :: Int) | (a,b,c) <- z]


-- Se envia como parametro la lista de lineas del archivo y devolverá una lista de triplas
finalGraph :: [String] -> [(String,String,Int)]
finalGraph a =  finalTuple (transformToTripla (splitString a))


