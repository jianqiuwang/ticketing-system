module Types
    class VenueType < Types::BaseObject
      field :name, String, null: false
      field :city, String, null: false
      field :state, String, null: false
      field :country, String, null: false
      field :address, String, null: false
      def name
        object["name"]
      end
  
      def city
        object.dig("city", "name")
      end
  
      def state
        object.dig("state", "name") || "N/A"
      end
  
      def country
        object.dig("country", "name")
      end
  
      def address
        object.dig("state", "name") || 'N/A' 
      end
    end
  end
  