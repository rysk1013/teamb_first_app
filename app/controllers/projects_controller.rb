class ProjectsController < ApplicationController

  def index
    @project = Project.order('created_at DESC')
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      current_user.join_lists.create(project_id: @project.id)
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @project = Project.find(params[:id])
    @join_request = @project.join_requests
    @join_list = @project.join_lists
  end

  def edit
  end

  def update
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :member_lim, :project_lim, :content).merge(user_id: current_user.id)
  end
end