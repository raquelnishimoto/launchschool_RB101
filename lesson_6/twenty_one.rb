DECK =
  [['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6']] +
  [['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'J']] +
  [['C', 'Q'], ['C', 'K'], ['C', 'A']] + # clubs
  [['D', '2'], ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6']] +
  [['D', '7'], ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J']] +
  [['D', 'Q'], ['D', 'K'], ['D', 'A']] + # diamonds
  [['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'], ['H', '6']] +
  [['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'], ['H', 'J']] +
  [['H', 'Q'], ['H', 'K'], ['H', 'A']] + # hearts
  [['S', '2'], ['S', '3'], ['S', '4'], ['S', '5'], ['S', '6']] +
  [['S', '7'], ['S', '8'], ['S', '9'], ['S', '10'], ['S', 'J']] +
  [['S', 'Q'], ['S', 'K'], ['S', 'A']] # spades

DECK_VALUE = { '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
               '7' => 7, '8' => 8, '9' => 9, '10' => 10,
               'Jack' => 10, 'Queen' => 10, 'King' => 10,
               'Ace' => 11 }

DECK_CARDS = { '2' => '2', '3' => '3', '4' => '4', '5' => '5',
               '6' => '6', '7' => '7', '8' => '8', '9' => '9',
               '10' => '10', 'J' => 'Jack', 'Q' => 'Queen',
               'K' => 'King', 'A' => 'Ace' }

DECK_TYPES = { 'C' => 'Club', 'D' => 'Diamonds',
               'H' => 'Hearts', 'S' => 'Spades' }

HIT = 'h'
STAY = 's'
BUSTED_VALUE = 21
DEALER_LIMIT = 17
SCORE_TO_WIN = 5

def prompt(message)
  puts "=> #{message}"
end

TO_ACTION_MESSAGE = <<-MSG
==================================================================
Do you want another card ('hit') or sit on what you have ('stay')?
-> Select 'h' for 'hit' or 's' for 'stay'
MSG

def initialise_deck(player, player_total, dealer)
  prompt("Dealer has: #{face_up_cards(dealer, false)}")
  prompt("You have: #{face_up_cards(player)}, for a total of #{player_total}.")
end

def display_score(game_round, player_score, dealer_score)
  system 'clear'
  prompt("Score #{SCORE_TO_WIN} rounds to win game.")
  prompt("Round: #{game_round}.")
  prompt("Player #{player_score} Vs. Delear #{dealer_score}.")
  puts("------------------------------------------------------")
end

def shuffle_cards(qty)
  DECK.sample(qty)
end

def deal_cards(qty)
  dealt_cards = []
  cards = shuffle_cards(qty).map { |card| card }
  cards.map do |type, rank|
    dealt_cards << DECK_TYPES.values_at(type)
    dealt_cards << DECK_CARDS.values_at(rank)
  end
  dealt_cards
end

def get_join_array(array)
  array = array.flatten
  iteration = array.size / 2
  type = 0
  value = 1
  cards = []

  iteration.times do |_|
    cards << array[type..value].join('-')
    type += 2
    value += 2
  end
  cards
end

def join(array, limit = '; ', word = 'and')
  cards = get_join_array(array)

  case cards.size
  when 0 then ''
  when 1 then cards[0]
  when 2 then cards.join(" #{word} ")
  else
    cards[-1] = "#{word} #{cards.last}"
    cards.join(limit)
  end
end

def face_up_cards(recipient, player_turn = true)
  if player_turn == true
    join(recipient)
  else
    "#{join(recipient[0..1])} and unknown card"
  end
end

def show_all_cards(recipient, cards, total)
  prompt("#{recipient} shows: #{face_up_cards(cards)} with total of: #{total}.")
end

def sum_cards(player)
  player = player.flatten

  select_value = player.each_index.select(&:odd?)
  cards_value = player.values_at(*select_value).map do |card|
    DECK_VALUE.values_at(card)[0]
  end
  sum = cards_value.sum

  if player.any?('Ace') && sum > BUSTED_VALUE
    sum -= 10
  else
    sum
  end
  sum
end

def detect_result(player_total, dealer_total)
  if dealer_total > BUSTED_VALUE
    :dealer_busted
  elsif player_total > BUSTED_VALUE
    :player_busted
  elsif dealer_total > player_total
    :dealer_wins
  elsif player_total > dealer_total
    :player_wins
  else
    :tie
  end
end

def busted?(recipient_total)
  recipient_total > BUSTED_VALUE
end

def display_result(player_total, dealer_total)
  result = detect_result(player_total, dealer_total)

  case result
  when :dealer_busted
    prompt("Dealer busted! Player wins this round!")
  when :player_busted
    prompt("You busted! Dealer wins this round")
  when :player_wins
    prompt("Player wins this round!")
  when :dealer_wins
    prompt("Dealer wins this round!")
  when :tie
    prompt("It's a push, no one wins!")
  end
  prompt("Score: dealer #{dealer_total} Vs. player #{player_total}")
end

def valid?(input, option1, option2)
  input.downcase == option1 || input.downcase == option2
end

def valid_exit?(answer)
  valid?(answer, 'n', 'no')
end

def valid_replay?(answer)
  valid?(answer, 'y', 'yes')
end

def valid_stay?(answer)
  valid?(answer, 's', 'stay')
end

def valid_hit?(answer)
  valid?(answer, 'h', 'hit')
end

def invalid_answer
  prompt("Invalid answer!")
end

def play_again?
  answer = nil
  loop do
    prompt("Play 'twenty-one' again - 'y' or 'n'?\r")
    answer = gets.chomp
    break if valid_exit?(answer) || valid_replay?(answer)
    invalid_answer
  end
  valid_replay?(answer)
end

def stand?(dealer_total)
  dealer_total >= DEALER_LIMIT
end

def continue_game?
  prompt("Press any key to continue game:\r")
  gets
end

def game_over?(player_score, dealer_score)
  player_score >= SCORE_TO_WIN || dealer_score >= SCORE_TO_WIN
end

def diplay_winner(player_score, dealer_score)
  if player_score >= SCORE_TO_WIN
    prompt("Player wins game!")
  elsif dealer_score >= SCORE_TO_WIN
    prompt("Dealer wins game!")
  end
end

loop do
  player_score = 0
  dealer_score = 0
  game_round = 1

  loop do
    player = deal_cards(2)
    dealer = deal_cards(2)
    player_total = sum_cards(player)
    dealer_total = sum_cards(dealer)

    display_score(game_round, player_score, dealer_score)
    initialise_deck(player, player_total, dealer)

    answer = nil

    loop do
      loop do
        puts(TO_ACTION_MESSAGE)
        answer = gets.chomp
        break if valid_hit?(answer) || valid_stay?(answer)
        invalid_answer
      end
      break if valid_stay?(answer)
      player << deal_cards(1)
      player_total = sum_cards(player)
      system 'clear'
      prompt("Dealer has: #{face_up_cards(dealer, false)}.")
      show_all_cards("You", player, player_total)
      break if busted?(player_total)
    end

    if busted?(player_total)
      display_result(player_total, dealer_total)
      dealer_score += 1
      game_round += 1
      continue_game?
      break if game_over?(player_score, dealer_score)
    else
      system 'clear'
      prompt("You stand at #{player_total}. It's the dealer's turn!")
    end

    if valid_stay?(answer)
      show_all_cards("Dealer", dealer, dealer_total)
      loop do
        break if stand?(dealer_total)
        prompt("Dealer decides to hit and take another card.")
        continue_game?
        dealer << deal_cards(1)
        dealer_total = sum_cards(dealer)
        show_all_cards("Dealer", dealer, dealer_total)
        break if busted?(dealer_total)
      end

      if busted?(dealer_total)
        display_result(player_total, dealer_total)
        player_score += 1
        continue_game?
        break if game_over?(player_score, dealer_score)
      else
        prompt("Dealer will stand! It's time to reveal winner.")
        continue_game?
        display_result(player_total, dealer_total)
        result = detect_result(player_total, dealer_total)
        player_score += 1 if result == :player_wins
        dealer_score += 1 if result == :dealer_wins
        continue_game?
      end
      game_round += 1
    end
    break if game_over?(player_score, dealer_score)
  end
  display_score(game_round, player_score, dealer_score)
  diplay_winner(player_score, dealer_score)
  break unless play_again?
end

prompt("Thank you for playing 'twenty-one! See you next time.")
