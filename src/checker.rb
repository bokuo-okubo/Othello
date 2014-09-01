require '../src/field_manager'
require '../src/scanner'

class Checker
  def initialize
    @scanner = Scanner.new
  end

  def arr_init
    @canPutArr = []
  end

  def canPut?(x,y)
    i=0
    p @canPutArr
    @canPutArr.each do |arr|
      a=arr[0]
      # p a
      if(a[0]==x && a[1]==y)
        return true
      end
      i+=1
  end
    false
  end

  def setCanPutArr(color)
    arr_init
    field = FieldManager.instance.field
    blanks = getBlanks(field)
    i=0

    blanks.each do |arr|
      x,y=arr[0],arr[1]
      xyArr,array=[],[]
      print "alldire:"
      p @scanner.scanAllDirection(color,x,y)
      if @scanner.scanAllDirection(color,x,y)
       xyArr,array = @scanner.scanAllDirection(color,x,y)
       @canPutArr[i]=xyArr,array
       print "arr:",@canPutArr[i],"\n"
        i+=1
      end
    end
    return @canPutArr unless @canPutArr.length==0 #[ [ [x,y],toFlipAll ], ]
    return false
  end

  def getBlanks(field)
    blanks = []
    y=0
    field.each do |line|
      x = 0
      line.each do |num|
        blanks << [x,y] if num == 0
        x += 1
      end
      y += 1
    end
    blanks
  end
end

#debug
ch = Checker.new
fi = FieldManager.instance.field
print "---------------\n"
pry=[]
pry=ch.getBlanks(fi)
pry.each{|xy| p xy}
p ch.setCanPutArr(1)
