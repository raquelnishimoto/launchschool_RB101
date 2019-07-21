require 'pry'
require 'pry-byebug'

FIRST_MOVE = 'choose'
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
def display_board(brd, count_player, count_computer)
  system 'clear'
  prompt_msg("You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}")
  prompt_msg("Win 5 matches to win the game!")
  prompt_msg("Score: Player #{count_player} Vs. Computer #{count_computer}")
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
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt_msg("Square does not exist or option is invalid!")
  end
  brd[square] = PLAYER_MARKER
end

def computer_place_piece!(brd)
  square = attack!(brd)
  square = defend!(brd) if !square
  square = 5 if !square && brd[5] == INITIAL_MARKER
  square = empty_squares(brd).sample if !square

  brd[square] = COMPUTER_MARKER
end

def attack!(brd)
  square = nil
  WINNING_OPTIONS.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end
  square
end

def defend!(brd)
  square = nil
  WINNING_OPTIONS.each do |line|
    square = find_at_risk_square(line, brd, PLAYER_MARKER)
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

def display_winner(count_player, count_computer)
  return 'Player' if count_player >= 5
  return 'Computer' if count_computer >= 5
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

loop do
  count_player = 0
  count_computer = 0
  count_match = 0
  current_player = nil
  answer = nil

  loop do
    board = initialise_board
    display_board(board, count_player, count_computer)

    case FIRST_MOVE
    when 'choose' then
      loop do
        prompt_msg(FIRST_MOVE_MESSAGE)
        current_player = gets.chomp
        break if current_player == PLAYER || current_player == COMPUTER
        prompt_msg('Invalid choice.')
      end
    when 'player' then current_player = PLAYER
    when 'computer' then current_player = COMPUTER
    end

    loop do
      display_board(board, count_player, count_computer)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board, count_player, count_computer)

    count_match += 1
    count_player += 1 if detect_winner?(board) == 'Player'
    count_computer += 1 if detect_winner?(board) == 'Computer'

    if !!display_winner(count_player, count_computer)
      prompt_msg("#{display_winner(count_player, count_computer)} wins game!")
      prompt_msg("Play GAME again - 'y' or 'n'? ")
    else
      display_score(board, count_match)
      prompt_msg("Continue - 'y' or 'n'? ")
    end
    answer = gets.chomp
    break unless answer.downcase == 'y'
    prompt_msg('Invalid answer. Try again.')
  end
  break if !!display_winner(count_player, count_computer)
  break unless answer.downcase == 'y'
end

prompt_msg('Thanks for playing Tic Tac Toe! See you next time :-)')
