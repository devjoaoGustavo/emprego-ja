class CompaniesController < ApplicationController
  def new
    @company = Company.new
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company, notice: "Empresa criada com sucesso."
    else
      flash[:error] = "Erro! Nenhum dos campos pode ser vazio."
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :location, :email, :phone)
  end
end
