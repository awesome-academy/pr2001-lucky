# frozen_string_literal: true

class Admin::OrdersController < Admin::BaseController
  before_action :get_value_from_user
  def index
    @orders = @user.order
  end

  def show
    @order = @user.orders.find(params[:id])
  end

  private

  def get_value_from_user
    @user = User.find(params[:user_id])
  end
end
