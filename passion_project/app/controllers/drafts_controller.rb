class DraftsController < ApplicationController
  def new
  end

  def show
    @draft = Draft.find(params[:id])
    @team = Team.where(draft_id: @draft.id).where(draft_position: 1)
    @draftee = Draftee.first#FIXME
    @draftee = Draftee.new
    p '*' * 100
    p params
    @draft = Draft.find(params[:id])
    @team = Team.where(draft_id: @draft.id).where(draft_position: 1)
    # @team.name
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
      # redirect_to draft_path
    end
  end

def create
  user = auth_current_user
  pool = Pool.find_by(name: params[:draft][:pool])
  @draft = user.drafts.new(draft_params)
  @draft.current_team = 1
  @draft.pool_id = pool.id
  @draft.save

  if @draft.save
    redirect_to new_draft_team_path(@draft)
  else
    redirect_to new_draft_path
  end
end

private

def draft_params
  params.require(:draft).permit(:num_teams)
end
end
