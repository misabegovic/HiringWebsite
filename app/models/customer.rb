class Customer < User
  store :properties, accessors: [:skills, :motivation_letter, :experience], coder: JSON
end
