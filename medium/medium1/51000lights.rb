=begin
Problem
  input: n, represents number of switches
  output: array containing the light numbers for lights that are on
Data:
  an array of booleans
  results array
Examples:
  only numbers in the array
  will be index + 1
Algorithm:
  initialize an array with n elements, all initialized to false


=end

def lights(switches)
  switches_array = [false] * switches
  count = 1

  loop do # track the rounds
    index = count - 1

    loop do # flip the switches for this round
      switches_array[index] = !switches_array[index]
      index += count
      break if index > switches - 1
    end

    count += 1
    break if count > switches
  end

  # find indices for on lights
  lights = []
  switches_array.each_with_index do |element, index|
    lights << index + 1 if element == true
  end

  lights
end

# LS

def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end


# Math way
def lights_array(number)
  lights_on = []
  1.upto(number) { |integer| lights_on << (integer ** 2) if (integer ** 2) < number}
  lights_on
end


p toggle_lights(53)
p lights(2000)
p lights_array(1000)