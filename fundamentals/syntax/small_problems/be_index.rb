flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.index { |name| name[0, 2] == "Be" }


# be_names = flintstones.select { |name| name[0, 2] == "Be" }
# p flintstones.index(be_names[0])


# index = nil
# counter = 0
# loop do
#   break if counter == flintstones.length
#   if flintstones[counter][(0..1)] == "Be"
#     index = counter
#     break
#   end
#   counter +=1
# end
# p index