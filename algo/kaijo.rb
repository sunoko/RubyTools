class Integer
  def !
    (1..self).inject(:*)
  end

  def test
    self * (self == 1 ? 1 : (self - 1).test)
  end
end
puts 5.test # 120
puts 5.! # 120

def test(n)
  return 1 if n == 0
  n * test(n - 1)
end

def test(n, a = 1)
  return a if n == 0
  test(n - 1, a * n)
end

def test(n)
  m = 1
  for x in 2..n
    m *= x
  end
  m
end