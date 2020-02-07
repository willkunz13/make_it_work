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
	it "displays a count of the number of contestants on a project" do
		challenge = Challenge.create(theme: "nautical", project_budget: 900)
                project1 = Project.create(name: "dress", material: "fishnet, rope, tarp", challenge_id: challenge.id)
                project2 = Project.create(name: "raft", material: "carboard, duct-tape", challenge_id: challenge.id)
		contestant1 = Contestant.create(name: "Fred", age: 20, hometown: "New York", years_of_experience: 1)
                contestant2 = Contestant.create(name: "Caroll", age: 27, hometown: "Chicago", years_of_experience: 12)
		contestant3 = Contestant.create(name: "Ladasha", age: 20, hometown: "New York", years_of_experience: 1)
		project2.contestants << contestant1
		project2.contestants << contestant2
		project2.contestants << contestant3
                visit "/projects/#{project2.id}"
		expect(page).to have_content("3")
		contestant4 = Contestant.create(name: "Caroll", age: 27, hometown: "Chicago", years_of_experience: 12)
		project2.contestants << contestant4
                visit "/projects/#{project2.id}"
		expect(page).to_not have_content("3")
		expect(page).to have_content("4")
	end
        it "displays average experience of contestants" do
                challenge = Challenge.create(theme: "nautical", project_budget: 900)
                project1 = Project.create(name: "dress", material: "fishnet, rope, tarp", challenge_id: challenge.id)
                project2 = Project.create(name: "raft", material: "carboard, duct-tape", challenge_id: challenge.id)
                contestant1 = Contestant.create(name: "Fred", age: 20, hometown: "New York", years_of_experience: 1)
                contestant2 = Contestant.create(name: "Caroll", age: 27, hometown: "Chicago", years_of_experience: 12)
                contestant3 = Contestant.create(name: "Ladasha", age: 20, hometown: "New York", years_of_experience: 1)
                project2.contestants << contestant1
                project2.contestants << contestant2
                project2.contestants << contestant3
                visit "/projects/#{project2.id}"
		expect(page).to have_content("4.67")
                contestant4 = Contestant.create(name: "Caroll", age: 27, hometown: "Chicago", years_of_experience: 12)
                project2.contestants << contestant4
                visit "/projects/#{project2.id}"
		expect(page).to have_content("6.5")
        end
end
