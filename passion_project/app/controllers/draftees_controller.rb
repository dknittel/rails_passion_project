class DrafteesController < ApplicationController
  def new
    @draftee = Draftee.new
    @draft = Draft.find(params[:id])
    @team = Team.where(draft_id: @draft.id).where(draft_position: 1)
    if full_teams?(@draft.id)
      @full_teams = true
    end
    if @draft.current_team > @draft.num_teams
      @draft.current_team = 1
      @draft.save
    end
    @team = Team.where(draft_id: @draft.id).find_by(draft_position: @draft.current_team)
    if request.xhr?
      {full_teams: @full_teams, team_name: @team.name}.to_json
    else
      redirect_to draft_path
    end
  end

  def index
    @draft = Draft.find(params[:draft_id])
  end

  # def update
  #   @draft = Draft.find(params[:id])
  #   @player = Player.find_by(points_rank: params[:player_id])
  #   @draftee = Draftee.where(draft_id: @draft.id).find_by(player_id: @player.id)
  #   @team = Team.find_by(draft_position: @draft.current_team, draft_id: @draft.id)
  #   @draftee.team_id = @team.id
  #   @draftee.save
  #   @user = auth_current_user
  #   @draft.current_team += 1
  #   @draft.save
  #   redirect_to draft_path
  # end
end
