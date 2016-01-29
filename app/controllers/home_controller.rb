class HomeController < ApplicationController
  def index
    @jobs = Job.all_valid
    @companies = Company.all
    @categories = Category.all
    @contract_types = ContractType.all
  end
end
