require 'rails_helper'

RSpec.describe "search", type: :feature do
  describe "when I click griffin coffee and hit search" do
    it "will show me the closest on station" do
      visit "/"

      VCR.use_cassette("nearest_stations") do
        click_button "Find Nearest Station"
        expect(current_path).to eq("/search")
        expect(page).to have_content("Edgewater Public Market - Tesla Supercharger")
        expect(page).to have_content("Street Address: 5505 W 20th Ave")
        expect(page).to have_content("City: Edgewater")
        expect(page).to have_content("Zip Code: 80214")
        expect(page).to have_content("Access Times: 24 hours daily")
        expect(page).to have_content("Distance: 0.6394")
        expect(page).to have_content("Directions")
        expect(page).to have_content("Travel Time: 122")
        expect(page).to have_content("Head south on Sheridan Blvd (CO-95).")
        expect(page).to have_content("Go for 0.4 mi.")
        expect(page).to have_content("Turn right onto W 20th Ave.")
        expect(page).to have_content("Go for 0.2 mi.")
        expect(page).to have_content("Turn right.")
        expect(page).to have_content("Go for 420 ft. Arrive at your destination.")
      end
    end
  end
end