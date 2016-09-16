require 'rails_helper'

describe 'the show account process' do
  it "shows the account page" do
    user = FactoryGirl.create(:user)
    account = FactoryGirl.create(:account, user_id: user.id)
    visit account_path(account)
    expect(page).to have_content account.username
  end
end
