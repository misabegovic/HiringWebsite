class Offer < ApplicationRecord
  belongs_to :company
  has_and_belongs_to_many :customers, join_table: "Customers_Offers"
end
