# frozen_string_literal: true

class HomepagesController < ApplicationController
  def home
    @products = Product(created_at: :desc).limit(14).page(params[:page]).per(12)
  end
end
