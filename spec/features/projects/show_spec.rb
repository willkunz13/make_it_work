require 'rails_helper'

RSpec.describe "On show page" do
	it "displays project's name and material as well as theme" do
		challenge = Challenge.create(theme: "nautical", project_budget: 900)
		project1 = Project.create(name: "dress", material: "fishnet, rope, tarp", challenge_id: challenge.id)
		project2 = Project.create(name: "raft", material: "carboard, duct-tape", challenge_id: challenge.id)
		visit "/projects/#{project1.id}"
		expect(page).to have_content("dress")
		expect(page).to have_content("fishnet, rope, tarp")
		expect(page).to have_content("nautical")
	end
end
