class HomeController < ApplicationController
  before_action :set_resources, only: :index

  def index
  end

  private

  def set_resources
    @jobs = Job.all_valid
    @companies = Company.all
    @categories = Category.all
    @contract_types = ContractType.all
  end
end
