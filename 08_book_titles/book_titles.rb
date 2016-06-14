

class Book
  
  def title=(title)
    @title = title
  end
  
  def title
    cap(@title)
  end

  def cap s
    exceptions = %w(the a an of in and)
    ret = []  
    s.split.each_with_index do |w,i|
      if i==0
        ret << w.capitalize
      end
      if i>0 
        if  exceptions.include? w
          ret << w
       else
         ret << w.capitalize 
       end
      end
     end
    ret.join(' ')
   end
end




