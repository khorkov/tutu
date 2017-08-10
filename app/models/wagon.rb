class Wagon < ApplicationRecord

  TYPE = { coupe: 'купе', economy: 'плацкарт' }.freeze

  belongs_to :train, optional: true

  validates :number, :wagon_type, :bottom_seats, :top_seats, presence: true
end
