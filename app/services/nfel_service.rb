class NfelService
  def nearest_station(street_number, street, rd, city, state)
    get_url("/api/alt-fuel-stations/v1/nearest.json?api_key=#{Rails.application.credentials.Nrel[:api_key]}&location=#{street_number}+#{street}+#{rd}+#{city}+#{state}&fuel_type=ELEC&limit=1")[:fuel_stations][0]
  end
  
  def get_url(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: 'https://developer.nrel.gov')
  end
end