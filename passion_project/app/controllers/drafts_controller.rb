class DraftsController < ApplicationController
  def new
  end

  def show
    @full_teams ||= false
    @draft = Draft.find(params[:id])
    @team = Team.where(draft_id: @draft.id).where(draft_position: 1)
    @draftee = Draftee.first#FIXME
    # @draftee = Draftee.new
    # p '*' * 100
    # p params
    @draft = Draft.find(params[:id])
    @team = Team.where(draft_id: @draft.id).where(draft_position: 1)
    # @team.name
    if full_teams?(@draft.id)
      @full_teams = true
    end
    p 'YOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO'
    p @draft.current_team
    p @draft.num_teams
    if @draft.current_team > @draft.num_teams
      @draft.current_team = 1
      @draft.save
    end
    @team = Team.where(draft_id: @draft.id).find_by(draft_position: @draft.current_team)
    # if request.xhr?
      # render :json => {full_teams: @full_teams, team_name: @team.name}
      # {full_teams: @full_teams, team_name: @team.name}.to_json
      # render :json => @team
      # @team.to_json(:only => [:id, :name])
      @draftees = Draftee.where(team_id: @team.id)
      current_team = @draftees.all.map do |draftee|
        Player.find(draftee.player_id)
      end
      # render :json => current_team
      # current_team.to_json(:only => [:id, :name])
      # @draftees = Draftee.where(team_id: nil)
      # available_players = []
      # available_players = @draftees.all.map do |draftee|
      #   Player.find(draftee.player_id)
      # end
      available_players = Player.order(points: :desc)
      # p '*' * 100
      # p available_players
      # p '*' * 100 
      # p @team.name
      @props = {
        available_players: available_players, 
        current_team:      current_team,
        picking_team:      @team, 
        full_teams:        @full_teams, 
        draft:             @draft
      }

      # p @presenter
      # @presenter[:available_players].each do |player|
      #   p player.name
      # end
      # render :json => available_players
      # available_players.to_json(:only => [:id, :name])
    # else
      # redirect_to draft_path
    # end
  end

  def update
    p 'X' * 100
    p params[:player_id]
    p params[:id]
    params.require(:player_id)
    params.require(:id)

    @draft = Draft.find(params[:id])
    @player = Player.find(params[:player_id])
    @draftee = Draftee.where(draft_id: @draft.id).find_by(player_id: @player.id)
    @team = Team.find_by(draft_position: @draft.current_team, draft_id: @draft.id)
    p 'X' * 100
    p @team
    @draftee.team_id = @team.id
    @draftee.save
    @user = auth_current_user
    @draft.current_team += 1
    if @draft.save
      if @draft.current_team > @draft.num_teams
        p 'yooooooooooooooooooooooooooo'
        @draft.current_team = 1
        @draft.save
      end
      p @draft.id
      if full_teams?(@draft.id)
      p 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzz'
        @full_teams = true
      end
      render :json => @draft.as_json(include:[:players])
    else
      render :json => {error: @draft.errors.full_messages.join(',')}, status: 400
    end
    # redirect_to draft_path
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
