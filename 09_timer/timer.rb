class Timer
  attr_accessor :seconds
  
  def initialize
    @seconds = 0
  end

  def time_string
    t= 3600
    total_seconds = self.seconds
    hour = total_seconds/t
    minute = (total_seconds%t)/60
    seconds = (total_seconds%t)%60
    "%02d:%02d:%02d" % [hour,minute,seconds]
  end

end
