class Move
  attr_reader :value

  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def >(other_move)
    return false if @value == other_move.value
    self.class::WINNING_MOVES.key?(other_move.value)
  end

  def <(other_move)
    return false if @value == other_move.value
    !self.class::WINNING_MOVES.key?(other_move.value)
  end

  def to_s
    @value
  end
end

class Rock < Move
  WINNING_MOVES = { 'scissors' => 'crushes', 'lizard' => 'crushes' }
end

class Paper < Move
  WINNING_MOVES = { 'rock' => 'covers', 'spock' => 'disproves' }
end

class Scissors < Move
  WINNING_MOVES = { 'paper' => 'cuts', 'lizard' => 'decapitates' }
end

class Lizard < Move
  WINNING_MOVES = { 'paper' => 'eats', 'spock' => 'poisons' }
end

class Spock < Move
  WINNING_MOVES = { 'scissors' => 'smashes', 'rock' => 'vaporizes' }
end

class History
  attr_accessor :moves

  def initialize
    @moves = []
  end

  def update(move)
    moves << move
  end
end

class Player
  attr_accessor :move, :name, :current_score, :history

  def initialize
    set_name
    @current_score = 0
    @history = History.new
  end

  private

  def convert_to_move_object(choice)
    case choice
    when 'rock' then Rock.new(choice)
    when 'paper' then Paper.new(choice)
    when 'scissors' then Scissors.new(choice)
    when 'lizard' then Lizard.new(choice)
    when 'spock' then Spock.new(choice)
    end
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.strip.empty?
      puts "Sorry, must enter a valid name."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "You must choose: rock, paper, scissors, lizard, spock"
      choice = gets.chomp
      choice = format_choice(choice)
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = convert_to_move_object(choice)
  end

  private

  def format_choice(choice)
    choice = choice.downcase
    case choice
    when 'r', 'rock' then 'rock'
    when 'p', 'paper' then 'paper'
    when 'sc', 'scissors' then 'scissors'
    when 'l', 'lizard' then 'lizard'
    when 'sp', 'spock' then 'spock'
    else
      choice
    end
  end
end

class Computer < Player
  attr_reader :personality

  def initialize
    super
    @personality = create_robot(name)
  end

  def set_name
    self.name = ['WALL-E', 'GLaDOS', 'Data', 'Crow T.Robot', 'One-One'].sample
  end

  def choose
    choice = personality.choice
    self.move = convert_to_move_object(choice)
  end

  private

  def create_robot(name)
    case name
    when 'WALL-E' then Walle.new
    when 'GLaDOS' then Glados.new
    when 'Crow T.Robot' then Crow.new
    when 'One-One' then OneOne.new
    when 'Data' then TNGData.new
    end
  end
end

class Walle
  def choice
    Move::VALUES.sample
  end
end

class Glados
  def choice
    ['lizard', 'paper'].sample
  end
end

class Crow
  def choice
    num = rand(101)
    if num < 33
      ['rock', 'paper', 'scissors'].sample
    else
      ['lizard', 'spock'].sample
    end
  end
end

class OneOne
  def choice
    ['paper', 'scissors'].sample
  end
end

class TNGData
  def choice
    'spock'
  end
end

module Displayable
  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    margin
    display_rules
  end

  def display_rules
    puts "The rules are simple."
    puts "Scissors cuts Paper covers Rock crushes
          Lizard poisons Spock smashes Scissors
          decapitates Lizard eats Paper disproves
          Spock vaporizes Rock crushes Scissors."
    margin
    puts "First to #{self.class::CHAMP_SCORE} wins!"
    margin
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Good bye!"
  end

  def display_winner
    if determine_winner
      display_winning_move
      puts "#{determine_winner.name} won!"
    else
      display_stalemate
      puts "It's a tie!"
    end
    margin
  end

  def display_winning_move
    winner = determine_winner
    loser = determine_loser
    verb = winner.move.class::WINNING_MOVES[loser.move.value]
    margin
    puts "#{winner.move} #{verb} #{loser.move}"
  end

  def display_stalemate
    margin
    puts "An unstoppable #{human.move} meets an immovable #{computer.move}"
  end

  def display_scores
    puts "#{human.name}: #{human.current_score}"
    puts "#{computer.name}: #{computer.current_score}"
    margin
  end

  def display_moves
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
  end

  def display_champion
    display_scores
    if human.current_score == self.class::CHAMP_SCORE
      puts "#{human.name} is the RPS champion!!"
    else
      puts "#{computer.name} is the RPS champion!!"
    end
  end

  def clear_screen
    system 'clear' || 'cls'
  end

  def display_match_history
    matches = human_moves.zip(computer_moves)
    clear_screen
    puts "Match History!"
    puts "#{human.name} on the left, #{computer.name} on the right"
    margin
    matches.each_with_index do |match, index|
      puts "#{index + 1}: #{match[0]} vs #{match[1]}"
    end
    margin
  end

  def margin
    puts ""
  end
end

class RPSGame
  include Displayable
  attr_accessor :human, :computer

  CHAMP_SCORE = 10

  def initialize
    clear_screen
    display_welcome_message
    @human = Human.new
    @computer = Computer.new
  end

  def play
    main_game
    display_match_history if see_history?
    display_goodbye_message
  end

  private

  def determine_winner
    if human.move.value == computer.move.value
      nil
    elsif human.move > computer.move
      human
    elsif human.move < computer.move
      computer
    end
  end

  def determine_loser
    determine_winner == human ? computer : human
  end

  def champion?
    human.current_score == CHAMP_SCORE || computer.current_score == CHAMP_SCORE
  end

  def update_scores
    return unless determine_winner
    determine_winner.current_score += 1
  end

  def update_history
    human.history.update(human.move.value)
    computer.history.update(computer.move.value)
  end

  def human_moves
    human.history.moves
  end

  def computer_moves
    computer.history.moves
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
      answer = format_yes_or_no(answer)
      break if ['y', 'n'].include?(answer)
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def format_yes_or_no(answer)
    answer = answer.downcase
    case answer
    when 'y', 'yes' then 'y'
    when 'n', 'no' then 'n'
    else
      answer
    end
  end

  def see_history?
    answer = nil
    loop do
      puts "Would you like to see the match history? (y/n)"
      answer = gets.chomp
      answer = format_yes_or_no(answer)
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end
    answer == 'y'
  end

  def round_actions
    display_scores
    human.choose
    clear_screen
    computer.choose
  end

  def round_results
    display_moves
    update_scores
    update_history
    display_winner
  end

  def championship_round
    clear_screen
    loop do
      round_actions
      round_results
      break if champion?
    end
  end

  def main_game
    loop do
      reset_scores
      championship_round
      display_champion
      break unless play_again?
    end
  end
end

RPSGame.new.play
