class DockingStation

  def initialize
    @dock_array = ["bike"]
    @capacity = 1
  end

  def release
    raise "There are no bikes" if @dock_array.length == 0
      @bike = Bike.new; @dock_array.pop if @dock_array.length != 0
    end


  def return_bike
    if @dock_array.length < @capacity then @dock_array << "bike"  else raise "The docking station is full" end
  end

  def see_bike
    if @dock_array.length != 0
      return "There is a bike"
    else
      return "There are no bikes to see"
    end
  end

  def print
    return @dock_array
  end
end

class Bike

attr_reader :bike

  def working?
    return "This bike is working"
  end

end

def release
  if @dock_array.length == 0
    raise "There are no bikes"
  else
    @bike = Bike.new
    @dock_array.pop
  end
end

def return_bike
  if @dock_array.length < @capacity
   @dock_array << "bike"
 else
   raise "The docking station is full"
 end

end
