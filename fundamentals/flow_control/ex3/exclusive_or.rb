# def xor?(cond1, cond2)
#   if cond1 && !cond2 
#     return true
#   elsif cond2 && !cond1 
#     return true
#   else
#     return false
#   end
# end


def xor?(value1, value2)
  return true if value1 && !value2
  return true if value1 && !value1
  false
end

def xor?(value1, value2)
  !!((value1 && !value2) || (value2 && !value1))
end

