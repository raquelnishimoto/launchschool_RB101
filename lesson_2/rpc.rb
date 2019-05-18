VALID_CHOICE = %w(rock paper scissors)

loop do
  def display_result(player, computer)
    message =
      if compare_results(player, computer)
        'You won!'
      elsif compare_results(computer, player)
        'Computer won!'
      else
        'It\'s a tie!'
      end
    prompt(message)
  end

  def compare_results(player1, player2)
    (player1 == 'rock' && player2 == 'scissors') ||
      (player1 == 'paper' && player2 == 'rock') ||
      (player1 == 'scissors' && player2 == 'paper')
  end

  def prompt(message)
    Kernel.puts("=> #{message}")
  end

  choice = ''
  loop do
    prompt("Game start! Choose: rock, paper, scissors: ")
    choice = Kernel.gets().chomp()
    if VALID_CHOICE.include?(choice)
      break
    else
      prompt("#{choice} is not a valid option")
    end
  end

  computer_choice = VALID_CHOICE.sample()

  prompt("Your choice: #{choice} VS. Computer choice: #{computer_choice}")

  display_result(choice, computer_choice)

  prompt("Do you want to play again? -  if yes, input ('y')")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end
prompt('Thank you for playing! Good Bye!')
