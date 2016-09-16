class AddAccountsToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :account_id, :integer
  end
end
