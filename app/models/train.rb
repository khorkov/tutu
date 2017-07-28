class Train < ApplicationRecord
  belongs_to :route, optional: true
  has_many :tickets

  validates :number, presence: true
end
