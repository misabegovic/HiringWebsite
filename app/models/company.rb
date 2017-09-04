class Company < User
  store :properties, accessors: [:description, :number_of_employees, :number_of_vacancies], coder: JSON
end
