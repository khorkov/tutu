class CreateWagons < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|
      t.integer     :number
      t.string      :wagon_type
      t.integer     :top_seats, default: 0
      t.integer     :bottom_seats, default: 0
      t.integer     :side_top_seats, default: 0
      t.integer     :side_bottom_seats, default: 0
      t.integer     :sitdown_seats, default: 0
      t.belongs_to  :train
      t.string      :type

      t.timestamps
    end
  end
end
