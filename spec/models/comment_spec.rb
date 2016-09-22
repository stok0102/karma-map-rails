require "rails_helper"

describe Comment do
  it { should belong_to :deed }
  it { should belong_to :account }
  it { should validate_presence_of :content }
end
