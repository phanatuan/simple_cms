class AddSubjectIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :subject_id, :integer
    add_index :pages, :subject_id
    add_index :pages, :permalink
  end
end
