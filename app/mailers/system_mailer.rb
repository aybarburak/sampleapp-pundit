class SystemMailer < ApplicationMailer
  def send_email(users, body)
    @users = users
    @body = body

    mail to: @users.pluck(:email)
  end
end
