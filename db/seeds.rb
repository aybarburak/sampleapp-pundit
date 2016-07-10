# Create 15 normal Users
150.times{
  User.create! email: Faker::Internet.safe_email, password: 'password', password_confirmation: 'password'
}
# Create admin
User.create! email: 'admin@admin.com', password: 'password', password_confirmation: 'password', rank: 1