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
    @job = Job.create(job_params)
    respond_with @job
  end

  def update
    @job.update(job_params)
    respond_with @job
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
