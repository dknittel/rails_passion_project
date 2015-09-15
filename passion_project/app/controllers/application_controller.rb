class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
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
    p 'heyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy'
    p team = Team.where(draft_id: draft_id).first
    p Draftee.where(team_id: team.id).count
    Team.where(draft_id: draft_id).each do |team|
      if Draftee.where(team_id: team.id).count != 3
        return false
      end
    end
    true
  end
end
