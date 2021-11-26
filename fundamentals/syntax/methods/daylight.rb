daylight = [true, false].sample

def daytime(daylight)
    if daylight
        puts "It's daytime!"
    else
        puts "It's nighttime!"
    end
end

daytime(daylight)
