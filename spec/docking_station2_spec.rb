require 'docking_station2'

describe DockingStation do
  docking_station = DockingStation.new

  describe "#initialize" do
    it 'counts to make sure we have 20 bikes' do
      station = DockingStation.new
      20.times {station.return_bike(Bike.new)}
      actual_value = station.dock_array.length
      expected_value = 20
      expect(actual_value). to eq expected_value
    end
  end

  describe '#release' do
    it 'releases a bike' do
      station = DockingStation.new
      20.times {station.return_bike(Bike.new)}
      station.release
      expect(station.dock_array.length).to eq 19
    end
  end

  describe '#release' do
    it 'doesnt releases a bike, raises error' do
      station = DockingStation.new
      expect { station.release }.to raise_error("There are no bikes")
    end
  end

  describe '#return_bike' do
    it 'adds a bike to the dock' do
      station = DockingStation.new
      station.return_bike(Bike.new)
      expect(station.dock_array.length).to eq 1
    end
  end

  describe '#return_bike' do
    it 'doesnt add a bike to the dock, raises error' do
      station = DockingStation.new(0)
      expect{station.return_bike(Bike.new)}.to raise_error("The docking station is full")
    end
  end

  describe '#return_bike' do
    it 'allows the user to report a broken bike'do
      station = DockingStation.new
      bike = Bike.new(false)
      station.return_bike(bike)
      actual_value = station.dock_array.last.working
      expected_value = false
      expect(actual_value).to eq expected_value
    end
  end

  describe '#see_bike' do
    it 'checks to see if there is a bike in the dock to release' do
      station = DockingStation.new
      station.return_bike(Bike.new)
      expect(station.see_bike).to eq "There is a bike"
    end
  end

end

describe Bike do
  bike = Bike.new

  describe "#working?" do
    it "check whether the bike works" do
      expect(subject.working?).to eq "This bike is working"
    end
  end

end

#next chapter to work on is ch14
