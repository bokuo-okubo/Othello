#-*- coding:utf-8 -*-

require "../test/field_manager"
require "../test/scanner"

class Checker
  def initialize
    @canPutArr =[]
  end

  def init
    @scan = Scanner.new
  end

  def canflip?(x,y)
    @canPutArr.each do |arr1,arr2|
      return true if arr1 =[x,y]
    end
    return false
  end

  def flip(color,x,y)
    if canflip?(x,y)
      toAddField=[]
      field_mgr = FieldManager.instance
      toAddField = field_mgr.field
      toAddField[x][y] = color
      @canPutArr.each do |arr1,arr2|
        if arr1 == [x,y]
          arr2.each do |x,y|
            toAddField[x][y] = color
          end
        end
      end
      field_mgr.push(toAddField)
    end
  end

  def setCanPutArr(color)
    p "setCanPutArr"
    @canPutArr =[]
    p "setCanPutArr"

    field = FieldManager.instance.field
    blanks=getBlanks(field)

    blanks.each do |arr|
      x,y=arr[0],arr[1]
      p "blanks.each"
     @canPutArr << @scan.scanAllDirection(color,x,y) if @scan.scanAllDirection(color,x,y)
    end
    @canPutArr
    return @canPutArr unless @canPutArr.length==0 #[ [ [x,y],toFlipAll], ]
    return false
  end

  def getBlanks(field)
    blanks=[]
    y=1
    field.each do |line|
      x=1
      line.each do |num|
        blanks<<[x,y] if num == 0
        x+=1
      end
      y+=1
    end
    blanks
  end

end

