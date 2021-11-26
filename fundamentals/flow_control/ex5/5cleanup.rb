ALPHABETIC_CHARS = ("a".."z")

def cleanup(string)
  clean_string = ''
  string.each_char do |char|
    if ALPHABETIC_CHARS.include?(char)
      clean_string << char
    else
      clean_string << ' ' unless clean_string[-1] == ' '
    end
  end
  clean_string
end



p cleanup("---what's my +*& line?") == ' what s my line '
