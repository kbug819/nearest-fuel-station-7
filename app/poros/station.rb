class Station
  attr_reader :name, :street_address, :city, :zip_code, :access_times
  def initialize(station_data)
    @name = station_data[:station_name]
    @street_address = station_data[:street_address]
    @city = station_data[:city]
    @zip_code = station_data[:zip]
    @access_times = station_data[:access_days_time]
  end
end