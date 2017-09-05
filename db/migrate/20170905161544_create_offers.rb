class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :position
      t.integer :salary
      t.string :type_of_contract
      t.belongs_to :company, class: "Company"

      t.timestamps
    end
  end
end
