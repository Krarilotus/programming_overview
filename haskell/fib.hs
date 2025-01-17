-- Datei: fib.hs
-- Kompilieren mit: ghc fib.hs -o fibprog
-- Oder: stack run (falls du ein Stack-Projekt nutzt)
-- Ausführen: ./fibprog

module Main where

-- Unendliche Liste der Fibonacci-Zahlen als Integer
fibs :: [Integer]
fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

main :: IO ()
main = do
  putStrLn "Gib eine Zahl n ein (z.B. 100000, um fib(100000) zu berechnen):"
  input <- getLine
  let n = read input :: Int

  -- 1) Das n-te Fibonacci-Element
  -- Achtung: fibs !! n kann je nach n viel Zeit/Arbeitsspeicher beanspruchen!
  let nthFib = fibs !! n
  putStrLn $ "fib(" ++ show n ++ ") = " ++ show nthFib

  -- 2) Erste n Fibonacci-Zahlen (vorsicht, kann groß werden!)
  -- take n fibs -> liefert eine Liste mit den ersten n Elementen [fib(0), fib(1), ... fib(n-1)]
  -- Wenn du n sehr groß wählst, kann das Ausdrucken sehr viel sein. :-)
  -- Für kleine n kannst du's mal ausgeben:
  if n <= 30
     then putStrLn $ "Erste " ++ show n ++ " Fibonacci-Zahlen: " ++ show (take n fibs)
     else putStrLn "Liste ist zu groß zum Ausdrucken!"
