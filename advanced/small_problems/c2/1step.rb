def step(start_val, end_val, interval)
  current = start_val
  while current <= end_val
    yield(current)
    current += interval
  end
end

p step(1, 10, 3) { |value| puts "value = #{value}" }