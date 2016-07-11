class SystemMailer < ApplicationMailer
  def send_email(users, body, file)
    @users = users
    @body = body

    attachments[file.original_filename] = File.read("#{file.path}")

    mail to: @users.pluck(:email)
  end
end
