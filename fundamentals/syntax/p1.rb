arr = ['10', '11', '9', '7', '8']

p arr.sort { |a, b| b.to_i <=> a.to_i }

# p arr.map { |x| x.to_i }.sort { |a, b| b <=> a}.map {|x| x.to_s }
