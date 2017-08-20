class AddWagonSortingFlagToTrain < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :wagon_sorting_type, :boolean, default: true
  end
end
