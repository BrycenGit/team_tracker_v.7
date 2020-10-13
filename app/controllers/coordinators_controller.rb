class CoordinatorsController < ApplicationController
  def new
    @team = Team.find(params[:team_id])
    @coordinator = @team.create_coordinator!
    render :new
  end

  def create
    @team = Team.find(params[:team_id])
    @coordinator = @team.coordinators.new(coordinator_params)
    if @coordinator.save
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:team_id])
    @coordinator = Coordinator.find(params[:id])
    render :show
  end

  def edit
    @team = Team.find(params[:team_id])
    @coordinator = Coordinator.find(params[:id])
    render :edit
  end

  def update
    @coordinator = Coordinator.find(params[:id])
    if @coordinator.update(coordinator_params)
      redirect_to team_path(@coordinator.team)
    else
      render :edit
    end
  end

  def destroy
    @coordinator = Coordinator.find(params[:id])
    @coordinator.destroy
    redirect_to team_path(@coordinator.team)
  end


  private
  def coordinator_params
    params.require(:coordinator).permit(:name, :email, :phone)
  end
end