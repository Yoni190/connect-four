class Player
  attr_accessor :name, :score

  def initialize(name = 'player')
    self.name = name
    self.score = 0
  end
end
