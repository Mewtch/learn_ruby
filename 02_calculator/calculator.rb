def add(a,b)
  a+b
end

def subtract(a,b)
  a-b
end

def sum(arr) 
  arr.inject(0){|sum,n| sum+=n}
end

def multiply(arr)
 p arr.inject(1){|sum,n| sum*=n}
end

def power(a,b)
  a**b
end

def factorial(n)
  return 1 if n==0
  (1..n).inject(:*)
end
