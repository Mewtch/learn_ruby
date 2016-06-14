class XmlDocument



  
  def method_missing(tag, *args, &block)
    ret = ''
     ret ="<#{tag}/>"
     
     if args
       args.each do |item|
        item=item.flatten
        ret = "<#{tag} #{item[0].to_s}='#{item[1]}'}/>"
     #  ret = %Q[[#{w}] "#{entries[w]}"\n]
        
       end
     end
     ret
  end








end