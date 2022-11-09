class CreateMatchDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :match_donations do |t|
      t.references :donor, null: false, foreign_key: true
      t.float :max_amount
      t.boolean :active, default: true
      t.float :per_donor_amount
      t.float :per_dollar_amount

      t.timestamps
    end
  end
end
