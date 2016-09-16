require 'rails_helper'

describe 'the edit account process' do
  it "should edit account if all parameters are filled out" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    account = FactoryGirl.create(:account, user_id: user.id)
    visit edit_account_path(account)
    fill_in 'Username', :with => 'Bront'
    click_on 'Update Account'
    expect(page).to have_content 'Bront'
  end

  it "should not update account if given blank parameters" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    account = FactoryGirl.create(:account, user_id: user.id)
    visit edit_account_path(account)
    fill_in 'Username', :with => ''
    click_on 'Update Account'
    expect(page).to have_content 'Edit Profile'
  end
end
