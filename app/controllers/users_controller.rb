class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, only: [:destroy]

  def index
    @users = User.all
    @users = @users.page(params[:page])
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    flash[:notice] = 'User deleted'
    @user.destroy
    redirect_to users_path
  end

  def send_email
    content = params[:email_form][:content]

    SystemMailer.send_email(User.all, content).deliver_now

    redirect_to users_path
  end
end