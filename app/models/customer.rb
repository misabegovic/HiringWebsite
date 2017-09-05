class Customer < User
  has_and_belongs_to_many :offers, join_table: "Customers_Offers"
  store :properties, accessors: [:skills, :motivation_letter, :experience, :contact_email, :full_name], coder: JSON
end
