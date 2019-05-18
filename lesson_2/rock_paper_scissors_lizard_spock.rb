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
Game start! What's your choice:
-> 'r' for rock
-> 'p' for paper
-> 'sc' for scissors
-> 'sp' for spock
-> 'l' for lizard
MSG

@count_player_win = 0
@count_computer_win = 0

loop do
  loop do
    def display_result(player, computer)
      message = if compare_results(player, computer)
                  @count_player_win += 1
                  'You won!'
                elsif compare_results(computer, player)
                  @count_computer_win += 1
                  'Computer won!'
                else
                  'It\'s a tie!'
                end
      prompt(message)
    end

    def value_from_key(key)
      VALID_CHOICE[:"#{key}"]
    end

    def compare_results(player1, player2)
      VALUES_OF_WINNER[:"#{player1}"].include?(player2)
    end

    def prompt(message)
      Kernel.puts("=> #{message}")
    end

    choice = ''

    loop do
      prompt(PROMPT_MESSAGE)
      choice = Kernel.gets().chomp()
      if VALID_CHOICE.key?(:"#{choice}")
        break
      else
        prompt("#{choice} is not a valid option")
      end
    end

    computer_choice = %w(r p sc sp l).sample()

    prompt("You: #{value_from_key(choice)} X Computer: #{value_from_key(computer_choice)}")

    display_result(value_from_key(choice), value_from_key(computer_choice))
    prompt("=> You: #{@count_player_win} vs Computer: #{@count_computer_win}")
    break if @count_player_win > 4 || @count_computer_win > 4
  end

  prompt('YOU WIN!!!') if @count_player_win > 4
  prompt('COMPUTER WINS!!!') if @count_computer_win > 4
  prompt('*** GAME OVER ***')
  prompt("Do you want to play again? -  if yes, input ('y')")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end
prompt('Thank you for playing! Good Bye!')
