def penultimate(string)
  string.split[-2]
end

# further exp
def penultimate(str)
  return '' if str.class != String || str.empty?
  str.split[str.split.size/2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'