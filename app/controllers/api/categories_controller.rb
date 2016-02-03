class Api::CategoriesController < ApplicationController
  before_action :set_category, only: :show

  def show
    @categoryD = CategoryDecorator.new(@category)
    respond_with @categoryD
  end

  def index
    @categories = Category.all
    respond_with @categories
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
