module Api
  class CategoriesController < ApplicationController
    before_action :set_category, only: :show

    def show
      @category_decorator = CategoryDecorator.new(@category)
      respond_with @category_decorator
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
end
