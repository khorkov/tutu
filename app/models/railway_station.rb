class RailwayStation < ApplicationRecord

  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :ordered, -> { joins(:railway_stations_routes).order('railway_stations_routes.station_position').uniq  }

  def update_position(route, station_position)
    station_route = station_route(route)
    station_route.update(station_position: station_position) if station_route
  end

  def position_in(route)
    station_route(route).try(:station_position)
  end

  def arrival_time(route)
    station_route(route).try(:arrival_time)
  end

  def departure_time(route)
    station_route(route).try(:departure_time)
  end

  def update_arrival_time(route, date)
    station_route = station_route(route)
    station_route.update(arrival_time: time(date)) if station_route
  end

   def update_departure_time(route, date)
     station_route = station_route(route)
     station_route.update(departure_time: time(date)) if station_route
   end

  protected

  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end

  def time(date)
    date['hour'].concat(':').concat(date['minute'])
  end

end
