def sum(arr)
  return 0 if arr.empty?
  top = arr.shift
  top + sum(arr)
end
puts sum((1..5).to_a)

class String
  def look_and_say
    gsub(/(.)\1*/){|s| s.size.to_s + s[0]}
  end
end

n = "1"
12.times do
  puts n
  n = n.look_and_say
end

class String
  def caesar(rot = 13)
    result = ""
    large = ('A'..'Z').to_a
    small = ('a'..'z').to_a
    self.split('').each{|i| 
      if i =~ /[A-Z]/
        index = (large.index(i) + rot ) % 26
        result += large[index]
      elsif i =~ /[a-z]/
        index = (small.index(i) + rot) % 26
        result += small[index]    
      else
        result += i
      end
    }
    result
  end

  def decrypt_caesar(rot = 13)
    result = ""
    large = ('A'..'Z').to_a
    small = ('a'..'z').to_a
    self.split('').each{|i| 
      if i =~ /[A-Z]/
        index = (large.index(i) - rot ) % 26
        result += large[index]
      elsif i =~ /[a-z]/
        index = (small.index(i) - rot) % 26
        result += small[index]    
      else
        result += i
      end
    }
    result
  end
end
puts "Uryyb Jbeyq!".caesar
puts "Ebiil, Tloia!".caesar(3)
puts "Hello, World!".decrypt_caesar
puts "Hello, World!".decrypt_caesar(3)

def my_method(*param)
  p param
end
my_method(1,2,3,4,5)

def arr_length(arr)
  return  0 if arr.empty?
  arr.shift
  1 + arr_length(arr)
end
puts arr_length([1,2,3])

def max(arr)
  return arr[0] if arr.length == 1
  x = arr.shift
  y = max(arr)
  # max
  x > y ? x : y
  # min
  #x < y ? x : y
end
p max([3,5,7,1,66,3,100])

def forall?(arr, &b)
  return true if arr.empty?
  top = arr.shift
  b.call(top) && forall?(arr, &b)
end
block = lambda{|n| n % 2 == 0}
p forall?([2,1,6], &block)
p forall?([2,10,6], &block)

def exists?(arr, &b)
  return false if arr.empty?
  top = arr.shift
  b.call(top) || exists?(arr, &b)
end
block = lambda{|n| n % 2 != 0}
p exists?([2,1,6], &block)
p exists?([2,10,6], &block)

def find(arr, &b)
  return nil if arr.empty?
  top = arr.shift
  b.call(top) ? top : find(arr, &b)
end
string = lambda{|n| n.kind_of?(String)}
p find([1,2,3,"hello","kkk"], &string)

def skip(arr, n)
  return nil if arr.empty?
  if n == 0
    arr  
  else
    arr.shift
    skip(arr, n - 1)
  end
end
p skip([1,2,3,4,5], 2)
p skip([1,2,3,4,5], 4)

def map(arr, result=[], &b)
  return result if arr.empty?
  top = arr.shift
  result << b.call(top)
  map(arr, result, &b)
end
double = lambda{|n| n * 5}
p map([1,2,3], &double)

def filter(arr, result=[], &b)
  arr_copy ||= Array.new(arr)
  return result if arr_copy.length == 0
  top = arr_copy.shift
  result << top if b.call(top)
  filter(arr_copy, result, &b)
end
arr = [100, 2, 1, 33, 50, 51]
fifty_over = lambda{|n| n > 50}
p filter(arr, &fifty_over)
p arr

def choose(arr, result = [], &b)
  return result if arr.empty?
  top = arr.shift
  result << b.call(top) if b.call(top)
  choose(arr, result, &b)
end
func = lambda{|n|
  return n * 2 if n.even?
}
p choose([1,2,3,4,5], &func)

def partition(arr, satisfy=[], not_satisfy=[], &b)
  arr_copy ||= Array.new(arr)
  return satisfy, not_satisfy if arr_copy.length == 0
  top = arr_copy.shift
  if b.call(top)
    satisfy << top
  else
    not_satisfy << top
  end
  partition(arr_copy, satisfy, not_satisfy, &b)
end
ten_over = lambda{|n| n > 10}
arr = [100, 2, 1, 33, 50, 51]
result = partition(arr, &ten_over)
p result[0]
p result[1]

def factorical(n)
  return 1 if n.zero?
  n * factorical(n - 1)
end
p factorical(5)

# 数列
def arithmetic_seq(start, interval, n, result=[])
  return result if n == 0
  result << start
  start += interval
  arithmetic_seq(start, interval, n - 1, result)
end
arithmetic_seq(10,88,5)

def prime?(n)
  @cache ||= {}                          
  return @cache[n] if @cache.has_key?(n) 
  return false if n < 2                  
  @cache[n] = divisible_count(n, n)
end

def divisible_count(target,n,count=0)
  return true if n == 0 && count == 2
  return false if n == 0
  count += 1 if target % n == 0
  divisible_count(target,n-1,count)
end
p prime?(47)
p prime?(2203)
p prime?(5000)

def bubble_sort(arr, size, idx=0)
  if size > 1
    if idx < size - 1
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
      end
      bubble_sort(arr, size, idx + 1)
    end
    bubble_sort(arr, size - 1, 0)
  end
  arr
end
arr = [3, 4, 6, 1, 7, 2]
p bubble_sort(arr, arr.length)