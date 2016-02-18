class GeoController < ActionController::Base
  def show
    @location = request.location
  end
end