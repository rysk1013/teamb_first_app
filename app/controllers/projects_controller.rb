class ProjectsController < ApplicationController

  def index
    @project = Project.order('created_at DESC')
  end

  def projectsList
      joinList = JoinList.where(user_id: current_user.id)
      @project = []
      joinList.each do |l|
        @project << Project.where(id: l.project_id)
      end
  end

  def projectsJoining
    @project = Project.where(user_id: current_user.id)

    @userList = []
    @project.each do |project|
      @userList << JoinList.where(project_id: project.id).includes(:user)
    end

    @userRequest = []
    @project.each do |project|
      @userRequest << JoinRequest.where(project_id: project.id).includes(:user)
    end
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
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(@project.id)
    else
      render :edit
    end
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