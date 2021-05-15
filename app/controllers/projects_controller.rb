class ProjectsController < ApplicationController

  def index
    @project = Project.includes(:users).order('created_at DESC')
  end

  def projectsList
      joinList = JoinList.where(user_id: current_user.id)
      @project = []

      joinList.each do |l|
        array = Project.where(id: l.project_id)
        @project << array
      end
  end

  def projectsRequest
    joinRequest = JoinRequest.where(user_id: current_user.id)
    @project = []
    joinRequest.each do |r|
      hash = Project.where(id: r.project_id)
      @project << array
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