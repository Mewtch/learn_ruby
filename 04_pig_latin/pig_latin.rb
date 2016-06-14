def taker(w)
  word = w
  vowel =  %w(a e i o u)
  temp = w.split(//).take_while{|x| !vowel.include? x}
    start = temp.length
    w =  word[start..-1] + temp.join + 'ay'
 end

def translate(word)
  ret = []
   word.split.each do |w|
    if w.match(/(.?qu)/)
      l = $1.length
      w = w[l..-1] + $1 + 'ay'
    else
      w = taker(w) 
    end
    ret << w
   end
  ret.join(' ')
end