class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :category
  validates :title, :category_id, :location, :company_id, :description, presence: true

  def recent?
    created_at > 5.days.ago
  end

  def expired?
    created_at <= 90.day.ago
  end

  def self.all_valid
    self.where("created_at > ?", 90.days.ago)
  end
end
