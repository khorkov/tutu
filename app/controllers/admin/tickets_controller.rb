class Admin::TicketsController < Admin::BaseController

   before_action :set_ticket, only: %i[show edit update destroy]

   def index
     @tickets = Ticket.all
   end

  def new
    @ticket = Ticket.new(
      train_id: params[:train_id],
      start_station_id: params[:start_station_id],
      end_station_id: params[:end_station_id]
    )
  end

  def show
  end

  def edit
  end

  def create
    @ticket = Tickets.new(tickets_params)

    if @ticket.save
      redirect_to admin_tickets_path, notice: 'Билет успешно создан.'
    else
      render :new
    end
  end

   def update
     if @ticket.update(ticket_params)
       redirect_to admin_ticket_path(@ticket), notice: 'Билет был успешно обновлен.'
     else
       render :edit
     end
   end

  def destroy
    if @ticket.destroy
      redirect_to admin_tickets_path, notice: 'Билет успешно удален.'
  end

  private

   def set_ticket
     @ticket = Ticket.find(params[:id])
   end

  def tickets_params
    params.require(:ticket).permit(:train_id, :user_id, :start_station_id, :end_station_id, :passenger_name, :passport_number)
  end

end
