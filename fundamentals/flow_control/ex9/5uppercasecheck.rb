UPPERCASE = ("A".."Z")

def uppercase?(string)
  all_caps = true
  string.chars.each do |char|
    if UPPERCASE.include?(char.upcase)
      all_caps = false if !UPPERCASE.include?(char)
    end
  end
  all_caps
end

# LS
def uppercase?(string)
  string == string.upcase
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true