class Route < ApplicationRecord

  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  validates :title, presence: true

   def self.search_in_route_train(start_station_id, end_station_id)
     found_routes = []
     found_train = []

     self.all.each do |route|
       if route.railway_stations.find_by(id: start_station_id) && route.railway_stations.find_by(id: end_station_id)
         found_routes << route
       end
   end

     found_routes.each do |found_route|
       found_route.trains.each do |train|
         found_train << train
       end
     end
     return found_train
   end

end
