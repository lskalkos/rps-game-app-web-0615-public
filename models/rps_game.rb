class RPSGame
  attr_reader :type

  class PlayTypeError < StandardError
  end

  def self.valid_types
    @@valid_types = [:rock, :paper, :scissors]
  end

  def initialize(type)
    @type = type
    raise(PlayTypeError.new) if !self.class.valid_types.include?(@type)
  end

  def self.valid_play?(type)
    self.valid_types.include?(type)
  end

  def computer_play
    selection = rand(3)
    self.class.valid_types[selection]
  end

  def won?
    @computer_move = computer_play
    ((self.type == :rock) && (@computer_move == :scissors)) || ((self.type == :paper) && (@computer_move == :rock)) || ((self.type == :scissors) && (@computer_move == :paper))
  end

  def tied?
    @computer_move = computer_play
    self.type == @computer_move ? true : false
  end

  def lost?
    !won? && !tied?
  end

  def result
    if won?
      "won"
    elsif lost?
      "lost"
    else
      "tied"
    end
  end

  private
  def player_won?
    ((self.type == :rock) && (@computer_move == :scissors)) || ((self.type == :paper) && (@computer_move == :rock)) || ((self.type == :scissors) && (@computer_move == :paper))
  end

end




