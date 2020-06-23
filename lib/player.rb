# ruby player.rb

class Player
  def initialize(name)
    @name = name
    @token = 0
  end
  attr_accessor :token
  attr_reader :name
end