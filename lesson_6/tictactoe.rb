FIRST_MOVE = 'choose'
ROUNDS_TO_WIN = 5
MID_SQUARE = 5
PLAYER = 'p'
COMPUTER = 'c'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_OPTIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]] # diagonal

FIRST_MOVE_MESSAGE = <<-MSG
Choose who moves first:
* 'p' for player
* 'c' for computer
MSG

def prompt_msg(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
def display_board(brd, player_score, computer_score)
  system 'clear'
  prompt_msg("You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}")
  prompt_msg("Win #{ROUNDS_TO_WIN} matches to win the game!")
  prompt_msg("Score: Player #{player_score} Vs. Computer #{computer_score}")
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength Metrics/AbcSize
# rubocop:enable Metrics/AbcSize

def initialise_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(array, separator = ', ', finaliser = 'or')
  case array.size
  when 0 then ''
  when 1 then array.join('')
  when 2 then array.join(separator)
  else
    array[-1] = "#{finaliser} #{array.last}"
    array.join(separator)
  end
end

def place_piece!(brd, current_player)
  if current_player == PLAYER
    player_place_piece!(brd)
  elsif current_player == COMPUTER
    computer_place_piece!(brd)
  end
end

def alternate_player(current_player)
  current_player == PLAYER ? COMPUTER : PLAYER
end

def player_place_piece!(brd)
  square = ''
  loop do
    prompt_msg("Choose a square (#{joinor(empty_squares(brd))}): ")
    square = gets.chomp
    break if valid?(square) && empty_squares(brd).include?(square.to_i)
    prompt_msg("Square is not empty or option is invalid!")
  end
  brd[square.to_i] = PLAYER_MARKER
end

def computer_place_piece!(brd)
  square = attack_or_defend!(brd, COMPUTER_MARKER)
  square = attack_or_defend!(brd, PLAYER_MARKER) if !square
  square = MID_SQUARE if !square && brd[MID_SQUARE] == INITIAL_MARKER
  square = empty_squares(brd).sample if !square

  brd[square] = COMPUTER_MARKER
end

def attack_or_defend!(brd, marker)
  square = nil
  WINNING_OPTIONS.each do |line|
    square = find_at_risk_square(line, brd, marker)
    break if square
  end
  square
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner?(brd)
end

def detect_winner?(brd)
  WINNING_OPTIONS.each do |options|
    if brd.values_at(*options).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*options).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def winner(player_score, computer_score)
  return 'Player' if player_score >= ROUNDS_TO_WIN
  return 'Computer' if computer_score >= ROUNDS_TO_WIN
end

def match_ended?(player_score, computer_score)
  player_score >= ROUNDS_TO_WIN || computer_score >= ROUNDS_TO_WIN
end

def display_score(board, count_match)
  if someone_won?(board)
    prompt_msg("Round -> #{count_match}! #{detect_winner?(board)} won!")
  else
    prompt_msg("Round -> #{count_match}! It's a tie!")
  end
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

def valid_exit?(input)
  input.downcase == 'n' || input.downcase == 'no'
end

def play_again?(input)
  input.downcase == 'y' || input.downcase == 'yes'
end

def valid?(input)
  input == input.to_i.to_s
end

def continue_game
  prompt_msg("Press any key to continue game\r")
  gets
end

loop do
  player_score = 0
  computer_score = 0
  count_match = 0
  current_player = nil
  answer = nil

  loop do
    board = initialise_board
    display_board(board, player_score, computer_score)

    case FIRST_MOVE
    when 'choose' then
      loop do
        prompt_msg(FIRST_MOVE_MESSAGE)
        current_player = gets.chomp.downcase
        break if current_player == PLAYER || current_player == COMPUTER
        prompt_msg('Invalid choice.')
      end
    when 'player' then current_player = PLAYER
    when 'computer' then current_player = COMPUTER
    end

    loop do
      display_board(board, player_score, computer_score)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, player_score, computer_score)

    count_match += 1
    player_score += 1 if detect_winner?(board) == 'Player'
    computer_score += 1 if detect_winner?(board) == 'Computer'

    if match_ended?(player_score, computer_score)
      prompt_msg("#{winner(player_score, computer_score)} wins game!")
      prompt_msg("Play GAME again - 'y' or 'n'? ")
      loop do
        answer = gets.chomp
        break if valid_exit?(answer) || play_again?(answer)
        prompt_msg('Invalid answer. Try again.')
      end
    else
      display_score(board, count_match)
      continue_game
    end
    break if match_ended?(player_score, computer_score)
  end
  break unless play_again?(answer)
end

prompt_msg('Thanks for playing Tic Tac Toe! See you next time :-)')
