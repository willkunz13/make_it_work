class Project <ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
        has_many :contestant_projects
	has_many :contestants, through: :contestant_projects
	def contestants_count
		contestants.size
	end	
		
	def average_exp
		if contestants.size != 0
			experience = contestants.sum {|contestant| contestant.years_of_experience} 			/ contestants.size.to_f
			experience.round(2)
		else
			0
		end
	end
end
