# frozen_string_literal: true

require_relative 'knight'

# The chess board
class Board
  attr_accessor :board

  def initialize(height = 8, width = 8)
    @board = Array.new(height) { Array.new(width) }
  end

  def knight_moves(start_pos, end_pos)
    queue = []
    knight = Knight.new(start_pos)
    queue.push(knight)
    until queue.nil?
      knight = queue.shift
      break if knight.position == end_pos
      knight.children.each { |child| queue.push(child) }
    end
    queue = []
    until knight.nil?
      queue.unshift(knight.position)
      knight = knight.parent
    end
  queue
  end
end
