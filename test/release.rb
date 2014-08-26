class Field
  def initialize
  @field=[ 
                 [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
                 [-1, 0, 0, 0, 0, 0, 0, 0, 0,-1],
                 [-1, 0, 0, 0, 0, 0, 0, 0, 0,-1],
                 [-1, 0, 0, 0, 0, 0, 0, 0, 0,-1],
                 [-1, 0, 0, 0, 2, 1, 0, 0, 0,-1],
                 [-1, 0, 0, 0, 1, 2, 0, 0, 0,-1],
                 [-1, 0, 0, 0, 0, 0, 0, 0, 0,-1],
                 [-1, 0, 0, 0, 0, 0, 0, 0, 0,-1],
                 [-1, 0, 0, 0, 0, 0, 0, 0, 0,-1],
                 [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]
                ]
  end

  def field
    return @field.transpose
  end
end
################################################
class LogSetter
  attr_reader :logArr

  def initialize
    @logArr=[]
    @n = 0
    self.getl1
    @n.times{@logArr<<self.getln}
  end

  def getl1
    @n=gets.chomp.to_i
  end

  def getln
    color,x,y=gets.chomp.split(" ")
    x,y=x.to_i,y.to_i
    case color
    when "B" 
      colorNum=1
    when "W"
      colorNum=2
    end
    return [colorNum,x,y]
  end
end
##############################################

class Flipper
  attr_accessor :field
  def initialize(currentField)
    @field=currentField
    @x=0
    @y=0
    flipArr =[]
    @canset=false
  end

  def field
    return @field
  end

  def setStone(colorNum,x,y)
    flip(colorNum,x,y)
    @field[x][y] = colorNum if @canset
  end

  def flip(colorNum,currentX,currentY)
    @canset=false
    (0..7).each do|dir|
       check(currentX,currentY,dir,colorNum)
    end
  end
  

  def check(currentX,currentY,dir,colorNum)
    x = currentX
    y = currentY
    _col=colorNum
    sta =true
    toflip =[]
    cnt =0
    mx =0
    x,y=go(x,y,dir)
    while sta == true 
      mx=@field[x][y]
      if mx == 0
        sta=false
      elsif mx == -1
        sta=false
      elsif mx!=_col
        toflip<<[x,y]
        x,y=go(x,y,dir)
      elsif mx == _col
        sta = false if cnt==0
        toflip.each{|x,y| @field[x][y]=_col}
        @canset = true
        sta = false
      end
      cnt += 1  
    end
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

########################################
class Controller
  def initialize
    
  end

  def input
    @Logger=LogSetter.new
    @Logger.logArr
  end

  def postModel
    
  end
end

#####################################
class Model
  attr_accessor :field
  def initialize(logArr)
    @field = Field.new.field
    @currentX
    @currentY
    @color
    @flipper=Flipper.new(@field)
    @logArr=logArr
  end

  def flip_w_log
    @logArr.each do |color,x,y|
      @flipper.setStone(color,x,y)
    end
    @flipper
  end

  def kekka
    b_count=0
    w_count=0
    kekkaArr=@flipper.field
    kekkaArr.pop
    kekkaArr.shift
    kekkaArr.each do |arr|
      arr.pop
      arr.shift
      arr.each do |num|
        case num
        when 1
          b_count +=1
        when 2
          w_count +=1
        end
      end
    end
   b=b_count.to_s
   w=w_count.to_s
   b = "0" + b if b.length==1
   w = "0" + w if b.length==1
    if b_count > w_count
      print b,"\-",w
      print "\s","The black won!","\n"
    elsif b_count < w_count
      print b,"\-",w     
      print "\s","The white won!","\n"
    elsif b_count == w_count
      print b,"\-",w
      print "\s","Draw!","\n"
    end
  end
end

########################################

controller=Controller.new
logArr=controller.input
mo = Model.new(logArr)
mo.flip_w_log
mo.kekka