class AddInfoColumnToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :user_id, :integer
    add_column :tickets, :start_station_id, :integer
    add_column :tickets, :end_station_id, :integer
  end
end
