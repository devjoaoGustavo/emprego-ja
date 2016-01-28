class JobsController < ApplicationController
  before_action :set_companies, only: [:new, :create, :edit, :update]
  before_action :set_categories, only: [:new, :create, :edit, :update]
  before_action :set_job, only: [:edit, :show, :update]
  before_action :authenticate_user!, except: :show

  def show
  end

  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to @job, notice: "Vaga criada com sucesso."
    else
      flash[:error] = "Erro! Nenhum dos campos pode estar vazio."
      render :new
    end
  end

  def update
    if @job.update(job_params)
      redirect_to @job, notice: "Vaga alterada com sucesso."
    else
      flash[:error] = "Erro! Nenhum dos campos pode estar vazio."
      render :edit
    end
  end

  private

  def set_companies
    @companies = Company.all
  end

  def set_categories
    @categories = Category.all
  end

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :location, :description, :category_id, :company_id, :featured)
  end
end
