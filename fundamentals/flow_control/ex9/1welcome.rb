# def greetings(name_arr, job_hash)
#   name = name_arr.join(' ')
#   title = job_hash[:title]
#   occupation = job_hash[:occupation]

#   puts "Hello, #{name}! Nice to have a #{title} #{occupation} around."
# end

# LS
def greetings(name, status)
  "Hello, #{name.join(' ')}! Nice to have a #{status[:title]} #{status[:occupation]} around!"
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
