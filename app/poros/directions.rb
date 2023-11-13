class Directions
  attr_reader :distance, :travel_time, :directions
  def initialize(direction_data)
    @distance = direction_data[:route][:distance]
    @travel_time = direction_data[:route][:time]
    @directions = direction_data[:route][:legs][0][:maneuvers].map { |directions| directions[:narrative] }
  end
end