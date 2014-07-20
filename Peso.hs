
convertSolutionToTuples :: [String] -> [(String,String)] 
convertSolutionToTuples [] = []
convertSolutionToTuples [x] = []
convertSolutionToTuples (x:y:xs) = (x,y):(convertSolutionToTuples (y:xs))


ObtainRoutesWithDistance :: [(String,String)] -> [(String,String,Int)] -> [(String,String,Int)]
ObtainRoutesWithDistance x y= [ (r,s,t) | (a,b) <- x, (r,s,t) <- y, a==r && b==s ]


pesoTotal :: [(String,String,Int)] -> Int
pesoTotal xs = sum [ c | (a,b,c) <- xs]