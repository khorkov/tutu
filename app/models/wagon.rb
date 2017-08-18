class Wagon < ApplicationRecord

  TYPE =  { coupe: 'купе', economy: 'плацкарт', premium: 'премиум', sitdown: 'сидячий' }.freeze
  #SEATS = { top_seats: 'верхние', bottom_seats: 'нижние', side_top_seats: 'боковые верхние', side_bottom_seats: 'боковые нижние', sitdown_seats: 'сидячие' }

  belongs_to :train

  validates :number, :wagon_type, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :sitdown_seats, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  private

  def set_number
    self.number ||= train.wagons.maximum('number').to_i + 1
  end
end
