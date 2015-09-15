class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  def auth_current_user
    return nil unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end


  def full_teams?(draft_id)
    Team.where(draft_id: draft_id).each do |team|
      if Draftee.where(team_id: team.id).count != 3
        return false
      end
    end
    true
  end
end
