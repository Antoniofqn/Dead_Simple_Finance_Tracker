class Goal < ApplicationRecord
  belongs_to :user

  validates :name, :objective, presence: true

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
