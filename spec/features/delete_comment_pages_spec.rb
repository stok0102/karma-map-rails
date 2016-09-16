require 'rails_helper'

describe "the delete a comment process" do
  it "deletes a comment" do
    deed = FactoryGirl.create(:deed)
    comment = FactoryGirl.create(:comment, deed_id: deed.id)
    visit deed_path(deed)
    click_on "Delete Comment"
    expect(page).to have_content('There are no comments yet!

')
  end
end
