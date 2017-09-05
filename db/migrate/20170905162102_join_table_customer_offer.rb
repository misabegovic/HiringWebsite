class JoinTableCustomerOffer < ActiveRecord::Migration[5.1]
  def change
    create_join_table :Customers, :Offers do |t|
      t.index [:customer_id, :offer_id]
      t.index [:offer_id, :customer_id]
    end
  end
end