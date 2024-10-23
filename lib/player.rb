class Player
    attr_accessor :name, :score
    def initialize(name = "player", score = 0)
        self.name = name
        self.score = score
    end
end