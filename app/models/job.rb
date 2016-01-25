class Job < ActiveRecord::Base
  belongs_to :company
  validates :title, :category, :location, :company_id, :description, presence: true
end
