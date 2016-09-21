class Account < ApplicationRecord
  validates_presence_of :username
  has_many :comments
end
