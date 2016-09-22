class Comment < ActiveRecord::Base
  belongs_to :deed
  belongs_to :account

  validates :content, :presence => true
end
