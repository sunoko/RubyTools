def fib1(n)
  return 1 if n <= 1
  fib1(n-1) + fib1(n-2)
end

@memo = {}
def fib2(n)
  return 1 if n <= 1
  return @memo[n] if @memo[n]
  @memo[n] = fib2(n-1) + fib2(n-2)
end

def fib3(n)
  if n==0
    return 1
  else
    fib1 = fib2 = fib3 = 1
    (n-1).times do
      fib3 = fib1 + fib2
      fib1 = fib2
      fib2 = fib3
    end
    fib2
  end
end

require 'benchmark'

Benchmark.bm(10) do |b|
  b.report "fib" do
    fib1(35)
  end

  b.report "fib2 (DP)" do
    fib2(35)
  end

  b.report "fib3(DP)" do
    fib3(35)
  end  
end

