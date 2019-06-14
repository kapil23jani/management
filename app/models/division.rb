class Division < ApplicationRecord
  belongs_to :user
  belongs_to :school

  has_many :students
  has_and_belongs_to_many :professors
  has_many :attendances
end
