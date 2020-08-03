# frozen_string_literal: true

class SessionsController < ApplicationController
  include SessionsHelper
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user &.authenticate(params[:session][:password])
      log_in_user(user) # save user_id into session
      redirect_to homepages_home_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out_user if logged_in_user?
    redirect_to root_path
  end
end
