class AddAccountsToDeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :deeds, :account_id, :integer
  end
end
