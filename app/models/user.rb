class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :tickets

  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

end
