class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :address
      t.string :password_digest
      t.integer :phone_number, limit: 8

      t.timestamps
    end
  end
end
