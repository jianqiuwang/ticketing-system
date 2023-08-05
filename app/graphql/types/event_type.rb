module Types
    class EventType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :category, String, null: true
      field :description, String, null: true
      field :venue, VenueType, null: true
      field :startingDateTime, GraphQL::Types::ISO8601DateTime, null: true
      field :imageUrl, String, null: true
      field :minimalPrice, Float, null: true
      field :maximalPrice, Float, null: true

      def id
        object["id"]
      end
  
      def category
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
        min_price = object.dig("priceRanges", 0, "min")
      
      end
      
      def maximalPrice
        max_price = object.dig("priceRanges", 0, "max")
       
      end
      
  
      def imageUrl
        preferred_image = object["images"].find do |img|
            img["ratio"] == "16_9" && img["width"] == 2426 && img["height"] == 1365
          end
          preferred_image ? preferred_image["url"] : object.dig("images", 0, "url")
      end
    end
  end
  