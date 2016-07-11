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

    file =  params[:email_form][:file]

    SystemMailer.send_email(User.all.where.not(id: current_user.id, rank: 1), content, file).deliver_now

    redirect_to users_path
  end
end