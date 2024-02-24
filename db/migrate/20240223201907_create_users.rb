class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :pronouns
      t.date :birth_date
      t.string :email
      t.integer :address_id
      t.integer :billing_address_id

      t.timestamps
    end
  end
end
