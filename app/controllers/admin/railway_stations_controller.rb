class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: %i[show edit update destroy update_position update_time]
  before_action :set_route, only: %i[update_position update_time]

  def index
    @railway_stations = RailwayStation.all
  end

  def show; end

  def new
    @railway_station = RailwayStation.new
  end

  def edit; end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    if @railway_station.save
      redirect_to admin_railway_station_path(@railway_station), notice: 'Станция была успешно создана.'
    else
      render :new
    end
  end

  def update
    if @railway_station.update(railway_station_params)
      redirect_to admin_railway_station_path(@railway_station), notice: 'Станция была успешно обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @railway_station.destroy
    redirect_to admin_railway_stations_path, notice: 'Станция была успешно удалена.'
  end

  def update_position
    @railway_station.update_position(@route, params[:station_position])
    redirect_to admin_route_path(@route), notice: 'Позиция станции была успешно обновлена.'
  end

  def update_time
    @railway_station.update_time(@route, params[:arrival_time],
                                 params[:departure_time])
    redirect_to admin_route_path(@route), notice: 'Расписание было успешно обновлено.'
  end

  private

  def set_route
    @route = Route.find(params[:route_id])
  end

  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  def railway_station_params
    params.require(:railway_station).permit(:title)
  end
end
