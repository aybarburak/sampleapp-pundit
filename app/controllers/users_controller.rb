class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    flash[:notice] = 'User deleted'
    @user.destroy
    redirect_to users_path
  end
end