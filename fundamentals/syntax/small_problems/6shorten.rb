flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name = name[0, 3]}
p flintstones