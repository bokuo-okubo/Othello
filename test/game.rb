require "../test/controller"

class Game
  def initialize
    @cont = Controller.new
    p "init in game"
  end

  def doNextTurn
    p "doNextTurn in game"
    @cont.printField 
    p "printField in game"
    @cont.getInput
    @cont.flip
    
  end

  def printResult
     @cont.printField
     @cont.printResult
  end

  def isGameEnd?
    p "isgame? in game"
    @cont.isGameEnd?
  end
end
######################

######################
#main

game = Game.new
game.doNextTurn while not(game.isGameEnd?)
game.printResult if isGameEnd?

