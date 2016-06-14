class Dictionary

  attr_accessor :entries

  def initialize
    @entries = {}
  end
  
  def add(e)
    if e.is_a?(Hash)
      e.each do |k,v|
        entries[k]=v
      end
    else
      entries[e]=nil
    end
  end

  def keywords
    entries.keys.sort
  end
  
  def include?(word)
    keywords.any? {|w| w==word}
  end

  def find(pattern)
    found = []
    ret = {}
    keywords.each {|w|found << w if /#{pattern}/ =~ w}
    found.each do |w|
      ret.store(w, entries[w])
    end
   ret
  end

  def printable
    s= ''
    keywords.each do |w|
      s += %Q[[#{w}] "#{entries[w]}"\n]
    end
    s.strip
  end

  
end