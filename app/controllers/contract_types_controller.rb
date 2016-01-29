class ContractTypesController < ApplicationController
  def show
    @contract_type = ContractType.find(params[:id])
  end
end
