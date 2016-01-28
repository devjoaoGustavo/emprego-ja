class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: :show
  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: "Categoria criada com sucesso."
    else
      flash[:error] = "Erro! Nome da categoria não pode ser vazio."
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
