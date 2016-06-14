def measure(n=1,&block)
  result = []
  n.times do
    start = Time.now
    block.call
    ends = Time.now
    result << ends-start
  end
  result.length == 1 ? result[0] : result.inject(0){|s,n| s+=n}/result.length 
end