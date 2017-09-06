class Offer < ApplicationRecord
  belongs_to :company
  has_many :applicants
  validates_presence_of :position, :salary, :type_of_contract
  validates_length_of :position, :type_of_contract, minimum: 4
end
