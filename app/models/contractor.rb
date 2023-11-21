class Contractor < ApplicationRecord
  include Totalable

  has_many :assignments, as: :owner
  has_many :projects, through: :assignments

  validates :name, presence: true
end
