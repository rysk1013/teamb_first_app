class JoinListsController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
    @joinList = JoinList.where(project_id: @project.id)
  end

end
