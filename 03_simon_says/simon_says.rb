def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word, n=2)
  word = word + " "
  (word*n).strip
end

def start_of_word(word,n)
  word[0,n]
end

def first_word(word)
  word.split(' ')[0]
end

def titleize(word)
  small = ["and", "or", "the", "over", "to", "the", "a", "but","bung"]
  word.split(' ').each_with_index do |w,i|
    w.capitalize! if i==0 || (!small.include? w)
  end.join(' ')
end