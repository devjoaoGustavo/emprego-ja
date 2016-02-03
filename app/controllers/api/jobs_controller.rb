class Api::JobsController < ApplicationController

  def show
    @job = Job.find(params[:id])
    respond_with @job
  end

  def index
    @jobs = Job.all
    respond_with @jobs
  end

end
