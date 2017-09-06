class Customer < User
  has_many :applicants
  store :properties, accessors: [:skills, :motivation_letter, :experience, :full_name], coder: JSON
  validates_presence_of :skills, :motivation_letter, :experience, :full_name, on: [:update]
end
