class JobsController < ApplicationController
  before_action :set_companies, only: [:new, :create]
  before_action :set_categories, only: [:new, :create]

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job, notice: "Vaga criada com sucesso."
    else
      flash[:error] = "Erro! Nenhum do campos pode estar vazio."
      render :new
    end
  end

  private

  def set_companies
    @companies = Company.all
  end

  def set_categories
    @categories = Category.all
  end

  def job_params
    params.require(:job).permit(:title, :location, :description, :category_id, :company_id, :featured)
  end
end
