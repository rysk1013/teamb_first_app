class TeamsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)
    if @team.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team)
    .permit(:name, :intro, :content, :team_lim, :member_lim)
    .merge(user_id: current_user.id)
  end
end
