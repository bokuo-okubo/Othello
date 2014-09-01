require "../src/field_manager"
require "../src/printer"
require '../src/checker'

class Controller
  def initialize
    @printer = Printer.new
    @field = FieldManager.instance
    @checker = Checker.new
    @x=1
    @y=1
    @color = 1
    init
  end

  def init
    @color =1
    print "the first Turn is BLACK\n"
  end

  def getInput
    color,x,y=gets.chomp.split(" ")
    @x,@y=x.to_i,y.to_i
    case color
      when 'B'
        @color=1
      when 'W'
        @color=2
    end
  end

  def printField
    @printer.printField
  end

  def flip
    while !(@checker.canPut?(@x,@y))
      print "cannot place the place\n"
      getInput
    end
    @checker.flip(@color,@x,@y)
  end


  def printResult

  end

  def isGameEnd?
    p @checker.setCanPutArr(@color)
    gameset = true
    gameset = false if @checker.setCanPutArr(@color)
    gameset
  end
end

#debug

controll = Controller.new
while not(controll.isGameEnd?)
  controll.printField
  controll.getInput
  controll.flip
end
