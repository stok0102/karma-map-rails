class CreateDeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :deeds do |t|
      t.string :content
      t.string :location

      t.timestamps
    end
  end
end
