# class ProjectsController < ApplicationController
#   before_action :authenticate_user!, only: [:new, :create, :edit, :update]
#   before_action :new_project, only: [:new, :create]

#   def index
#     @projects = Projects.includes(:user).order(created_at: :DESC)
#   end

#   def new
#   end

#   def create
#     if @project.save
#       redirect_to root_path
#     else
#       render :new
#     end
#   end

#   def show
#   end

#   def edit
#   end

#   def update
#     @project.update(item_params)
#     if @project.save
#       redirect_to action: :show
#     else
#       render :edit
#     end
#   end

#   private

#   def project_params
#     params.require(:project)
#     .permit(:name, :intro, :content, :project_lim, :member_lim)
#     .merge(user_id: current_user.id)
#   end

#   def new_project
#     @project = project.new
#   end
# end
