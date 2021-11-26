# get loan amount; save value
    # verify in dollars
# get APR and save
    # verify right decimal format and valid number
# get loan duration
    # in years
# convert apr to decimal
# convert apr to monthly
# convert loan duration to months
# calculate using formula
# print monthly payment
# prompt to repeat or exit

def prompt(message)
  puts("=> #{message}")
end

prompt("Welcome to the mortgage calculator!")

loop do
  loan_amount = ''
  loop do
    prompt("What is the loan amount?")
    loan_amount = gets.chomp
  
    if loan_amount.empty? || loan_amount.to_f < 0
      prompt("Must enter a positive number")
    else
      break
    end
  end
  
  apr = ''
  loop do
    prompt("What is the APR? Please enter as a number, eg 5 for 5%")
    apr = gets.chomp
  
    if apr.empty? || apr.to_f < 0
      prompt("Must enter a positive number")
    else
      break
    end
  end
  
  loan_duration = ''
  loop do
    prompt("What is the loan duration (in years)?")
    loan_duration = gets.chomp
  
    if loan_duration.empty? || loan_duration.to_f < 0
      prompt("Must enter a positive number")
    else
      break
    end
  end
  
  
  annual_interest_rate = apr.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = loan_duration.to_i * 12
  monthly_payment = loan_amount.to_f * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-months)))
  
  prompt("Your monthly payment is $%.2f" %monthly_payment)
  # puts annual_interest_rate, monthly_interest_rate, months, monthly_payment

  prompt("Do another calculation?")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end


