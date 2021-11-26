def select_fruit(produce)
  produce_keys = produce.keys
  result = {}
  counter = 0

  loop do
    break if counter == produce_keys.length
    current_key = produce_keys[counter]

    if produce[current_key] == 'Fruit'
      result[current_key] = produce[current_key]
    end
    
    counter += 1
  end

  result
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

# puts produce.select { |key, value| value == 'Fruit'}
puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
