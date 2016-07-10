class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Pundit

  rescue_from Pundit::NotAuthorizedError, :with => :access_denied

  private

  private
  def access_denied
    flash[:alert] = 'You are not authorized to perform this action'
    redirect_to root_path
  end
end
