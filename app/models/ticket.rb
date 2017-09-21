class Ticket < ApplicationRecord
  belongs_to :train

  belongs_to :start_station_id, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station_id, class_name: 'RailwayStation', foreign_key: :end_station_id

  validates :passenger_name, :passport_number, presence: true
  validates :passenger_name, length: { in: 3..50  }
  validates :passport_number, format: { with: /\A\d{4}\s\d{6}\z/  }
end
