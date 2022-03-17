class Goal < ApplicationRecord
  belongs_to :user

  def cancel!
    self.cancelled = true
  end

  def achieve!
    self.achieved = true
  end

  def check
    self.cancelled || self.achieved
  end
end
