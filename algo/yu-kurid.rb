# 最大公約数
def gcd(a, b)
  a, b = b, a if a < b
  loop do
    m = a % b
    return b if m == 0
    a, b = b, m
  end
end

def gcd(a, b)
  gcd(b, a) if b > a
  return b if (r = a % b).zero?
  gcd(b, r)
end

# 最小公倍数
def lcm(a, b)
  a * b / gcd(a,b)
end