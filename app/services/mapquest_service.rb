class MapquestService
  def directions(fstreet_number, fstreet, frd, fcity, fstate, tstreet_number, tdirection, tstreet, trd, tcity, tstate)
    get_url("/directions/v2/route?key=#{Rails.application.credentials.MapQuest[:api_key]}&from=#{fstreet_number}+#{fstreet}+#{frd}+#{fcity}+#{fstate}&to=#{tstreet_number}+#{tdirection}+#{tstreet}+#{trd}+#{tcity}+#{tstate}")
  end
  
  def get_url(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: 'https://www.mapquestapi.com')
  end
end

