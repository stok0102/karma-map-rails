require 'rails_helper'

describe "the delete a comment process" do
  it "deletes a comment", js: true do
    user = FactoryGirl.create(:user)
    account = FactoryGirl.create(:account, user_id: user.id)
    login_as(user, :scope => :user)
    deed = FactoryGirl.create(:deed, :account_id => account.id)
    comment = FactoryGirl.create(:comment, deed_id: deed.id, account_id: account.id)
    visit deed_path(deed)
    click_on "Delete Comment"
    expect(page).to have_content('There are no comments yet!

')
  end
end
