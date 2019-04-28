class CreateVisitItems < ActiveRecord::Migration[5.2]
  def change
    create_table :visit_items do |t|

      t.timestamps
    end
  end
end
