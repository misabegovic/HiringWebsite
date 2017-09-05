class Customer < User
  has_many :applicants
  store :properties, accessors: [:skills, :motivation_letter, :experience, :contact_email, :full_name], coder: JSON
end
