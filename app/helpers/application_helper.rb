module ApplicationHelper
	def error_messages_for(object)
		render partial: 'application/error_messages_for', locals: {object: object} 
	end
end
