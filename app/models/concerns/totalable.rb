module Totalable
  extend ActiveSupport::Concern
 
  def update_users_total
    total = self.assignments.sum(:total)
    update(total: total)
  end
end