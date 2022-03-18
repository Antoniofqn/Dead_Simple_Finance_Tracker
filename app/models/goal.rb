class Goal < ApplicationRecord
  belongs_to :user

  def cancel!
    self.cancelled = true
    self.save
  end

  def achieve!
    self.achieved = true
    self.save
  end

  def check
    self.cancelled || self.achieved
  end
end
