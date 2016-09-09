class Comment < ActiveRecord::Base
  belongs_to :deed

  validates :author, :presence => true
  validates :content, :presence => true
end
