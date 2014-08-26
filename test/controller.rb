require "./printer"
require "./field"

class Controller
  def initialize
    @printer = Printer.new
    @field = Field.new
    @input=[]
    @checker = Cheker.new
  end

  def init

  end


  def getInput
    color,x,y=gets.chomp.split(" ")
    @input = [color,x,y]
  end

  def printField
    @printer.print(@field.field)
  end

  def flip
  end

  def printResult
  end

  def isGameEnd?
    canputArr=[]
    canputArr = checker.scanField(@field.field)
    canput = canputArr.length == 0 ? true : false
  end
end
