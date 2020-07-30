# frozen_string_literal: true

class Admin::UsersController < Admin::BaseController
  before_action :get_value_user, only: %i[edit update]
  include Admin::SessionsHelper
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in_admin(@user)
      flash[:success] = 'User created successfuly'
      redirect_to admin_login_path
    else
      flash[:danger] = 'User cound not create'
      render :new
    end
  end

  def edit; end

  def update
    if user.update(user_params)
      flash[:success] = 'update successfuly'
      redirect_to admin_login_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :user_name, :email, :password, :password_confirmation,:sex ,:birth
  end

  def get_value_user
    @user = User.find(params[:id])
  end
end
