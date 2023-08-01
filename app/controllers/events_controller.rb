require 'net/http'
require 'uri'

class EventsController < ApplicationController
  def index
    uri = URI.parse("https://app.ticketmaster.com/discovery/v2/events.json?apikey=#{ENV['TICKETMASTER_API_KEY']}")
    response = Net::HTTP.get_response(uri)

    render json: JSON.parse(response.body)
  end
end

