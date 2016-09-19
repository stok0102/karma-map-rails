require 'rails_helper'

describe Account do
  it { should validate_presence_of :username }
  it { should have_many :deeds }
  it { should have_many :comments }
end
