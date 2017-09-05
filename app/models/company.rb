class Company < User
  has_many :offers
  store :properties, accessors: [:description, :employees, :contact_email, :title], coder: JSON
end
