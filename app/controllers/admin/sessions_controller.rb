# frozen_string_literal: true

class Admin::SessionsController < ApplicationController
  layout 'admin/application'

  include Admin::SessionsHelper

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user &.authenticate(params[:session][:password])
      log_in_admin(user)
      redirect_to admin_categories_path
    else
      flash[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    log_out_admin if logged_in_admin?
    redirect_to admin_path
  end
end
