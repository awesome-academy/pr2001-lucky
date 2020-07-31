# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :get_user, only: %i[show edit update]
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in_user(@user)
      flash[:success] = 'User created successfuly'
      redirect_to user_login_path
    else
      flash[:danger] = 'User could not create '
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = 'update successfuly'
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :user_name, :email, :password, :password_confirmation, :sex, :birth
  end

  def get_user
    @user = User.find(params[:id])
  end
end
