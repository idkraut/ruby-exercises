class GuessingGame

  attr_accessor :guess_count, :current_guess
  attr_reader :number, :min, :max, :range

  def initialize(min, max)
    @min = min.to_i
    @max = max.to_i
    @range = (min..max)
    @number = rand(@range)
    @guess_count = Math.log2(@range.size).to_i + 1
    @current_guess = nil
  end

  def display_guesses_remaining
    puts "You have #{guess_count} guesses remaining."
  end

  def player_chooses
    guess = nil
    loop do
      print "Enter a number between #{min} and #{max}: "
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
    guess.to_i.to_s == guess && range.cover?(guess.to_i)
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


# LS
class GuessingGame
  RESULT_OF_GUESS_MESSAGE = {
    high:  "Your number is too high.",
    low:   "Your number is too low.",
    match: "That's the number!"
  }.freeze

  WIN_OR_LOSE = {
    high:  :lose,
    low:   :lose,
    match: :win
  }.freeze

  RESULT_OF_GAME_MESSAGE = {
    win:  "You won!",
    lose: "You have no more guesses. You lost!"
  }.freeze

  def initialize(low, high)
    @range = low..high
    @max_guesses = Math.log2(high - low + 1).to_i + 1
    @secret_number = nil
  end

  def play
    reset
    game_result = play_game
    display_game_end_message(game_result)
  end

  private

  def reset
    @secret_number = rand(@range)
  end

  def play_game
    result = nil
    @max_guesses.downto(1) do |remaining_guesses|
      display_guesses_remaining(remaining_guesses)
      result = check_guess(obtain_one_guess)
      puts RESULT_OF_GUESS_MESSAGE[result]
      break if result == :match
    end
    WIN_OR_LOSE[result]
  end

  def display_guesses_remaining(remaining)
    puts
    if remaining == 1
      puts 'You have 1 guess remaining.'
    else
      puts "You have #{remaining} guesses remaining."
    end
  end

  def obtain_one_guess
    loop do
      print "Enter a number between #{@range.first} and #{@range.last}: "
      guess = gets.chomp.to_i
      return guess if @range.cover?(guess)
      print "Invalid guess. "
    end
  end

  def check_guess(guess_value)
    return :match if guess_value == @secret_number
    return :low if guess_value < @secret_number
    :high
  end

  def display_game_end_message(result)
    puts "", RESULT_OF_GAME_MESSAGE[result]
  end
end

game = GuessingGame.new(501, 1500)
game.play
