require "../test/printer"
require "./field_manager"
require "../test/checker"

class Controller
  def initialize
    @printer = Printer.new
    @field = FieldManager.instance
    @checker = Checker.new
    @checker.init
    @color =1
    @x=0
    @y=0
    print "the first Turn is BLACK"
  end


  def getInput
    color,x,y=gets.chomp.split(" ")
    @x,@y=x.to_i,y.to_i
    case color
      when "B"
        @color=1
      when "W"
        @color=2
    end
  end

  def printField
    @printer.printField
  end

  def flip
   while @checker.canflip?(@x,@y)
    print "cannnot place the place! \n"
    getInput
   end
    @checker.flip(@color,@x,@y)
  end

  def printResult
  end

  def isGameEnd?
    p "isGameEnd?"
    gameSet = true
    gameSet = false if @checker.setCanPutArr(@color)
    return gameSet
  end
end
