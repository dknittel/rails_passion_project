class UsersController < ApplicationController
  def new
  end
  def create
    user = User.new(user_params)
    password = params[:user][:password]
    confirm = params[:user][:password_confirmation]
    if password != confirm
      @form_error = 'Your passwords did not match'
      redirect_to '/signup'
    elsif User.where(login: params[:user][:login]).count != 0
      @form_error = 'This login is already taken'
      redirect_to '/signup'
    elsif user.save
      session[:user_id] = user.id
      redirect_to new_draft_path
    else
      @form_error = 'Unable to register you'
      redirect_to '/signup'
    end
  end

private

  def user_params
    params.require(:user).permit(:login, :password)
  end

end
