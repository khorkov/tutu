class Wagon < ApplicationRecord

  TYPE = { coupe: 'купе', economy: 'плацкарт' }.freeze

  belongs_to :train, optional: true

  validates :number, :wagon_type, :bottom_seats, :top_seats, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  private

  def set_number
    self.number ||= train.wagons.maximum('number').to_i + 1
  end
end
