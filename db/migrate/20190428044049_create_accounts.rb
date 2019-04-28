class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.datetime :active_at
      t.boolean :active

      t.timestamps
    end
  end
end
