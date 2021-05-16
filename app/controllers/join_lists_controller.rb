class JoinListsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @joinList = JoinList.where(project_id: @project.id)
  end

  def create
    @join = JoinList.create(project_id: joinList_params[:project_id], user_id: joinList_params[:user_id])
    JoinRequest.find(joinList_params[:join_request_id]).destroy!
    redirect_to project_join_requests_path(@join.project)
  end

  def destroy
    @joinList = JoinList.find_by(user_id: current_user.id)
    @joinList.destroy
    @project = Project.find(params[:project_id])
    redirect_to root_path
  end


  private

  def joinList_params
    params.permit(:project_id, :user_id, :join_request_id)
  end

end
