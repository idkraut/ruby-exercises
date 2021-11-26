SECRET = "forage"
loop do
    puts "Please enter your password: "
    attempt = gets.chomp
    if attempt == SECRET
        puts "Welcome!"
        break
    else
        puts "Invalid password!"
    end
end