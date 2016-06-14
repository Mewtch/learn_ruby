class RPNCalculator 
  attr_accessor :value, :stack
  
 def initialize
   @value = nil
   @stack = []
 end

 def push(n)
  @stack << n
 end
 
 def stackcheck
  if @stack.length >= 2 
     @stack.pop(2)
  elsif @value != nil && stack.length >=1
      [@value, stack.pop]
  else
    raise "calculator is empty"
  end
 end   

 def plus
  val = stackcheck  
  @stack << @value = val[0]+val[1]
  @value
 end
 
 def minus
  val = stackcheck    
  @stack << @value = val[0]-val[1]
  @value
 end
 
 def divide
  val = stackcheck    
  @stack << @value = val[0]/val[1].to_f
  @value
 end
 
 def times
  val = stackcheck 
  @stack << @value = val[0]*val[1].to_f
  @value
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
    arr = string.split(/(?<=[+-\/*])\s(?=\d)/).each do |x|
    if x.size > 1
      temp << x.split(" ").map{|s| (signs.include? s) ? s=hsigns[s] : s=s.to_i  }
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

=begin
  
good solution, not mine
class RPNCalculator
  attr_accessor :stack

  def initialize
    @stack = []
    @value = nil
  end

  def push num
    @stack.push(num)
  end

  def empty
    if @stack[0] == nil
      raise "calculator is empty" 
    end
  end

  def plus
    empty
    @value = @stack.pop + @stack.pop
    @stack.push(@value)
  end

  def minus
    empty
    @value = -(@stack.pop - @stack.pop)
    @stack.push(@value)
  end

  def divide
    empty
    @value = 1.0/(@stack.pop.to_f / @stack.pop)
    @stack.push(@value)
  end

  def times
    empty
    @value = (@stack.pop * @stack.pop)
    @stack.push(@value)
  end

  def value
    if @stack.size == 1
      @value = @stack[0]
    else
      @value
    end
  end

  def tokens str
    result = []
    str.split(" ").each do |char|
      if (/[0-9]+/ =~ char) != nil
        result.push(char.to_i)
      else
        result.push(char.to_sym)
      end
    end
    result
  end

  def evaluate str
    form = tokens(str)
    @stack = []
    form.each do |char|
      case char
      when :+
        plus
      when :-
        minus
      when :*
        times
      when :/
        divide
      else
        push char
      end
    end
    value
  end

end

calculator = RPNCalculator.new
p calculator.evaluate("1 2 3 * + 4 5 - /")


=end