class GuessingGame
  MAX_GUESSES = 7

  attr_accessor :guess_count, :current_guess
  attr_reader :number

  def initialize
    @number = rand(1..100)
    @guess_count = MAX_GUESSES
    @current_guess = nil
  end

  def display_guesses_remaining
    puts "You have #{guess_count} guesses remaining."
  end

  def player_chooses
    guess = nil
    loop do
      print "Enter a number between 1 and 100: "
      guess = gets.chomp
      break if valid_guess?(guess)
      puts "Sorry, that's not a valid guess"
    end
    self.current_guess = guess.to_i
    increment_guess_count
  end

  def increment_guess_count
    self.guess_count -= 1
  end

  def valid_guess?(guess)
    guess.to_i.to_s == guess && (1..100).cover?(guess.to_i)
  end

  def display_guess_result
    result = compare_guess
    if correct_guess?
      puts "That's the number!"
    else
      puts "Your guess is too #{result}"
    end
  end

  def compare_guess
    if current_guess > number
      'high'
    else
      'low'
    end
  end

  def correct_guess?
    current_guess == number
  end

  def out_of_guesses?
    guess_count == 0
  end

  def display_results_message
    puts ""
    if correct_guess?
      puts "You won!"
    else
      puts "You have no more guesses. You lost!"
    end
  end

  def play
    loop do
      display_guesses_remaining
      player_chooses
      display_guess_result
      break if correct_guess? || out_of_guesses?
    end
    display_results_message
  end
end

game = GuessingGame.new
game.play
