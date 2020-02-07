require 'rails_helper'
  
RSpec.describe "when user visits contestants index page" do
	it "can list all contestants and their projects" do
		challenge = Challenge.create(theme: "nautical", project_budget: 900)
                project1 = Project.create(name: "dress", material: "fishnet, rope, tarp", challenge_id: challenge.id)
                project2 = Project.create(name: "raft", material: "carboard, duct-tape", challenge_id: challenge.id)
		contestant1 = Contestant.create(name: "Fred", age: 20, hometown: "New York", years_of_experience: 1)
		contestant2 = Contestant.create(name: "Caroll", age: 27, hometown: "Chicago", years_of_experience: 12)
		contestant1.projects << project1
		contestant1.projects << project2
		contestant2.projects << project2
		visit "/contestants"
		expect(page).to have_content("Fred")
		expect(page).to have_content("Caroll")
		expect(page).to have_content("dress")
		expect(page).to have_content("raft")
	end
end
