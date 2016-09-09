require "rails_helper"

describe Comment do
  it { should belong_to :deed }
  it { should validate_presence_of :content }
  it { should validate_presence_of :author }
end
