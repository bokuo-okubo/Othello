require "./controller"

class Game
  def initialize
    @cont = Controller.new
  end

  def doNextTurn
    @cont.printField 
    @cont.getInput
    @cont.flip
  end

  def printResult
     @cont.printField
     @cont.printResult
  end

  def isGameEnd?
    @cont.isGameEnd?
  end
end
######################

######################
#main

game = Game.new
game.doNextTurn while not(game.isGameEnd?)
game.printResult if isGameEnd?

