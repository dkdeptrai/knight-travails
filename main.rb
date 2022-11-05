# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/knight'

board = Board.new
p board.knight_moves([0,0],[3,3])
