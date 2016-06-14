
#ciao

def ftoc(ftemp)
  celcius = (ftemp-32)/1.8
  celcius.round(2)
end

def ctof(ctemp)
  farenheit = ctemp * 1.8 + 32
  farenheit.round(2)
end