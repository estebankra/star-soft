class UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @q = User.ransack(params[:q])
    @users = @q.result.page params[:page]
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.permission_level = params[:user][:permission_level]
    user.save
    redirect_to users_url
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    redirect_to users_url
  end
end
