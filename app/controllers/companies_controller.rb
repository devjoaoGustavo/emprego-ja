class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update]
  def new
    @company = Company.new
  end

  def show
  end

  def edit
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

  def update
    if @company.update(company_params)
      redirect_to @company, notice: "Empresa alterada com sucesso."
    else
      flash[:error] = "Erro! Nenhum dos campos pode ser vazio."
      render :edit
    end
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :location, :email, :phone)
  end
end
