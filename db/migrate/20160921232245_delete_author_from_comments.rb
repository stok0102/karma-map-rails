class DeleteAuthorFromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :author, :string
  end
end
