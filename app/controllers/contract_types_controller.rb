class ContractTypesController < ApplicationController
  before_action :set_contract_type, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def new
    @contract_type = ContractType.new
  end

  def create
    @contract_type = ContractType.create!(contract_type_params)
    respond_with @contract_type
  end

  def update
    @contract_type.update(contract_type_params)
    respond_with @contract_type
  end

  private

  def contract_type_params
    params.require(:contract_type).permit(:name)
  end

  def set_contract_type
    @contract_type = ContractType.find(params[:id])
  end
end
