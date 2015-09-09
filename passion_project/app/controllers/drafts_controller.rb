class DraftsController < ApplicationController
  def new
  end

  def show
    @draft = Draft.find(params[:id])
    @team = Team.where(draft_id: @draft.id).where(draft_position: 1)

  end

  def create
    user = auth_current_user
    @draft = user.drafts.new(draft_params)

    if @draft.save
      redirect_to new_draft_team_path(@draft)
    else
      redirect_to new_draft_path
    end
  end

private

  def draft_params
    params.require(:draft).permit(:num_teams, :current_team)
  end
end
