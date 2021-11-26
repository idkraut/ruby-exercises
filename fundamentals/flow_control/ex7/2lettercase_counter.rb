# def letter_case_count(string)
#   counts = Hash.new(0)
#   counts[:lowercase] = string.count('a-z')
#   counts[:uppercase] = string.count('A-Z')
#   counts[:neither] = string.size - counts[:lowercase] - counts[:uppercase]
#   counts
# end

def letter_case_count(string)
  counts = Hash.new(0)
  counts[:lowercase] = string.count('a-z')
  counts[:uppercase] = string.count('A-Z')
  counts[:neither] = string.count('^a-zA-Z')
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }