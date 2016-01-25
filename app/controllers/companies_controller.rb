class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.create(company_params)
    redirect_to @company, notice: "Empresa criada com sucesso."
  end

  private

  def company_params
    params.require(:company).permit(:name, :location, :email, :phone)
  end
end