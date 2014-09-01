require "../src/field_manager"
class Printer
  def printField
    _field = FieldManager.instance.field
    temp = convertReal(_field)
    printer(temp)
  end

  def printer(field)
    #cut off the edges of Top and Bottom
    field.pop
    field.shift

    print "\s\s1 2 3 4 5 6 7 8\n"
    print "\s\s- - - - - - - -\n"
    line=1
    field.each do |xarr|
      #cut off the edges of Sides
      xarr.pop
      xarr.shift

      print "#{line}\|"
      cnt=0
      xarr.each do |x|
        print x
        print "\s" unless cnt == 7
        print "\n" if cnt == 7

        cnt +=1
      end
      line +=1
    end

  end

  def convertReal(field)
    realField = []
    innerArr=[]
    field.each do |arr|
      arr.each do |num|
        if num == 0
          innerArr << "\s"
        elsif num == 1
          innerArr << "●"
        elsif num == 2
          innerArr << "◯"
        else
          innerArr << num
        end
      end
      realField << innerArr
      innerArr=[]
    end
    realField
  end
end

#######debug
# prin = Printer.new
# prin.printField