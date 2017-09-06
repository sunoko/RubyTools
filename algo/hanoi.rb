def hanoi(n,s,e,w)
  if n == 1
    print n, "-th disk from ", s, " to ", e, "\n"
  else
    hanoi(n-1,s,w,e)
    print n, "-th disk from ", s, " to ", e, "\n"
    hanoi(n-1,w,e,s)
  end
end
hanoi(3,1,3,2)

POLES = ['Start', 'Goal', 'Temp']
def hanoi(n, from=POLES[0], to=POLES[1])
  temp = (POLES - [from, to]).to_s
  return if n == 0
  hanoi(n-1, from, temp)
  puts "move #{n} #{from} => #{to}"
  hanoi(n-1, temp, to)
end
hanoi(3)

def hanoi(n, from, to, via)
  hanoi(n - 1, from, via, to) if n > 1
  printf("disk %d : %c -> %c\n", n, from, to)
  hanoi(n - 1, via, to, from) if n > 1
end
hanoi(3, 1, 2, 3)