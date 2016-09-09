class Deed < ActiveRecord::Base
  validates :content, :presence => true
  validates :location, :presence => true
end
