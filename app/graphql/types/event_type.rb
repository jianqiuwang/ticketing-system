module Types
    class EventType < Types::BaseObject
      field :name, String, null: false
      field :category, String, null: true
      field :description, String, null: true
      field :venue, VenueType, null: true
      field :startingDateTime, GraphQL::Types::ISO8601DateTime, null: true
      field :imageUrl, String, null: true
      field :minimalPrice, Float, null: true
  
      def category
        # Assuming the category is in the genre object
        object.dig("classifications", 0, "segment", "name")
      end

      def description
        object["description"]
      end
  
      def venue
        object.dig("_embedded", "venues", 0)
      end

      def startingDateTime
        date = object.dig("dates", "start", "localDate")
        time = object.dig("dates", "start", "localTime")
        time_zone = object["timezone"]
      
        datetime_str = "#{date}T#{time}"
        Time.use_zone(time_zone) { Time.zone.parse(datetime_str).utc }
      end
  
      def minimalPrice
        object.dig("priceRanges", 0, "min")
      end
  
      def imageUrl
        # Getting the first image from the images array
        object.dig("images", 0, "url")
      end
    end
  end
  