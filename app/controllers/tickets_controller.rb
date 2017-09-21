class TicketsController < ApplicationController

  def show
    @ticket = Ticket.find(params[:id])
    @departure_station = RailwayStation.find_by(params[:start_station_id])
    @arrival_station = RailwayStation.find_by(params[:end_station_id])
  end

  def new
    @ticket = Ticket.new(
      train_id: params[:train_id],
      start_station_id: params[:start_station_id],
      end_station_id: params[:end_station_id]
    )
  end

  def create
    @ticket = Ticket.new(tickets_params)

     if @ticket.save
       redirect_to @ticket, notice: 'Билет успешно создан.'
     else
       render :new
     end
  end

  private

  def tickets_params
    params.require(:ticket).permit(:train_id, :start_station_id, :end_station_id, :passenger_name, :passport_number)
  end

end
