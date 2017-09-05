class Company < User
  has_many :offers
  store :properties, accessors: [:description, :employees, :vacancies, :contact_email, :title], coder: JSON
end
