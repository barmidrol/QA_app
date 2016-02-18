class GeoController < ActionController::Base
  def show
    @location = request.location.country
  end
end