class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :find_job, only: [:show, :update, :edit, :destroy, :publish, :hide]
  before_action :require_is_admin
  layout "admin"

  def publish
    @job.publish!
    redirect_to :back
  end

  def hide
    @job.hide!
    redirect_to :back
  end

  def index
    @jobs = Job.all
  end

  def show
    @resumes = @job.resumes 

  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @job.update(job_params)
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to admin_jobs_path

  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end

  def find_job
    @job = Job.find(params[:id])
  end
end
