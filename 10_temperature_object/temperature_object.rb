

class Temperature
	attr_accessor :c, :f

	def initialize(args={})
		@c = args[:c] || nil
		@f = args[:f] || nil
	end

	class << self
		def ftoc(f)
			((f-32)/1.8).round(1)
		end

		def ctof(c)
			((c*1.8)+32).round(1)
		end

		def from_celsius(c)
			Temperature.new(:c => c)
		end

		def from_fahrenheit(f)
			Temperature.new(:f => f)
		end
	end	

	

	def in_fahrenheit
		 return f if @f #c.nil?
		 n = (c*1.8)+32
		 n.round(1)
	end
	
	def in_celsius
		 return c if @c #f.nil?
		 n = (f-32)/1.8
		 n.round(1)
	end

end

class Celsius < Temperature
  def initialize(c)
    super(:c => c)
  end
end


class Fahrenheit < Temperature
  def initialize(f)
    super(:f => f)
  end
end








=begin
class Temperature
	attr_accessor :c, :f

	def initialize(args={})
		@c = args[:c] || nil
		@f = args[:f] || nil
	end

	def in_fahrenheit
		 return self.f if self.c.nil?
		 n = (self.c*1.8)+32
		 n.round(1)
	end
	
	def in_celsius
		 return self.c if self.f.nil?
		 n = (self.f-32)/1.8
		 n.round(1)
	end

end	

	
=end
