ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.each { |key, value| ages.delete(key) if value >= 100}
# ages.keep_if { |_, age| age == age}
ages.select! { |_,v| v == v}

p ages