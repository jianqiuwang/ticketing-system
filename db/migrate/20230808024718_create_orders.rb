class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :event_id
      t.string :event_name
      t.string :status
      t.datetime :purchase_date

      t.timestamps
    end
  end
end
