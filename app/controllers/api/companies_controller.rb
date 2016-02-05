module Api
  class CompaniesController < ApplicationController
    before_action :set_company, only: :show

    def show
      @company_decorator = CompanyDecorator.new(@company)
      respond_with @company_decorator
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
end
