class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 # attr_accessible :email, :first_name, :last_name, :password, :password_confirmation

  validates :email, :presence => true, :uniqueness => true
end
