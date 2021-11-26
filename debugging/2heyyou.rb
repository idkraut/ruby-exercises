def shout_out_to(name)
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end


# fix
def shout_out_to(name)
  puts 'HEY ' + name.upcase
end


# or
def shout_out_to(name)
  name = name.chars.each { |c| c.upcase! }.join
  puts 'HEY ' + name
end

shout_out_to('you') # expected: 'HEY YOU'