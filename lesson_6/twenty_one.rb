require 'io/console'

DECK_RANKS = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)

DECK_TYPES = %w(Club Diamonds Hearts Spades)

HIT = 'h'
STAY = 's'
THRESHOLD_TO_BUST = 21
DEALER_LIMIT = 17
SCORE_TO_WIN = 5

def prompt(message)
  puts "=> #{message}"
end

OPTIONS_MESSAGE = <<-MSG
==================================================================
Do you want another card ('hit') or sit on what you have ('stay')?
-> Select 'h' for 'hit' or 's' for 'stay'
MSG

def intialise_deck
  DECK_TYPES.product(DECK_RANKS).shuffle
end

def display_score(game_round, player_score, dealer_score)
  system 'clear'
  prompt("Score #{SCORE_TO_WIN} rounds to win game.")
  prompt("Round: #{game_round}.")
  prompt("Player #{player_score} Vs. Delear #{dealer_score}.")
  puts '------------------------------------------------------'
end

def deal_cards(qty, deck)
  dealt_cards = []
  qty.times do |_|
    dealt_cards << deck.pop
  end
  dealt_cards
end

def join_with_hyphen(array)
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
  cards = join_with_hyphen(array)

  case cards.size
  when 0 then ''
  when 1 then cards[0]
  when 2 then cards.join(" #{word} ")
  else
    cards[-1] = "#{word} #{cards.last}"
    cards.join(limit)
  end
end

def show_all_cards(recipient, cards, total)
  prompt("#{recipient} shows: #{join(cards)} with total of: #{total}.")
end

def total(player)
  sum = 0
  player = player.flatten

  select_value = player.each_index.select(&:odd?)
  player.values_at(*select_value).each do |rank|
    sum += if rank == 'Ace'
             11
           elsif rank.to_i == 0
             10
           else
             rank.to_i
           end
  end

  player.any?('Ace') && sum > THRESHOLD_TO_BUST ? sum -= 10 : sum
end

def detect_result(player_total, dealer_total)
  if dealer_total > THRESHOLD_TO_BUST
    :dealer_busted
  elsif player_total > THRESHOLD_TO_BUST
    :player_busted
  elsif dealer_total > player_total
    :dealer_win
  elsif player_total > dealer_total
    :player_win
  else
    :tie
  end
end

def busted?(recipient_total)
  recipient_total > THRESHOLD_TO_BUST
end

def display_result(player_total, dealer_total)
  result = detect_result(player_total, dealer_total)

  case result
  when :dealer_busted
    prompt("Dealer busted! Player wins this round!")
  when :player_busted
    prompt("You busted! Dealer wins this round")
  when :player_win
    prompt("Player wins this round!")
  when :dealer_win
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
  prompt("Press any key to continue game:")
  STDIN.getch
  puts '------------------------------------------------------'
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
    deck = intialise_deck
    player_cards = deal_cards(2, deck)
    dealer_cards = deal_cards(2, deck)
    player_total = total(player_cards)
    dealer_total = total(dealer_cards)

    display_score(game_round, player_score, dealer_score)
    prompt("Dealer has: #{join(dealer_cards[0])} and unknown card")
    prompt("You have: #{join(player_cards)}, for a total of #{player_total}.")

    answer = nil

    loop do
      loop do
        puts(OPTIONS_MESSAGE)
        answer = gets.chomp
        break if valid_hit?(answer) || valid_stay?(answer)
        invalid_answer
      end
      break if valid_stay?(answer)
      player_cards << deal_cards(1, deck)
      player_total = total(player_cards)
      system 'clear'
      prompt("Dealer has: #{join(dealer_cards[0])} and unknown card")
      show_all_cards("You", player_cards, player_total)
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
      show_all_cards("Dealer", dealer_cards, dealer_total)
      loop do
        break if stand?(dealer_total)
        prompt("Dealer decides to hit and take another card.")
        continue_game?
        dealer_cards << deal_cards(1, deck)
        dealer_total = total(dealer_cards)
        show_all_cards("Dealer", dealer_cards, dealer_total)
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
        player_score += 1 if result == :player_win
        dealer_score += 1 if result == :dealer_win
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
