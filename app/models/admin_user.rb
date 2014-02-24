class AdminUser < ActiveRecord::Base

	#to configure a different table name
	#set_table_name('admin_users')
	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits

	scope :sorted, lambda {order('last_name ASC, first_name ASC')}

	def full_name
		first_name + " " +  last_name
	end
end
