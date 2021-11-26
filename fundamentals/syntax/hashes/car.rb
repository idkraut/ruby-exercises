# car = { 
#     type: 'sedan',
#     color: 'blue',
#     mileage: 80_000
#     }

# car[:year] = 2003
# car.delete(:mileage)
# puts car[:color]

# numbers = {
#     high:   100,
#     medium: 50,
#     low:    10
#   }

# numbers.each { |k, v| puts "A #{k} number is #{v}" }

# half_numbers = numbers.map { |k, v| v / 2 }
# p half_numbers

# low_numbers = numbers.select! { |k,v| v < 25 }
# p low_numbers
# p numbers

# car = { 
#     type: 'sedan',
#     color: 'blue',
#     mileage: 80_000
#     }

# truck = {
#     type: 'pickup',
#     color: 'red',
#     year: 1998
# }

# vehicles = {car: car, truck: truck}
# puts vehicles

car = [ 
    [type: 'sedan'],
    [color: 'blue'],
    [mileage: 80_000]
]

p car