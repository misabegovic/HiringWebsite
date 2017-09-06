class Company < User
  has_many :offers
  store :properties, accessors: [:description, :employees, :contact_email, :title], coder: JSON
  validates_presence_of :description, :contact_email, :title, on: [:update]
  validates_format_of :contact_email, with:
                      /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i,
                      on: [:update]
end
