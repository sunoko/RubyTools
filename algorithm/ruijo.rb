def power(x, y)
  return 1 if y == 0
  result = 1
  y.times do
    result *= x
  end
  result
end