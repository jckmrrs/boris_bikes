class DockingStation
attr_reader :dock_array

  def initialize(number_of_bikes = 20)
    @dock_array = []
    @DEFAULT_CAPACITY = number_of_bikes
  end

  def release
    raise "There are no bikes" if empty?

    # Loop through our bikes and give us a working one
    @dock_array.each do |bike|
      if bike.working == true
        @dock_array.delete(bike)
        return bike
      end

      # If we haven't found a bike, then error
      raise "There are no working bikes"
    end

  end

  def return_bike(bike)
    if full? then @dock_array << bike  else raise "The docking station is full" end
  end

  def see_bike
    if @dock_array.length != 0
      return "There is a bike"
    else
      return "There are no bikes to see"
    end
  end

  private

  def full?
    return (if @dock_array.length < @DEFAULT_CAPACITY then true else false end)
  end

  def empty?
    return (if @dock_array.length == 0 then true else false end)
  end

end

class Bike

attr_reader :working

  def initialize(working = true)
    @working = working
  end

  def working?
    #if @working = true
    return "This bike is working"
  end

end
