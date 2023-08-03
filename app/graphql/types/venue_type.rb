module Types
    class VenueType < Types::BaseObject
      field :name, String, null: false
      field :city, String, null: false
      field :state, String, null: false
      field :country, String, null: false
      field :address, String, null: false
  
      # You can define other fields, like 'id', 'type', etc., as needed.
    end
  end
  