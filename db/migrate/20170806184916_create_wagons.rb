class CreateWagons < ActiveRecord::Migration[5.1]
  def change
    create_table :wagons do |t|

      t.timestamps
    end
  end
end
