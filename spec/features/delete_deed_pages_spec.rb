require 'rails_helper'

describe 'delete deed path' do
  it "allows user to delete deed" do
    deed = FactoryGirl.create(:deed)
    visit deed_path(deed)
    click_on "Delete"
    expect(page).to have_content('Deed has been removed')
  end
end
