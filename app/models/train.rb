class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def wagons_sorted
    sort_type = wagon_sorting_type ? :asc : :desc
    wagons.order(number: sort_type)
  end

  def sum_of_seats_by_wagon_type(wagon_type, seat_type)
    wagons.where("type = '#{wagon_type}'").sum("#{seat_type}")
  end

end
