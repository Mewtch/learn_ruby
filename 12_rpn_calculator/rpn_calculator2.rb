class RPNCalculator 
  attr_accessor :value, :stack
  
 def initialize
   @value = 0
   @stack = []
 end

 def push(n)
  @stack << n
 end
 
 def stackcheck
  if @stack.length >= 2 && @value==0
     @stack.pop(2)
  elsif @value != 0 && stack.length >=1
      [@value, stack.pop]
  else
    raise "calculator is empty"
  end
 end   

 def plus
  val = stackcheck  
  @value = val[0]+val[1]
  @stack << @value
 end
 
 def minus
  val = stackcheck    
  @value = val[0]-val[1]
  @stack << @value
 end
 
 def divide
   val = stackcheck 
  @value = val[0]/val[1].to_f
  @stack << @value
 end
 
 def times
   val = stackcheck 
  @value = val[0]*val[1]
  @stack << @value
 end

def tokens(string)
  signs = ['+','-','*','/']
  hsigns = {'+' => :+,'-' => :-,'*' => :*,'/' => :/}
  temp = []
  arr = string.gsub!(/\s/,'').split(/(\d*\D*)/).each do |x|
    if x.size > 1
      temp << x.chars.map{|s| (signs.include? s) ? s=hsigns[s] : s=s.to_i  }
    end
  end
  temp.flatten
end 
  
def evaluate(string)
    signs = ['+','-','*','/']
    hsigns = {'+' => :plus,'-' => :minus,'*' => :times,'/' => :divide}
    temp = []
    arr = string.gsub!(/\s/,'').split(/(\d*\D*)/).each do |x|
      if x.size > 1
        temp << x.chars.map{|s| (signs.include? s) ? s=hsigns[s] : s=s.to_i  }
      end
    end
    temp.each do |arr|
      vhash = arr.group_by{|x| x.class}
      vhash[Fixnum].each {|num| self.push(num)}
      vhash[Symbol].each do |operator|
        self.send(operator)
      end
    end
   self.value
  end

end




