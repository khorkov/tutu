class Train < ApplicationRecord

  belongs_to :route, optional: true

  validates :number, presence: true
end
