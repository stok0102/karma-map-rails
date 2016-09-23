require 'rails_helper'

describe 'delete deed path' do
  it "allows user to delete deed" do
    user = FactoryGirl.create(:user)
    account = FactoryGirl.create(:account, user_id: user.id)
    login_as(user, :scope => :user)
    deed = FactoryGirl.create(:deed, account_id: account.id)
    visit deed_path(deed)
    click_on "Delete"
    expect(page).to have_content('Deed has been removed')
  end
end
