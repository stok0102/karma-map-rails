class Deed < ActiveRecord::Base
  has_many :comments
  validates :content, :presence => true
  validates :location, :presence => true
  geocoded_by :location
  after_validation :geocode
end
