class TeamsController < ApplicationController
  def new
    @draft = Draft.find(params[:draft_id])
  end

  def create
    @draft = Draft.find(params[:draft_id])
    counter = 0
    @draft.num_teams.times do |draft_position|
      @draft.teams.create(name: params[:team][counter],
                          draft_position: draft_position + 1)
      counter += 1
    end
    if @draft.save
      redirect_to draft_path(@draft)
    else
      redirect_to new_draft_path
    end
  end
end
