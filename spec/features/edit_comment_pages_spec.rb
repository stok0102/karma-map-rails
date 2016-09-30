  require 'rails_helper'

describe 'the edit comment path' do
  it "allows user to edit a comment" do
    user = FactoryGirl.create(:user)
    account = FactoryGirl.create(:account, user_id: user.id)
    login_as(user, :scope => :user)
    deed = FactoryGirl.create(:deed, :account_id => account.id)
    comment = FactoryGirl.create(:comment, deed_id: deed.id, account_id: account.id)
    visit deed_path(deed)
    click_on "Edit Comment"
    fill_in "Content", :with => "This is good"
    click_on "Update Comment"
    expect(page).to have_content("This is good")
  end

  it "does not save with empty strings" do
    user = FactoryGirl.create(:user)
    account = FactoryGirl.create(:account, user_id: user.id)
    login_as(user, :scope => :user)
    deed = FactoryGirl.create(:deed, :account_id => account.id)
    comment = FactoryGirl.create(:comment, deed_id: deed.id, account_id: account.id)
    visit deed_path(deed)
    click_on "Edit Comment"
    fill_in "Content", :with => ""
    click_on "Update Comment"
    expect(page).to have_content("Content can't be blank")
  end
end
