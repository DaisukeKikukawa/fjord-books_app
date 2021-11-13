# frozen_string_literal: true

class UsersController < ApplicationController
  PER = 5
  def index
    @users = User.order(:id).page(params[:page]).per(PER)
  end

  def show
    @user = User.find(params[:id])
  end
end
