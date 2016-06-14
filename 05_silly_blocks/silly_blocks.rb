def reverser
  ret = []
  text = yield.split
   text.each do |x|
    ret << x.reverse
  end
  ret.join(' ')
end

def adder(n=0)  
  value = 0
  base = yield 
  n > 0 ? base + n : base + 1 
end

def adder(n=1, &block)  
   block.call + n 
end


def repeater(n=1,&block)
  n.times do
    block.call
  end
end


