require 'rails_helper'

describe "the edit a deed process" do
  it "edits a deed" do
    deed = Deed.create(:content => 'Washed behind my ears', :location => "Siberia")
    visit deed_path(deed)
    click_on 'Edit'
    fill_in 'Content', :with => 'Cleaned my room'
    click_on 'Update Deed'
    expect(page).to have_content 'Cleaned my room'
  end

  it "gives error when no description is entered" do
    deed = Deed.create(:content => 'Washed behind my ears', :location => "Siberia")
    visit deed_path(deed)
    click_on 'Edit'
    fill_in 'Content', :with => ''
    click_button 'Update Deed'
    expect(page).to have_content 'errors'
  end
end
