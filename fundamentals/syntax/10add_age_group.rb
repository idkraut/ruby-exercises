munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details["age"]
  when (0...18)
    details["age_group"] = "kid"
  when (18...64)
    details["age_group"] = "adult"
  else 
    details["age_group"] = "senior"
  end
end

p munsters

# def age_group(age)
#   if age >= 0 && age <= 17
#     return "kid"
#   elsif age >= 18 && age <= 64
#     return "adult"
#   else
#     return "senior"
#   end
# end

# result = munsters.each { |_, info| info["age_group"] = age_group(info["age"])}

# puts result

