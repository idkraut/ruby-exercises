VALID_CHOICES = {
  'r' => 'rock',
  'p' => 'paper',
  'sc' => 'scissors',
  'l' => 'lizard',
  'sp' => 'spock'
}

WINNING_MOVES = {
  'rock' => { 'scissors' => 'crushes', 'lizard' => 'crushes' },
  'paper' => { 'rock' => 'covers', 'Spock' => 'disproves' },
  'scissors' => { 'paper' => 'cuts', 'lizard' => 'decapitates' },
  'lizard' => { 'paper' => 'eats', 'Spock' => 'poisons' },
  'Spock' => { 'scissors' => 'smashes', 'rock' => 'vaporizes' }
}

WINNING_SCORE = 3

def border
  "---------------------------"
end

def enter_to_continue
  puts "Press Enter to continue"
  gets
end

def prompt(message)
  puts "=> #{message}"
end

def display_welcome
  system("clear") || system("cls")
  prompt "Welcome to ROCK-PAPER-SCISSORS-LIZARD-SPOCK!"
  prompt "First to #{WINNING_SCORE} wins!"
  border()
  enter_to_continue()
end

def display_scoreboard(player, computer)
  puts "    Player: #{player}    Computer: #{computer}"
end

def display_choices
  choices = <<-MSG
    #{border}
    Choose one of the following:
    Rock: (Type 'r' or 'rock')
    Paper: (Type 'p' or 'paper')
    Scissors: (Type 'sc' or 'scissors')
    Lizard: (Type 'l' or 'lizard')
    Spock: (Type 'sp' or 'spock')
    #{border}
  MSG
  puts choices
end

def get_player_choice
  player_choice = ''
  loop do
    display_choices()
    player_choice = gets.chomp.downcase
    if VALID_CHOICES.values.include?(player_choice)
      break
    elsif VALID_CHOICES.include?(player_choice)
      player_choice = VALID_CHOICES[player_choice]
      break
    end
    prompt "Sorry, that's not a valid choice."
    sleep 1
  end
  player_choice = player_choice.capitalize if player_choice == 'spock'
  player_choice
end

def get_computer_choice
  computer_choice = VALID_CHOICES.values.sample
  computer_choice = computer_choice.capitalize if computer_choice == 'spock'
  computer_choice
end

def say_goodbye(victor)
  if victor == 'player'
    puts "Congrats on your victory! See you next time"
  else
    puts "Thanks for playing! Better luck next time!"
  end
end

def attack_move(victor, defeated)
  WINNING_MOVES[victor][defeated]
end

def player1_wins?(player1, player2)
  WINNING_MOVES[player1].include?(player2)
end

def display_results(player, computer)
  if player1_wins?(player, computer)
    prompt "#{player.capitalize} #{attack_move(player, computer)} #{computer}"
    prompt "You won!"
  elsif player1_wins?(computer, player)
    prompt "#{computer.capitalize} #{attack_move(computer, player)} #{player}"
    prompt "Computer won!"
  else
    prompt "It's a tie!"
  end
end

def update_score(player, computer, scores)
  scores[:player_score] += 1 if player1_wins?(player, computer)
  scores[:computer_score] += 1 if player1_wins?(computer, player)
end

def someone_won?(scores)
  scores.values.include?(3)
end

def display_grand_champion(scores)
  puts "You are the grand champion!" if scores[:player_score] == 3
  puts "The computer is the grand champion!" if scores[:computer_score] == 3
end

def play_again?
  reply = ''

  loop do
    prompt "Do you want to play again? (y or n)"
    reply = gets.chomp.downcase
    break if ['y', 'yes', 'n', 'no'].include?(reply)
    prompt "Please choose y or n"
  end

  ['y', 'yes'].include?(reply)
end

display_welcome()
loop do
  victor = ''
  scores = {
    player_score: 0,
    computer_score: 0
  }
  loop do
    system("clear") || system("cls")
    display_scoreboard(scores[:player_score], scores[:computer_score])

    player_choice = get_player_choice()
    computer_choice = get_computer_choice()

    prompt "You chose #{player_choice}. Computer chose #{computer_choice}."
    sleep 0.3
    puts border()
    display_results(player_choice, computer_choice)
    puts border()

    update_score(player_choice, computer_choice, scores)

    break if someone_won?(scores)

    enter_to_continue()
  end

  display_grand_champion(scores)

  unless play_again?()
    say_goodbye(victor)
    break
  end
end
