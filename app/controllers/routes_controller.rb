class RoutesController < ApplicationController
  before_action :set_route, only: %i[show edit update destroy]

  def index
    @routes = Route.all
  end

  def show; end

  def new
    @route = Route.new
  end

  def edit; end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to @route, notice: 'Маршрут был успешно создан.'
    else
      render :new
    end
  end

  def update
    if @route.update(route_params)
      redirect_to @route, notice: 'Маршрут был успешно обнавлен.'
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_path, notice: 'Маршрут был успешно удален.'
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:title, railway_station_ids: [])
  end
end
