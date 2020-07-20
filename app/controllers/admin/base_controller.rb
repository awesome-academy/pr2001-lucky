# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  protect_from_forgery with: :exception

  layout 'admin/application'

  include Admin::SessionsHelper

  before_action :authenticate_user

  def authenticate_user
    redirect_to admin_path unless session[:current_admin_id]
  end
end
