# frozen_string_literal: true

# Knight class
class Knight
  attr_reader :position
  attr_accessor :parent

  MOVES = [[1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]].freeze
  @visited = []
  def initialize(position, parent = nil, visited = [])
    @position = position
    @parent = parent
    @visited = visited
    @visited.push(position)
  end

  def children
    possible_pos = MOVES.map { |move| [@position[0] + move[0], @position[1] + move[1]] }
    possible_pos.map { |pos| Knight.new(pos, self, @visited) if !@visited.include?(pos) && valid?(pos) }.compact
  end
end

def valid?(pos, height = 8, width = 8)
  pos[0].between?(0, height - 1) && pos[1].between?(0, width - 1)
end
