require 'docking_station2'

describe DockingStation do
  docking_station = DockingStation.new
  let(:bike) { double :bike}

  describe "#initialize" do
    it 'counts to make sure we have 20 bikes' do
      station = DockingStation.new
      20.times {station.return_bike(bike)}
      expect(station.dock_array.length). to eq 20
    end
  end

  describe '#release' do
    it 'releases a bike' do
      station = DockingStation.new
      allow(bike).to receive(:working?).and_return(true)
      20.times {station.return_bike(bike)}
      station.release
      expect(station.dock_array.length).to eq 19
    end
  end

  describe '#release' do
    it 'No bikes, raises error' do
      station = DockingStation.new
      expect { station.release }.to raise_error("There are no bikes")
    end
  end

  describe '#release' do
    it 'No working bikes, raise error' do

    station = DockingStation.new
    bike = Bike.new(false)
    station.return_bike(bike)

    expect { station.release }.to raise_error("There are no working bikes")
    end
  end

  describe '#return_bike' do
    it 'adds a bike to the dock' do
      station = DockingStation.new
      station.return_bike(bike)
      expect(station.dock_array.length).to eq 1
    end
  end

  describe '#return_bike' do
    it 'doesnt add a bike to the dock, raises error' do
      station = DockingStation.new(0)
      expect{station.return_bike(bike)}.to raise_error("The docking station is full")
    end
  end

  describe '#return_bike' do
    it 'allows the user to report a broken bike'do
      station = DockingStation.new
      bike = Bike.new(false)
      station.return_bike(bike)
      expect(station.dock_array.last.working).to eq false
    end
  end

  describe '#see_bike' do
    it 'checks to see if there is a bike in the dock to release' do
      station = DockingStation.new
      station.return_bike(bike)
      expect(station.see_bike).to eq "There is a bike"
    end
  end

end

describe Bike do
  bike = Bike.new

  describe "#working?" do
    it "check whether the bike works" do
      expect(subject.working?).to eq true
    end
  end

end

describe Van do
  describe "#pick_up_broken_bike" do
    it 'detects a broken bike in the dock_array and removes it' do
      van = Van.new
      station = DockingStation.new
      5.times {station.return_bike(Bike.new(false))}
      5.times {station.return_bike(Bike.new)}
      van.pick_up(station)
      expect(van.van_array.length).to eq 5
    end
  end

end

describe Garage do
  describe "#deliver_broken_bikes_to_garage" do
    it "takes bikes from van array and puts them in garage array" do
      van = Van.new
      garage = Garage.new
      station = DockingStation.new
      5.times {station.return_bike(Bike.new(false))}
      van.pick_up(station)
      garage.drop_off(van)
      expect(garage.garage_array.length).to eq 5
    end
  end

  describe "#fix_broken_bike" do
    it "takes a broken bike and fixes it" do
      garage = Garage.new
      van = Van.new
      station = DockingStation.new
      5.times {station.return_bike(Bike.new(false))}
      van.pick_up(station)
      garage.drop_off(van)
      garage.repair
      expect(garage.garage_array).not_to include false
    end
  end
end

# make a van class - completed
# detect broken bikes and remove them from dock array - completed
# take them to the garage array - completed
# detect when it has a working bike, and return it to the dock array

# make a garage class - completed
# detect when it has a bike, and 'fix' - completed
# return fixed bike to van
