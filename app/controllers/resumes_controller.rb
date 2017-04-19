class ResumesController < ApplicationController
  before_action :authenticate_user!

  def new
    @resume = Resume.new
    @job = Job.find(params[:job_id])
  end

  def create
    @resume = Resume.new(resume_params)
    @job = Job.find(params[:job_id])
    @resume.job = @job
    @resume.user = current_user
    if @resume.save
      redirect_to jobs_path
    else
      render :new
    end
  end

  private
  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end
end
