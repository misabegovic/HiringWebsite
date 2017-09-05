class Applicant < ApplicationRecord
  belongs_to :offer
  belongs_to :customer
end
