class SearchFacade
  def initialize()
    @service = NfelService.new
    @directions = MapquestService.new
    end

  def nearest_station(params)
    address = params[:location].split 
    second = address[1] + address[2]
    result = @service.nearest_station(address[0], second, address[3], address[4], address[5])
    @station = Station.new(result)
  end

  def directions(params)
    address = params[:location].split 
    second = address[1] + address[2]
    station = nearest_station(params)
    street_address = station.street_address.split
    directions = @directions.directions(address[0], second, address[3], address[4], address[5], street_address[0], street_address[1], street_address[2], street_address[3], station.city, "CO")
    directions = Directions.new(directions)
  end


end