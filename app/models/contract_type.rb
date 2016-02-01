class ContractType < ActiveRecord::Base
  has_many :jobs
  
  validates :name, presence: true, uniqueness: true

  def jobs_valid
    jobs.where("created_at > ?", 90.days.ago)
  end
end
