class AddPageIdToSections < ActiveRecord::Migration
  def change
    add_column :sections, :page_id, :integer
    add_index :sections, :page_id
  end
end
