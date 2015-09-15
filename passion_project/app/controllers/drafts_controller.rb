class DraftsController < ApplicationController
  def new
  end

  def show
    @full_teams ||= false
    @draftee = Draftee.first
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
    @draftees = Draftee.where(team_id: @team.id)
    current_team = @draftees.all.map do |draftee|
      Player.find(draftee.player_id)
    end
    available_players = Player.order(points: :desc)
    @props = {
      available_players: available_players, 
      current_team:      current_team,
      picking_team:      @team, 
      full_teams:        @full_teams, 
      draft:             @draft
    }
  end

  def update
    params.require(:player_id)
    params.require(:id)

    @draft = Draft.find(params[:id])
    @player = Player.find(params[:player_id])
    @draftee = Draftee.where(draft_id: @draft.id).find_by(player_id: @player.id)
    @team = Team.find_by(draft_position: @draft.current_team, draft_id: @draft.id)
    @draftee.team_id = @team.id
    @draftee.save
    @user = auth_current_user
    @draft.current_team += 1
    if @draft.save
      if @draft.current_team > @draft.num_teams
        @draft.current_team = 1
        @draft.save
      end
      if full_teams?(@draft.id)
        @full_teams = true
      end
      render :json => @draft.as_json(include:[:players])
    else
      render :json => {error: @draft.errors.full_messages.join(',')}, status: 400
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
