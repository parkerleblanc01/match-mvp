class CreateGeneratedDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :generated_donations do |t|
      t.float :amount
      t.references :match_donation, null: false, foreign_key: true
      t.references :single_donation, null: false, foreign_key: true
      t.references :donor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
