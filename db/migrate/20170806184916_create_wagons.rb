class CreateWagons < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.integer :number
      t.string :wagon_type
      t.integer :bottom_seats
      t.integer :top_seats

      t.timestamps
    end
  end
end
