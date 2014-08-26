class Scanner
  def scanAllDirection(color,x,y)
    toFlipAll = []
    an = true
    (0..7).each{|dir| toFlipAll << linearScan(color,x,y,dir) if linearScan(color,x,y,dir)}

    return [x,y],toFlipAll if toFlipAll.length !=0
    return nil if toFlipAll.length ==0
  end

  def linearScan(color,currentX,currentY,dir)
    x=currentX
    y=currentY
    field =FieldManager.instance.field

    toflipArr =[]
    cnt = 0
    sta = true
    x,y = go(x,y,dir)

    while sta == true
      point = field[x][y]
      if point == 0 #空白の場合
        sta = false
      elsif point == -1 #はしの場合
        sta = false
      elsif point != color
        toflipArr <<[x,y]
        x,y=go(x,y,dir)
      elsif point == color
        sta = false
      end
    end
    toflipArr
    nil if toflipArr.length == 0
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