require 'rails_helper'

describe "the add a comment process" do
  it "adds a new comment" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    account = FactoryGirl.create(:account)
    account.user_id = user.id
    deed = FactoryGirl.create(:deed, :account_id => account.id)
    visit deed_path(deed)
    click_on "Add a comment"
    fill_in 'Content', :with => 'Said gesundheit'
    click_on 'Create Comment'
    expect(page).to have_content 'gesundheit'
  end

  it "gives error when no name is entered" do
    deed = Deed.create(:content => 'Washed behind my ears', :location => "Siberia")
    visit deed_path(deed)
    click_on "Add a comment"
    click_on 'Create Comment'
    expect(page).to have_content 'errors'
  end
end
