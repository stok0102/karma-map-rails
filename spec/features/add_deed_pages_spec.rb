require 'rails_helper'

describe "the add a deed process" do
  it "adds a new deed" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    account = FactoryGirl.create(:account)
    account.user_id = user.id
    visit new_deed_path
    fill_in 'Content', :with => 'Said gesundheit'
    fill_in 'Location', :with => 'Toronto'
    click_on 'Create Deed'
    expect(page).to have_content 'Deeds'
  end

  it "gives error when no name is entered" do
    visit new_deed_path
    click_on 'Create Deed'
    expect(page).to have_content 'errors'
  end
end
