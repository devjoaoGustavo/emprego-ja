class ContractType < ActiveRecord::Base
  has_many :jobs

  def jobs_valid
    jobs.where("created_at > ?", 90.days.ago)
  end
end
