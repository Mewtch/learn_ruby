
class Array

	def sum
		inject(0){|sum,n| sum+=n}
	end

	def square
		return [] if empty?
		map{|x| x*x}
	end

    def square!
		return [] if empty?
		map!{|x| x*x}
	end
end