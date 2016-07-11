# Preview all emails at http://localhost:3000/rails/mailers/system_mailer
class SystemMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/system_mailer/send_email
  def send_email
    users = User.all.where(rank: 0)
    body = "Test body"
    SystemMailer.send_email(users, body)
  end

end
