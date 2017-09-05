class CreateApplicants < ActiveRecord::Migration[5.1]
  def change
    create_table :applicants do |t|
      t.references :offer, foreign_key: true
      t.belongs_to :customer, class: "Customer"

      t.timestamps
    end
  end
end
