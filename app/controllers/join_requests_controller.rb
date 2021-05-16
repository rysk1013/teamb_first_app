class JoinRequestsController < ApplicationController

  def index
    @joinRequest = JoinRequest.where(project_id: params[:project_id])
  end

  def create
    current_user.join_requests.create(project_id: join_request_params[:project_id])
    redirect_to project_path(join_request_params[:project_id])
  end

  def destroy
    if /^[+-]?[0-9]+$/ =~ params[:id]
      @request = JoinRequest.find(params[:id])
    else
      @request = JoinRequest.find_by(user_id: current_user.id)
    end
    @request.destroy
    @project = Project.find(params[:project_id])
    redirect_to project_path(@project.id)
  end

  private

  def join_request_params
    params.permit(:project_id)
  end


end

