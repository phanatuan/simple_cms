class AddPermalinkIndexToPages < ActiveRecord::Migration
  def change
  	add_index :pages, :permalink
  end
end
