class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :category
  validates :title, :category_id, :location, :company_id, :description, presence: true

  def recent?
    created_at > 5.days.ago
  end
end
