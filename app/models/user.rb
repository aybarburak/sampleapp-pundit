class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  before_save :default_values

  RANKS = {
      0 => 'User',
      1 => 'Admin'
  }

  USER    = 0
  ADMIN   = 1

  def default_values
    self.rank ||= USER
  end
end
