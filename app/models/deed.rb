class Deed < ActiveRecord::Base
  has_many :comments
  validates :content, :presence => true
  validates :location, :presence => true
end
