class TicketsController < ApplicationController
  before_action :set_stations, only: %i[show index]
  before_action :set_ticket,   only: %i[show destroy]

  def index
    @tickets = current_user.tickets
  end

  def show
  end

  def new
    @ticket = Ticket.new(
      train_id: params[:train_id],
      start_station_id: params[:start_station_id],
      last_station_id: params[:last_station_id]
    )
  end

  def create
    @ticket = current_user.tickets.new(tickets_params)

    if @ticket.save
      redirect_to @ticket, notice: 'Билет был успешно создан.'
    else
      render :new
    end
  end

  def destroy
    if @ticket.destroy
      redirect_to tickets_path, notice: 'Билет был успешно удален.'
    end
  end

  private

  def tickets_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id,
                                   :passenger_name, :passport_number)
  end

  def set_stations
    @departure_station = RailwayStation.find_by(params[:start_station_id])
    @arrival_station = RailwayStation.find_by(params[:end_station_id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
