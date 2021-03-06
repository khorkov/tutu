module SearchesHelper
  def ticket_path_helper(train)
    params = {
      train_id: train.id,
      start_station_id: @departure_station,
      end_station_id: @arrival_station
    }
    path = current_user.admin? ? new_admin_ticket_path(params) : new_ticket_path(params)
  end
end
