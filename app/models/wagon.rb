class Wagon < ApplicationRecord
  belongs_to :train, optional: true

  validates :number, :wagon_type, :bottom_seats, :top_seats, presence: true
end
