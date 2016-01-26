class Company < ActiveRecord::Base
  has_many :jobs
  validates :name, :location, :email, :phone, presence: true

  mount_uploader :logo, LogoUploader

  def premium?
    jobs.count > 5
  end
end
