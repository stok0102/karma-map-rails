require 'rails_helper'

describe 'the add account process' do
  it "should create account if all parameters are filled out" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit new_account_path
    fill_in 'Username', :with => 'Bront'
    click_on 'Create Account'
    expect(page).to have_content 'Bront'
  end

  it 'should not create account if missing parameters' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit new_account_path
    click_on 'Create Account'
    expect(page).to have_content 'New Profile'
  end
end
