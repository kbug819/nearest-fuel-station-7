class SearchController < ApplicationController
  def index
    @station = SearchFacade.new.nearest_station(params)
    @directions = SearchFacade.new.directions(params)
  end
end