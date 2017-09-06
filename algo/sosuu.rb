def sosuu(num)
  result = 0
  (1..num).each do |n|
    result += 1 if num % n == 0
    return nil if result == 3
  end
  @s.push(num)
end

@s = []
(1..10).each do |n|
  p sosuu(n)
end

(2..5000).each do |n|
  puts sosuu(n) if !sosuu(n).nil?
end