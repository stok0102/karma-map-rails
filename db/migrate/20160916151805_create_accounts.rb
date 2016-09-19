class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.integer :user_id
      t.string :username
      t.timestamps
    end
  end
end
