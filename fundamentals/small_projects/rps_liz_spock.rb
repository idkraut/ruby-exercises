VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
ABBREVIATIONS = ['r', 'p', 'sc', 'l', 'sp']

def prompt(message)
  puts "=> #{message}"
end

def unabbreviate(abbreviation)
  case abbreviation
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 'sc' then 'scissors'
  when 'l' then 'lizard'
  when 'sp' then 'Spock'
  end
end

def attack_move(victor, defeated)
  winning_moves = {
    'paper' => { 'rock' => 'covers', 'Spock' => 'disproves' },
    'scissors' => { 'paper' => 'cuts', 'lizard' => 'decapitates' },
    'lizard' => { 'paper' => 'eats', 'Spock' => 'poisons' },
    'Spock' => { 'scissors' => 'smashes', 'rock' => 'vaporizes' }
  }
  if victor == 'rock'
    'crushes'
  else
    winning_moves[victor][defeated]
  end
end

def player1_wins?(player1, player2)
  key_defeats_values = {
    'rock' => ['scissors', 'lizard'],
    'paper' => ['rock', 'Spock'],
    'scissors' => ['paper', 'lizard'],
    'lizard' => ['paper', 'Spock'],
    'Spock' => ['scissors', 'rock']
  }
  key_defeats_values[player1].include?(player2)
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

system("clear") || system("cls")
prompt "Welcome to ROCK-PAPER-SCISSORS-LIZARD-SPOCK!"
sleep 1.5
system("clear") || system("cls")
prompt "First to three wins!"
sleep 1.5

loop do
  player_score = 0
  computer_score = 0
  loop do
    player_choice = ''
    loop do
      system("clear") || system("cls")
      choices = <<-MSG
      Player: #{player_score}    Computer: #{computer_score}
      ---------------------------
      Choose one of the following:
      Rock: (Type 'r' or 'rock')
      Paper: (Type 'p' or 'paper')
      Scissors: (Type 'sc' or 'scissors')
      Lizard: (Type 'l' or 'lizard')
      Spock: (Type 'sp' or 'spock')
      ---------------------------
      MSG
      puts choices

      player_choice = gets.chomp.downcase
      if VALID_CHOICES.include?(player_choice)
        player_choice = player_choice.capitalize if player_choice == 'spock'
        break
      elsif ABBREVIATIONS.include?(player_choice)
        player_choice = unabbreviate(player_choice)
        break
      end
      prompt "Sorry, that's not a valid choice."
      sleep 1
    end

    computer_choice = VALID_CHOICES.sample
    computer_choice = computer_choice.capitalize if computer_choice == 'spock'

    prompt "You chose #{player_choice}. Computer chose #{computer_choice}."
    sleep 0.3
    puts "---------------------------"
    display_results(player_choice, computer_choice)

    puts "---------------------------"

    player_score += 1 if player1_wins?(player_choice, computer_choice)
    computer_score += 1 if player1_wins?(computer_choice, player_choice)

    
    if player_score == 3
      prompt "You are the grand champion!"
      break
    elsif computer_score == 3
      prompt "The computer is the grand champion!"
      break
    end

    prompt "Press enter to continue"
    gets
  end

  play_again = false
  loop do
    prompt "Do you want to play again? (y or n)"
    reply = gets.chomp.downcase
    break if reply.start_with?('n')
    if reply.start_with?('y')
      play_again = true
      break
    else prompt "Please choose y or n"
    end
  end

  break unless play_again
end
