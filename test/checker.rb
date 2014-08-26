require "../test/field1"

class Checker
  def initialize
    @canPutArr =[]
  end

  def setCanPutArr(field,color)
    blanks=getBlank(field)

    blanks.each do |x,y|
     @canPutArr <<[color,x,y] if scan(color,x,y)
    end
    @canPutArr
  end

  def getBlank(field)
    blanks=[]
    x,y=0,0
    field.each do |line|
      line.each do |num|
        blanks<<[x,y]
        y+=1
      end
      x+=1
    end
    blanks
  end

  def scan(color,x,y)
    rusultArr = []
    an = true
    (0..7).each{|dir| resultArr << linearScan(color,x,y,dir)}
    resultArr.each{|result| an=false if result == false}
    return an

  end

  def linearScan(color,currentX,currentY,dir)

  end

  def go(x,y,dir)
    dirArr=[
        "R","D","L","T",
        "RD","LD","LT","RT"
    ]
    dir = dirArr[dir]

    if dir=="R"
      _x = x+1
      _y=y
    elsif dir=="RD"
      _x =x+1
      _y=y+1
    elsif dir=="D"
      _x = x
      _y=y+1
    elsif dir=="LD"
      _x = x-1
      _y=y+1
    elsif dir=="L"
      _x = x-1
      _y=y
    elsif dir=="LT"
      _x = x-1
      _y=y-1
    elsif dir=="T"
      _x = x
      _y=y-1
    elsif dir=="RT"
      _x = x+1
      _y=y-1
    end

    return _x,_y
  end
end

