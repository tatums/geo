class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state, :limit => 4
      t.string :zip,   :limit => 15
      t.string :phone, :limit =>15
      t.float  :longitude
      t.float  :latitude
      t.boolean :gmaps
      
      t.timestamps
    end
  end
end
