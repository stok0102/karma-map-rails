require "rails_helper"

describe Deed do
  it { should validate_presence_of :content }
  it { should validate_presence_of :location }
end
