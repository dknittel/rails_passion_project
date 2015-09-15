class PlayersController < ApplicationController
  def show
    @draft = Draft.find(params[:draft_id])
    @team = Team.find_by(draft_position: @draft.current_team)
    @player = Player.find(params[:id])
  end

end
