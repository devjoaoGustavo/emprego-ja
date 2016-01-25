class JobsController < ApplicationController
  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @companies = Company.all
  end

  def create
    @job = Job.new(job_params)
    @job.save
    redirect_to @job, notice: "Vaga criada com sucesso."
  end

  private

  def job_params
    params.require(:job).permit(:title, :location, :description, :category, :company_id, :featured)
  end
end
