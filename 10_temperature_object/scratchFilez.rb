 def evaluate(pol)
    order = []
    opps = {:+ => Proc.new {plus}, :- => Proc.new{minus}, :/ => Proc.new{divide}, :* => Proc.new{times} }
    tokens(pol).reverse.chunk{|n| n.is_a?(Integer)}.each{|e,a| e == true ? a.reverse.each{|a| push(a) } : a.each {|a| order.push(a) }}
    order.reverse.each {|o| (opps[o].call) }
  end