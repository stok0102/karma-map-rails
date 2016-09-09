require 'rails_helper'

describe "the add a comment process" do
  it "adds a new comment" do
    deed = Deed.create(:content => 'Washed behind my ears', :location => "Siberia")
    visit deed_path(deed)
    click_on "Add a comment"
    fill_in 'Author', :with => 'Theresa'
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
