class Wagon < ApplicationRecord
  TYPE = {
    coupe: 'купе',
    economy: 'плацкарт',
    premium: 'премиум',
    sitdown: 'сидячий'
  }.freeze

  belongs_to :train

  before_validation :set_number
  validates :number, uniqueness: { scope: :train_id  }
  validates :number, :wagon_type, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :sitdown_seats, presence: true

  private

  def set_number
    self.number ||= train.wagons.maximum(:number).to_i + 1
  end
end
