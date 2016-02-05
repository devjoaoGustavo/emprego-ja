class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: :show

  def new
    @company = Company.new
  end

  def show
  end

  def edit
    unless logged_user? @company.user
      redirect_to @company, alert: "User can't edit this company"
    end
  end

  def create
    @company = current_user.companies.create(company_params)
    respond_with @company
  end

  def update
    @company.update(company_params)
    respond_with @company
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :location, :email, :phone, :logo)
  end
end
