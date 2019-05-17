class Test < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :personable_id, :integer
    add_column :people, :personable_type, :integer

    create_table :caregivers do |t|
      t.references :personable, polymorphic: true, index: true
      t.string :license_id
      t.timestamps
    end

    create_table :patients do |t|
      t.references :personable, polymorphic: true, index: true
      t.datetime :admitted_at
      t.timestamps
    end
  end
end
