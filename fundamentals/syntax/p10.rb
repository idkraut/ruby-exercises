arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

p (arr.map do |hash|
  hash.map { |key, value| [key, value + 1] }.to_h
end)

p (arr.map do |hash|
    incremented_hash = {}
    hash.each do |k, v|
      incremented_hash[k] = v + 1
    end
      incremented_hash
  end)

# h = {d: 4, e: 5, f: 6}

# p h.map { | k,v| v + 2}