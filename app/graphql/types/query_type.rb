require 'httparty'

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :events, [EventType], null: false do
      argument :type, String, required: true
      argument :name, String, required: false
      argument :city, String, required: false
      argument :category, String, required: false
      argument :location, String, required: false
      argument :source, String, required: false
    end
  
    def events(type:, name: nil, city: nil, category: nil, location: nil, source: nil)
      case type
      when 'events'
        url = "https://app.ticketmaster.com/discovery/v2/events.json?size=200&apikey=#{ENV['TICKETMASTER_API_KEY']}"
        query_params = { keyword: name, city: city, classificationName: category }
      when 'attractions'
        url = "https://app.ticketmaster.com/discovery/v2/attractions.json?size=200&apikey=#{ENV['TICKETMASTER_API_KEY']}"
        query_params = { keyword: name }
      when 'venues'
        url = "https://app.ticketmaster.com/discovery/v2/venues.json?size=200&apikey=#{ENV['TICKETMASTER_API_KEY']}"
        query_params = { keyword: name }
      when 'suggest'
        url = "https://app.ticketmaster.com/discovery/v2/suggest.json?size=200&apikey=#{ENV['TICKETMASTER_API_KEY']}"
        query_params = { location: location, source: source }
      else
        Rails.logger.error("Invalid search type: #{type}")
        return []
      end

      query_params.reject! { |_key, value| value.nil? }
      options = { query: query_params, timeout: 30 }

      Rails.logger.info("Making GET request to URL: #{url} with options: #{options}")

      response = HTTParty.get(url, options)

      Rails.logger.info("Response status: #{response.code}")
      Rails.logger.info("Response body: #{response.body}")

      events_json = JSON.parse(response.body)

      unless events_json["_embedded"]
        Rails.logger.error("Unexpected response structure: #{events_json}")
        return []
      end

      events = events_json["_embedded"]["events"]
      
      # Map the events into a structure that matches your EventType
      events.map do |event|
        event
      end
    rescue JSON::ParserError => e
      Rails.logger.error("JSON parsing error: #{e.message}")
      []
    rescue Net::ReadTimeout => e
      Rails.logger.error("Network timeout error: #{e.message}")
      []
    end
  end
end
