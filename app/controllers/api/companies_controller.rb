class Api::CompaniesController < ApplicationController
  before_action :set_company, only: :show

  def show
    @companyD = CompanyDecorator.new(@company)
    respond_with @companyD
  end

  def index
    @companies = Company.all
    respond_with @companies
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end
end
