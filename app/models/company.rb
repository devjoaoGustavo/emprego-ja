class Company < ActiveRecord::Base
  attr_accessor :logo
  has_many :jobs
  belongs_to :user

  validates :name, :location, :email, :phone, presence: true

  mount_uploader :logo, LogoUploader

  def premium?
    jobs.count > 5
  end
end
