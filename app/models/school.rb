class School < ApplicationRecord
  belongs_to :user
  has_many :professors, dependent: :delete_all
  has_many :divisions, dependent: :delete_all

  has_many :students, dependent: :delete_all

  accepts_nested_attributes_for :professors

  validates :zipcode, presence: true, numericality: { only_integer: true }

end
