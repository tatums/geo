class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.string :type
      t.decimal :price, :precision => 8, :scale => 2
      t.datetime :start_at
      t.datetime :end_at
      t.integer :merchant_id

      t.timestamps
    end
  end
end
