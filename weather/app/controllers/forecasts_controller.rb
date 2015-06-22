class ForecastsController < ApplicationController
  def new
  end

  def search_for_location(location)
    first_result = Geocoder.search(location).first

    @location = first_result.formatted_address

    if first_result.nil?
      redirect_to root_path, notice: "Not found: #{@location}"
      return
    end

    latlng = first_result.geometry["location"]
    lat = latlng["lat"]
    lng = latlng["lng"]

    # puts "You want to know about #{[lat,lng].join(",")}"

    response = Http.get "https://api.forecast.io/forecast/#{ENV.fetch('FORECAST_IO_API_KEY')}/#{lat},#{lng}"
    response_json = JSON.parse response
    @forecast = response_json.to_hash

    {forecast: @forecast, location: @location}
  end

  def show

    location = params[:location]

    result = Rails.cache.fetch(location, expires_in: 12.hours) do
      search_for_location(location)
    end

    @forecast = result[:forecast]
    @location = result[:location]

  end
end
