add a b = a+b

-- Returns continuous coordinates corresponding to a pair of discrete coordinates, scale em to
discToCont x y = x + y

-- Updates complex coordinates according to mandelbrot eqn
-- update x y x0 y0 = (x*x - y*y + x0, 2*x*y + y0)

-- Check that coordinates lies within circle of radius 2 (Mandelbrot condition)
withinBounds x y = x*x + y*y < 4

-- Recursively update color while x, y within bound, update iteration if not within bound
getMax 1000 x y x0 y0 = 1000
getMax itrn x y x0 y0 = do
  if withinBounds x y then getMax (itrn+1) (x*x-y*y+x0) (2*x*y+y0) x0 y0 else itrn

-- pixels -> list of tuples containing pixel values: [(1,2), (3,4), (5,6)] etc
-- getColor -> gets color corresponding to a pixel x, y

main = do
  print $ getMax 10 0 0 0 1
