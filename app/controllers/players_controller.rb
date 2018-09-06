class PlayersController < ApplicationController

  def create
    @player = Player.new(code: params[:player][:code])
    if @player.save
      cookies[:current_player] = @player.id
      cookies[:current_game] = @player.game.id
      redirect_to @player
    else
      flash[:alert] = @player.errors.full_messages[0]
      redirect_to root_path
    end
  end

  def show
    @player = Player.includes(:game, :conversations).find(params[:id])
    if @player.host || @player.number == "HRN"
      redirect_to current_player.game and return
    end
  end
end
