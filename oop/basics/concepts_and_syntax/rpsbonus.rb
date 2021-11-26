require 'pry'

class Move
  attr_reader :value
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  WINNING_MOVES = {
    'rock' => { 'scissors' => 'crushes', 'lizard' => 'crushes' },
    'paper' => { 'rock' => 'covers', 'spock' => 'disproves' },
    'scissors' => { 'paper' => 'cuts', 'lizard' => 'decapitates' },
    'lizard' => { 'paper' => 'eats', 'spock' => 'poisons' },
    'spock' => { 'scissors' => 'smashes', 'rock' => 'vaporizes' }
  }

  def initialize(value)
    @value = value
  end

  def >(other_move)
    # binding.pry
    return false if @value == other_move.value
    WINNING_MOVES[@value].keys.include?(other_move.value)
  end

  def <(other_move)
    # binding.pry
    return false if @value == other_move.value
    !WINNING_MOVES[@value].keys.include?(other_move.value)
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :current_score

  def initialize
    set_name
    @current_score = 0
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose from the following: "
      puts ""
      puts Move::VALUES
      puts ""
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'WALL-E', 'GLaDOS', 'Crow T.Robot'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  CHAMP_SCORE = 2

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_winner
    if determine_winner
      puts "#{determine_winner.name} won!"
    else
      puts "It's a tie!"
    end
    puts ""
  end

  def determine_winner
    # binding.pry
    if human.move.value == computer.move.value
      nil
    elsif human.move > computer.move
      human
    elsif human.move < computer.move
      computer
    end
  end

  def update_scores
    if determine_winner
      determine_winner.current_score += 1
    end
  end

  def display_scores
    puts "#{human.name}: #{human.current_score}"
    puts "#{computer.name}: #{computer.current_score}"
    puts ""
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def champion?
    human.current_score == CHAMP_SCORE || computer.current_score == CHAMP_SCORE
  end

  def display_champion
    display_scores
    if human.current_score == CHAMP_SCORE
      puts "#{human.name} is the RPS champion!!"
    else
      puts "#{computer.name} is the RPS champion!!"
    end
  end

  def clear_screen
    system 'clear' || 'cls'
  end

  def championship
    clear_screen
    loop do
      display_scores
      human.choose
      clear_screen
      computer.choose
      display_moves
      update_scores
      display_winner
      break if champion?
    end
  end

  def reset_scores
    human.current_score = 0
    computer.current_score = 0
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def main_game
    loop do
      reset_scores
      championship
      display_champion
      break unless play_again?
    end
  end

  def play
    clear_screen
    display_welcome_message
    main_game
    display_goodbye_message
  end
end

RPSGame.new.play
