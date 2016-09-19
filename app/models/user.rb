class User < ApplicationRecord
  validates_presence_of :email
  validates_presence_of :encrypted_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :account
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
