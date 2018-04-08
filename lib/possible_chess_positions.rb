class PossibleChessPositions
#input (-piece 'Knight' -location 'd5')
attr_reader :piece_type, :location

  unless ARGV.length == 2
    puts 'Please enter the input data (e.g. ruby lib/possible_chess_positions.rb  king h1)'
    exit
  end

  def initialize(piece_type, location)
    @piece_type = piece_type
    @location = location
    @move_directions = move_directions
    unless %w{knight rook queen pawn bishop king}.include?(ARGV[0].downcase)
      puts 'Please enter a valid piece type. like KNIGHT or ROOK or QUEEN or KING or BISHOP or PAWN'
      exit
    end
    puts potential_board_positions
  end

# possible board moves
  def potential_board_positions
    location_coords = @location.split(//)

    x = location_coords[0].ord - 96
    y = location_coords[1].to_i

    if (x < 1 || y < 1 || y > 8 || x > 8 || @location.length!=2)
      puts 'Please provide a valid location'
      exit
    end

    possible_moves = @move_directions.flat_map do |move|
      (1..move_steps[@piece_type]).collect do |step|
        new_x = x + (move[:x] * step)
        new_y = y + (move[:y] * step)
        [new_x, new_y]
      end
    end.sort do |m1, m2|
      c = (m1[1] <=> m2[1])
      c == 0 ? (m1[0] <=> m2[0]) : c
    end

    valid_possible_moves = possible_moves.reject { |p| p[0] < 1 || p[1] < 1 || p[0] > 8 || p[1] > 8 }

#formatting the moves
    valid_possible_moves.collect { |m|
      x = (m[0] + 96).chr
      y = m[1]
      "#{x}#{y}"
    }.join(', ')
  end

  def move_directions
    case @piece_type
    when 'pawn'
      [{ x: 0,  y: 1}]
    when 'king'
      [{ x: 1,  y: 0},
       { x: 0,  y: 1},
       { x: 0,  y: -1},
       { x: -1, y: 0},
       { x: -1, y: 1},
       {  x: -1, y: -1},
       {  x: 1,  y: 1},
       {  x: 1,  y: -1}]
    when 'rook'
      [{ x: 1,  y: 0},
       { x: 0,  y: 1},
       { x: 0,  y: -1},
       { x: -1, y: 0}]
    when 'queen'
      [{ x: 0, y: -1},
      { x: 0,  y: 1},
      { x: -1, y: 1},
      { x: -1, y: -1},
      { x: 1,  y:  1},
      { x: 1,  y: -1},
      { x: 1,  y: 0},
      { x: -1, y: 0}]
    when 'bishop'
      [{ x: -1, y: 1},
      {  x: -1, y: -1},
      {  x: 1,  y: 1},
      {  x: 1,  y: -1}]
    when 'knight'
      [{ x: -2, y: 1},
      { x: -2, y: 1},
      { x: -1,  y: 2},
      { x: 1,   y: 2},
      { x: 2,   y: 1},
      { x: 2,   y: -1},
      { x: -1,  y: -2},
      { x: 1,   y: -2}]
    end
  end

  def move_steps
    {'rook' => 7,
     'queen' => 7,
     'bishop' => 7,
     'knight' => 1,
     'pawn' => 1,
     'king' => 1
   }
  end
end

piece_type = ARGV[0].downcase
location = ARGV[1].downcase

PossibleChessPositions.new(piece_type, location)
