class Assignment < ApplicationRecord
	belongs_to :project
  belongs_to :owner, polymorphic: true

  scope :by_owner, ->(id, type) do
  	where(owner_id: id, owner_type: type)
  end

  after_save :update_users_total
  before_update :total_update, if: proc { |obj|
    obj.month_changed? || obj.rnd_percentage_changed?
  }

  validates_inclusion_of :rnd_percentage, in: 0..100
  validates_inclusion_of :month, in: 0..12

  delegate :update_users_total, to: :owner

  private

  def total_update
    self.total = (month * rnd_percentage) / 12
  end
end
