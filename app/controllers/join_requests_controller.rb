class JoinRequestsController < ApplicationController

  def create
    current_user.join_requests.create(project_id: join_request_params[:project_id])
    redirect_to project_path(join_request_params[:project_id])
  end

  def destroy
    @request = JoinRequest.find_by(user_id: current_user.id)
    @request.destroy
    @project = Project.find(params[:project_id])
    redirect_to project_path(@project.id)
  end

  private
  def join_request_params
    params.permit(:project_id).merge(user_id: current_user.id)
  end


end

