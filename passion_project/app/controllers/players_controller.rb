class PlayersController < ApplicationController
  def show
    @draft = Draft.find(params[:draft_id])
    p '*' * 100
    p @draft
    @team = Team.find_by(draft_position: @draft.current_team)
    @player = Player.find_by(id: 1)
  end

end
