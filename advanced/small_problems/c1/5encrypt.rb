FIRST_HALF = ("A".."M").to_a + ("a".."m").to_a
SECOND_HALF = ("N".."Z").to_a + ("n".."z").to_a

names = File.foreach('names.txt').map { |line| line.split(' ') }


def print_decryption(names)
  decrypted = decrypt(names)
  decrypted.each do |name|
    puts name.join(' ')
  end
end

def decrypt(names)
  decrypted = names.map do |name_array|
    name_array.map do |name|
      convert_name(name)
    end
  end
  decrypted
end

def convert_name(name)
  name.chars.map do |char|
    convert_char(char)
  end.join
end

def convert_char(char)
  if FIRST_HALF.include?(char)
    (char.ord + 13).chr
  elsif SECOND_HALF.include?(char)
    (char.ord - 13).chr
  else
    char
  end
end

print_decryption(names)

# p convert_name("ABCN")
# p convert_char("A")
# p convert_char("Z")
# p convert_char("a")
# p convert_char("z")
# p convert_char("b")
# p convert_char("Y")
