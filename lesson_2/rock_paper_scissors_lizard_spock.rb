# Game rock, paper, scissors, lizard, spock.
# Step 1: Rock -> rock smashes scissors, and rock smashes lizard.
# Step 2: Paper -> paper covers rock, and paper disproves Spock.
# Step 3: Scissors -> scissors cuts paper, and also decapitates lizard.
# Step 4: Lizard -> lizard eats paper and poisons Spock.
# Step 5: Spock -> Spock vaporizes rock and smashes scissors.
# Step 6: Go Play a Game!

VALID_CHOICE = { 'r': 'rock', 'p': 'paper', 'sc': 'scissors',
                 'sp': 'spock', 'l': 'lizard' }

VALUES_OF_WINNER = { rock: %w(scissors lizard), paper: %w(rock spock),
                     scissors: %w(paper lizard), spock: %(rock scissors),
                     lizard: %w(paper spock) }

PROMPT_MESSAGE = <<-MSG
Game start! You have to win 5 rounds in order to be winner.
What's your choice:
-> 'r' for rock
-> 'p' for paper
-> 'sc' for scissors
-> 'sp' for spock
-> 'l' for lizard
MSG

def value_from_key(key)
  VALID_CHOICE[:"#{key}"]
end

def compare_results(player1, player2)
  VALUES_OF_WINNER[:"#{player1}"].include?(player2)
end

def prompt(message)
  Kernel.puts("=> #{message}")
end

def retrieve_user_choice
  choice = ''
  loop do
    prompt(PROMPT_MESSAGE)
    choice = Kernel.gets().chomp().downcase
    if VALID_CHOICE.key?(:"#{choice}")
      system('clear')
      break
    else
      prompt("#{choice} is not a valid option")
    end
  end
  choice
end

def display_choices(player, computer)
  prompt(message(player, computer))
  prompt("You: #{player} X Computer: #{computer}")
end

def message(player, computer)
  if compare_results(player, computer)
    'You won!'
  elsif compare_results(computer, player)
    'Computer won!'
  else
    'It\'s a tie!'
  end
end

def display_score(player_win, computer_win)
  prompt("You: #{player_win} vs Computer: #{computer_win}")
  puts('--------------------------------------')
end

def valid_play_again_answer?(input)
  input.downcase.eql?('y') || input.downcase.eql?('yes')
end

def retrieve_play_again_answer
  prompt("Do you want to play again? -  if yes, input ('y')")
  answer = Kernel.gets().chomp()
  valid_play_again_answer?(answer)
end

def display_match_won(player_score, computer_score)
  prompt('YOU WIN!!!') if player_score == 5
  prompt('COMPUTER WINS!!!') if computer_score == 5
  prompt('*** GAME OVER ***')
end

def match_end?(player_score, computer_score)
  player_score == 5 || computer_score == 5
end

loop do
  count_player_win = 0
  count_computer_win = 0
  count_matches = 0
  loop do
    value_player_choice = value_from_key(retrieve_user_choice)
    computer_choice = %w(r p sc sp l).sample()
    value_computer_choice = value_from_key(computer_choice)

    count_matches += 1
    prompt("Matches played = #{count_matches}")

    display_choices(value_player_choice, value_computer_choice)

    if message(value_player_choice, value_computer_choice) == 'You won!'
      count_player_win += 1
    elsif message(value_player_choice, value_computer_choice) == 'Computer won!'
      count_computer_win += 1
    end
    display_score(count_player_win, count_computer_win)

    if match_end?(count_player_win, count_computer_win)
      display_match_won(count_player_win, count_computer_win)
      break
    end
  end
  break unless retrieve_play_again_answer
end

prompt('Thank you for playing! Good Bye!')
