{-# LANGUAGE NoMonomorphismRestriction #-} 
import qualified Data.Heap as Heap 
import qualified Data.Map as Map 
import Data.Maybe (fromJust, fromMaybe, maybe) 
 
 
-- dijkstra con heap, relaja los tipos de los nodos y los pesos 
 
dijkstra :: (Eq a, Ord a, Ord b, Num b, Bounded b) => a -> Map.Map a [(a, b)] -> Map.Map a a 
dijkstra a g = solve (Heap.insert (a, 0) (Heap.empty :: Heap.MinPrioHeap a b)) (Map.insert a 0 Map.empty) Map.empty 
  where  solve q d p = if Heap.null q then p else solve q'' d' p' 
           where ((u, du), q') = fromJust $ Heap.view q 
                 (q'', d', p') = foldl chk (q', d, p) (g Map.! u) 
                 chk (_q, _d, _p) (v, w) = if dv <= du + w then (_q, _d, _p) 
                                                           else (Heap.insert (v, du + w) _q, mm (du + w) _d, mm u _p) 
                   where dv = fromMaybe maxBound $ Map.lookup v _d 
                         mm k m = Map.alter (\_ -> Just k) v m 
 
-- dada una "solución dijkstra" de un nodo, calcula la ruta más corta a otro 
 
shortestPath :: Ord a => Map.Map a a -> a -> [a] 
shortestPath p b = b : maybe [] (shortestPath p) (Map.lookup b p) 
 
 
 
 
-- transforma un grafo para acceder eficientemente a los nodos vecinos 
 
transformGraph :: (Eq a, Ord a, Num b) => [(a, a, b)] -> Map.Map a [(a, b)] 
transformGraph = foldl add Map.empty 
  where add m (u, v, p) = Map.alter (up u p) v $ Map.alter (up v p) u m 
        up u p  Nothing  = Just [(u, p)] 
        up u p (Just xs) = Just $ (u, p):xs 
 
 
 
 
gtest :: [(String, String, Int)] 
gtest = [(a, b, 1) 
        ,(a, c, 40) 
        ,(b, d, 1) 
        ,(c, d, 1) 
        ,(c, f, 2) 
        ,(d, e, 1) 
        ,(d, g, 4) 
        ,(e, h, 1) 
        ,(f, g, 1) 
        ,(g, h, 1) 
        ] 
        where a = "A" 
              b = "B" 
              c = "C" 
              d = "D" 
              e = "E" 
              f = "F" 
              g = "G" 
              h = "H" 
 
test = shortestPath (dijkstra "A" $ transformGraph gtest) "F" 