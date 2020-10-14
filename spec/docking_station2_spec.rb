require 'docking_station2'

describe DockingStation do
  docking_station = DockingStation.new

  describe '#release' do
    it 'releases a bike' do
      docking_station.release
      expect(docking_station.print.length).to eq 0
    end
  end

  describe '#release' do
    it 'releases a bike' do
      expect { docking_station.release }.to raise_error("There are no bikes")
    end
  end

  describe '#return_bike' do
    it 'adds a bike to the dock' do
      docking_station.return_bike
      expect(docking_station.print.length).to eq 1
    end
  end

  describe '#return_bike' do
    it 'adds a bike to the dock' do
      expect{docking_station.return_bike}.to raise_error("The docking station is full")
    end
  end

  describe '#see_bike' do
    it 'checks to see if there is a bike in the dock to release' do
      expect(subject.see_bike).to eq "There is a bike"
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
