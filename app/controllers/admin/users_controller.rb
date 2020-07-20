# frozen_string_literal: true

class Admin::UsersController < Admin::BaseController
  before_action :get_value_user, only: %i[edit update]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = 'User created successfuly'
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if user.update(user_params)
      flash[:success] = 'update successfuly'
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :user_name, :email, :password, :password_confirmation, :birth, :sex
  end

  def get_value_user
    @user = User.find(params[:id])
  end
end
