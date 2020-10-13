class PlayersController < ApplicationController

  def new
    @team = Team.find(params[:team_id])
    @coordinator = Coordinator.find(params[:coordinator_id])
    @player = @coordinator.players.new
    render :new
  end

  def create
    @team = Team.find(params[:team_id])
    @coordinator = Coordinator.find(params[:coordinator_id])
    @player = @coordinator.players.new(player_params)
    if @player.save
      redirect_to team_coordinator_path(@team, @coordinator)
    else
      render :new
    end
  end

  def show
    @team = Team.find(params[:team_id])
    @coordinator = Coordinator.find(params[:coordinator_id])
    @player = Player.find(params[:id])
    render :show
  end

  def edit
    @team = Team.find(params[:team_id])
    @coordinator = Coordinator.find(params[:coordinator_id])
    @player = Player.find(params[:id])
    render :edit
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to team_coordinator_player_path(@player.coordinator.team, @player.coordinator, @player)
    else
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to team_coordinator_path(@player.coordinator.team, @player.coordinator)
  end

  private
    def player_params
      params.require(:player).permit(:name, :phone, :email)
    end
end