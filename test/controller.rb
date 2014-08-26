require "./printer"
require "./field_manager"

class Controller
  def initialize
    @printer = Printer.new
    @field = FieldManager.new
    @input=[]
    @checker = Cheker.new
  end


  def getInput
    color,x,y=gets.chomp.split(" ")
    @input = [color,x,y]
  end

  def printField
    @printer.printField
  end

  def flip

  end

  def printResult
  end

  def isGameEnd?
    canputArr=[]
    color = @input[0]
    canputArr = checker.setCanPutArr(@field.field,color)
    canput = canputArr.length == 0 ? true : false
  end
end
