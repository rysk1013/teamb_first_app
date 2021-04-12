class ProjectsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @projects = Projects.includes(:user).order(created_at: :DESC)
  end

  def new
    @project = project.new
  end

  def create
    @project = Projects.create(project_params)
    if @project.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def project_params
    params.require(:project)
    .permit(:name, :intro, :content, :project_lim, :member_lim)
    .merge(user_id: current_user.id)
  end
end
