require 'rails_helper'

describe 'the edit comment path' do
  it "allows user to edit a comment" do
    deed = FactoryGirl.create(:deed)
    comment = FactoryGirl.create(:comment, deed_id: deed.id)
    visit deed_path(deed)
    click_on "Edit Comment"
    fill_in "Author", :with => "Rick"
    fill_in "Content", :with => "This is good"
    click_on "Update Comment"
    expect(page).to have_content("This is good")
  end

  it "does not save with empty strings" do
    deed = FactoryGirl.create(:deed)
    comment = FactoryGirl.create(:comment, deed_id: deed.id)
    visit deed_path(deed)
    click_on "Edit Comment"
    fill_in "Author", :with => ""
    fill_in "Content", :with => ""
    click_on "Update Comment"
    expect(page).to have_content("Author can't be blank")
  end
end
